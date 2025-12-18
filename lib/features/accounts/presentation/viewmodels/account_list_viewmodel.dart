import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/account_repository.dart';
import '../providers/account_providers.dart';

class AccountListState {
  final bool isLoading;
  final String? errorMessage;
  final bool isRefreshing;

  AccountListState({
    this.isLoading = false,
    this.errorMessage,
    this.isRefreshing = false,
  });

  AccountListState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isRefreshing,
  }) {
    return AccountListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class AccountListViewModel extends StateNotifier<AccountListState> {
  final AccountRepository _repository;
  final Ref _ref;

  AccountListViewModel(this._repository, this._ref) : super(AccountListState());

  Future<void> loadAccounts({bool includeInactive = false}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.getAccounts(
      includeInactive: includeInactive,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (accounts) {
        _ref.read(accountsProvider.notifier).state = accounts;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> loadAccountSummary() async {
    final result = await _repository.getAccountSummary();

    result.fold(
      (failure) {
        // Silently fail for summary
      },
      (summary) {
        _ref.read(accountSummaryProvider.notifier).state = summary;
      },
    );
  }

  Future<void> refreshAccounts() async {
    state = state.copyWith(isRefreshing: true);
    await loadAccounts();
    await loadAccountSummary();
    state = state.copyWith(isRefreshing: false);
  }

  Future<bool> deleteAccount(String id) async {
    final result = await _repository.deleteAccount(id);

    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (_) {
        // Refresh accounts after deletion
        loadAccounts();
        loadAccountSummary();
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

final accountListViewModelProvider =
    StateNotifierProvider<AccountListViewModel, AccountListState>((ref) {
      final repository = ref.read(accountRepositoryProvider);
      return AccountListViewModel(repository, ref);
    });
