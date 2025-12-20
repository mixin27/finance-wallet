import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../../currencies/data/models/currency.dart';
import '../../../currencies/domain/repositories/currency_repository.dart';
import '../../../currencies/presentation/providers/currency_providers.dart';
import '../../data/models/account_type.dart';
import '../../data/models/create_account_request.dart';
import '../../data/models/update_account_request.dart';
import '../../domain/repositories/account_repository.dart';
import '../providers/account_providers.dart';
import 'account_list_viewmodel.dart';

class AccountFormState {
  final bool isLoading;
  final String? errorMessage;
  final bool isLoadingData;

  AccountFormState({
    this.isLoading = false,
    this.errorMessage,
    this.isLoadingData = false,
  });

  AccountFormState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isLoadingData,
  }) {
    return AccountFormState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isLoadingData: isLoadingData ?? this.isLoadingData,
    );
  }
}

class AccountFormViewModel extends StateNotifier<AccountFormState> {
  final AccountRepository _repository;
  final CurrencyRepository _currencyRepository;
  final Ref _ref;

  AccountFormViewModel(this._repository, this._currencyRepository, this._ref)
    : super(AccountFormState());

  Future<void> loadFormData() async {
    state = state.copyWith(isLoadingData: true);

    // Load account types and currencies in parallel
    final results = await Future.wait([
      _repository.getAccountTypes(),
      _currencyRepository.getCurrencies(),
    ]);

    results[0].fold(
      (failure) {
        state = state.copyWith(
          isLoadingData: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (types) {
        _ref.read(accountTypesProvider.notifier).state =
            types as List<AccountType>;
      },
    );

    results[1].fold((failure) {}, (currencies) {
      _ref.read(currenciesProvider.notifier).state =
          currencies as List<Currency>;
    });

    state = state.copyWith(isLoadingData: false);
  }

  Future<bool> createAccount(CreateAccountRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.createAccount(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (account) {
        state = state.copyWith(isLoading: false);
        // Refresh accounts list
        _ref.read(accountListViewModelProvider.notifier).loadAccounts();
        _ref.read(accountListViewModelProvider.notifier).loadAccountSummary();
        return true;
      },
    );
  }

  Future<bool> updateAccount(String id, UpdateAccountRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.updateAccount(id, request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (account) {
        state = state.copyWith(isLoading: false);
        // Update selected account
        _ref.read(selectedAccountProvider.notifier).state = account;
        // Refresh accounts list
        _ref.read(accountListViewModelProvider.notifier).loadAccounts();
        _ref.read(accountListViewModelProvider.notifier).loadAccountSummary();
        return true;
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.when(
      server: (message, statusCode) => message,
      network: (message) => message,
      cache: (message) => message,
      unauthorized: (message) => message,
      validation: (message) => message,
    );
  }
}

final accountFormViewModelProvider =
    StateNotifierProvider.autoDispose<AccountFormViewModel, AccountFormState>((
      ref,
    ) {
      final repository = ref.read(accountRepositoryProvider);
      final currencyRepository = ref.read(currencyRepositoryProvider);
      return AccountFormViewModel(repository, currencyRepository, ref);
    });
