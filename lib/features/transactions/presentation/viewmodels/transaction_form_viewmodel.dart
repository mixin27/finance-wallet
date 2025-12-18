import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/create_transaction_request.dart';
import '../../data/models/transaction.dart';
import '../../data/models/transfer_request.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../providers/transaction_providers.dart';

class TransactionFormState {
  final bool isLoading;
  final String? errorMessage;
  final bool isLoadingData;

  TransactionFormState({
    this.isLoading = false,
    this.errorMessage,
    this.isLoadingData = false,
  });

  TransactionFormState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isLoadingData,
  }) {
    return TransactionFormState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isLoadingData: isLoadingData ?? this.isLoadingData,
    );
  }
}

class TransactionFormViewModel extends StateNotifier<TransactionFormState> {
  final TransactionRepository _repository;
  final Ref _ref;

  TransactionFormViewModel(this._repository, this._ref)
    : super(TransactionFormState());

  /// Load categories for the form
  Future<void> loadCategories({String? type}) async {
    state = state.copyWith(isLoadingData: true);

    final result = await _repository.getCategories(type: type);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoadingData: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (categories) {
        _ref.read(categoriesProvider.notifier).state = categories;
        state = state.copyWith(isLoadingData: false);
      },
    );
  }

  /// Create income or expense transaction
  Future<bool> createTransaction(CreateTransactionRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.createTransaction(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (transaction) {
        state = state.copyWith(isLoading: false);

        // Add to transactions list
        final transactions = _ref.read(transactionsProvider);
        _ref.read(transactionsProvider.notifier).state = [
          transaction,
          ...transactions,
        ];

        // Refresh accounts and transaction list
        // Note: Import these providers as needed
        // ref.read(accountListViewModelProvider.notifier).loadAccounts();
        // ref.read(transactionListViewModelProvider.notifier).refreshTransactions();

        return true;
      },
    );
  }

  /// Transfer money between accounts
  Future<bool> transfer(TransferRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.transfer(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (transaction) {
        state = state.copyWith(isLoading: false);

        // Add to transactions list
        final transactions = _ref.read(transactionsProvider);
        _ref.read(transactionsProvider.notifier).state = [
          transaction,
          ...transactions,
        ];

        // Refresh accounts
        // ref.read(accountListViewModelProvider.notifier).loadAccounts();

        return true;
      },
    );
  }

  /// Update transaction
  Future<bool> updateTransaction(
    String id,
    CreateTransactionRequest request,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.updateTransaction(id, request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (transaction) {
        state = state.copyWith(isLoading: false);

        // Update in local list
        final transactions = _ref.read(transactionsProvider);
        final index = transactions.indexWhere((t) => t.id == id);
        if (index != -1) {
          final updated = List<Transaction>.from(transactions);
          updated[index] = transaction;
          _ref.read(transactionsProvider.notifier).state = updated;
        }

        // Update selected transaction
        _ref.read(selectedTransactionProvider.notifier).state = transaction;

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

final transactionFormViewModelProvider =
    StateNotifierProvider.autoDispose<
      TransactionFormViewModel,
      TransactionFormState
    >((ref) {
      final repository = ref.read(transactionRepositoryProvider);
      return TransactionFormViewModel(repository, ref);
    });
