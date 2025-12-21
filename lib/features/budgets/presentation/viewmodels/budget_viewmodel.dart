import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/budget.dart';
import '../../data/models/create_budget_request.dart';
import '../../data/models/update_budget_request.dart';
import '../../domain/repositories/budget_repository.dart';
import '../providers/budget_providers.dart';

class BudgetState {
  final bool isLoading;
  final String? errorMessage;
  final bool isRefreshing;

  BudgetState({
    this.isLoading = false,
    this.errorMessage,
    this.isRefreshing = false,
  });

  BudgetState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isRefreshing,
  }) {
    return BudgetState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class BudgetViewModel extends StateNotifier<BudgetState> {
  final BudgetRepository _repository;
  final Ref _ref;

  BudgetViewModel(this._repository, this._ref) : super(BudgetState());

  Future<void> loadBudgets({bool activeOnly = false}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _repository.getBudgets(activeOnly: activeOnly);
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      ),
      (budgets) {
        _ref.read(budgetsProvider.notifier).state = budgets;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> loadActiveBudgetsWithProgress({
    bool forceRefresh = false,
  }) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.getActiveBudgetsWithProgress(
      forceRefresh: forceRefresh,
    );
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      ),
      (progress) {
        _ref.read(budgetProgressProvider.notifier).state = progress;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> refreshBudgets() async {
    state = state.copyWith(isRefreshing: true);
    await loadActiveBudgetsWithProgress(forceRefresh: true);
    state = state.copyWith(isRefreshing: false);
  }

  Future<bool> createBudget(CreateBudgetRequest request) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.createBudget(request);
    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (budget) {
        final budgets = _ref.read(budgetsProvider);
        _ref.read(budgetsProvider.notifier).state = [budget, ...budgets];
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  Future<bool> updateBudget(String id, UpdateBudgetRequest request) async {
    state = state.copyWith(isLoading: true);
    final result = await _repository.updateBudget(id, request);
    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (budget) {
        final budgets = _ref.read(budgetsProvider);
        final index = budgets.indexWhere((b) => b.id == id);
        if (index != -1) {
          final updated = List<Budget>.from(budgets);
          updated[index] = budget;
          _ref.read(budgetsProvider.notifier).state = updated;
        }
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  Future<bool> deleteBudget(String id) async {
    final result = await _repository.deleteBudget(id);
    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (_) {
        final budgets = _ref.read(budgetsProvider);
        _ref.read(budgetsProvider.notifier).state = budgets
            .where((b) => b.id != id)
            .toList();
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
      unknown: (message) => message,
    );
  }
}

final budgetViewModelProvider =
    StateNotifierProvider<BudgetViewModel, BudgetState>((ref) {
      final repository = ref.read(budgetRepositoryProvider);
      return BudgetViewModel(repository, ref);
    });
