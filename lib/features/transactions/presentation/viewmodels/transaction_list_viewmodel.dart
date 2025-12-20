import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../../categories/domain/repositories/category_repository.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../../data/models/transaction_filter.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../providers/transaction_providers.dart';

class TransactionListState {
  final bool isLoading;
  final String? errorMessage;
  final bool isRefreshing;
  final bool isLoadingMore;

  TransactionListState({
    this.isLoading = false,
    this.errorMessage,
    this.isRefreshing = false,
    this.isLoadingMore = false,
  });

  TransactionListState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isRefreshing,
    bool? isLoadingMore,
  }) {
    return TransactionListState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class TransactionListViewModel extends StateNotifier<TransactionListState> {
  final TransactionRepository _repository;
  final CategoryRepository _categoryRepository;
  final Ref _ref;

  TransactionListViewModel(
    this._repository,
    this._categoryRepository,
    this._ref,
  ) : super(TransactionListState());

  /// Load transactions with filters
  Future<void> loadTransactions({
    String? accountId,
    String? categoryId,
    bool resetPage = true,
    bool forceRefresh = false,
  }) async {
    if (resetPage) {
      _ref.read(currentPageProvider.notifier).state = 0;
      _ref.read(transactionsProvider.notifier).state = [];
      state = state.copyWith(isLoading: true, errorMessage: null);
    } else {
      state = state.copyWith(isLoadingMore: true);
    }

    final currentPage = _ref.read(currentPageProvider);
    final typeFilter = _ref.read(transactionTypeFilterProvider);
    final dateRange = _ref.read(dateRangeFilterProvider);

    final filter = TransactionFilter(
      accountId: accountId,
      categoryId: categoryId,
      type: typeFilter,
      startDate: dateRange?.start,
      endDate: dateRange?.end,
      page: currentPage,
      size: 20,
    );

    final result = await _repository.getTransactions(
      filter,
      forceRefresh: forceRefresh,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          isLoadingMore: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (page) {
        final currentTransactions = _ref.read(transactionsProvider);
        final newTransactions = resetPage
            ? page.content
            : [...currentTransactions, ...page.content];

        _ref.read(transactionsProvider.notifier).state = newTransactions;
        _ref.read(hasMorePagesProvider.notifier).state = !page.last;

        state = state.copyWith(isLoading: false, isLoadingMore: false);
      },
    );
  }

  /// Load more transactions (pagination)
  Future<void> loadMore({String? accountId, String? categoryId}) async {
    final hasMore = _ref.read(hasMorePagesProvider);
    if (!hasMore || state.isLoadingMore) return;

    _ref.read(currentPageProvider.notifier).state++;
    await loadTransactions(
      accountId: accountId,
      categoryId: categoryId,
      resetPage: false,
      forceRefresh: true,
    );
  }

  /// Refresh transactions
  Future<void> refreshTransactions({
    String? accountId,
    String? categoryId,
  }) async {
    state = state.copyWith(isRefreshing: true);
    await loadTransactions(
      accountId: accountId,
      categoryId: categoryId,
      resetPage: true,
      forceRefresh: true,
    );
    state = state.copyWith(isRefreshing: false);
  }

  /// Load categories for filters
  Future<void> loadCategories() async {
    final result = await _categoryRepository.getCategories();

    result.fold(
      (failure) {
        // Silently fail for categories
      },
      (categories) {
        _ref.read(allCategoriesProvider.notifier).state = categories;
      },
    );
  }

  /// Filter by transaction type
  Future<void> filterByType(
    String? type, {
    String? accountId,
    String? categoryId,
  }) async {
    _ref.read(transactionTypeFilterProvider.notifier).state = type;
    await loadTransactions(accountId: accountId, categoryId: categoryId);
  }

  /// Filter by date range
  Future<void> filterByDateRange(
    DateTimeRange? range, {
    String? accountId,
    String? categoryId,
  }) async {
    _ref.read(dateRangeFilterProvider.notifier).state = range;
    await loadTransactions(accountId: accountId, categoryId: categoryId);
  }

  /// Clear all filters
  Future<void> clearFilters({String? accountId, String? categoryId}) async {
    _ref.read(transactionTypeFilterProvider.notifier).state = null;
    _ref.read(dateRangeFilterProvider.notifier).state = null;
    await loadTransactions(accountId: accountId, categoryId: categoryId);
  }

  /// Delete transaction
  Future<bool> deleteTransaction(String id) async {
    final result = await _repository.deleteTransaction(id);

    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (_) {
        // Remove from local list
        final transactions = _ref.read(transactionsProvider);
        _ref.read(transactionsProvider.notifier).state = transactions
            .where((t) => t.id != id)
            .toList();

        // Refresh accounts to update balances
        // Note: You'll need to import account viewmodel
        // ref.read(accountListViewModelProvider.notifier).loadAccounts();

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

final transactionListViewModelProvider =
    StateNotifierProvider<TransactionListViewModel, TransactionListState>((
      ref,
    ) {
      final repository = ref.read(transactionRepositoryProvider);
      final categoryRepository = ref.read(categoryRepositoryProvider);
      return TransactionListViewModel(repository, categoryRepository, ref);
    });
