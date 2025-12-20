import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/create_goal_request.dart';
import '../../data/models/goal.dart';
import '../../data/models/update_goal_request.dart';
import '../../data/models/update_progress_request.dart';
import '../../domain/repositories/goal_repository.dart';
import '../providers/goal_providers.dart';

class GoalState {
  final bool isLoading;
  final String? errorMessage;
  final bool isRefreshing;

  GoalState({
    this.isLoading = false,
    this.errorMessage,
    this.isRefreshing = false,
  });

  GoalState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isRefreshing,
  }) {
    return GoalState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class GoalViewModel extends StateNotifier<GoalState> {
  final GoalRepository _repository;
  final Ref _ref;

  GoalViewModel(this._repository, this._ref) : super(GoalState());

  Future<void> loadGoals({bool activeOnly = false, bool force = false}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.getGoals(
      activeOnly: activeOnly,
      force: force,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (goals) {
        _ref.read(goalsProvider.notifier).state = goals;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> refreshGoals({
    bool activeOnly = false,
    bool force = true,
  }) async {
    state = state.copyWith(isRefreshing: true);
    await loadGoals(activeOnly: activeOnly, force: force);
    state = state.copyWith(isRefreshing: false);
  }

  Future<bool> createGoal(CreateGoalRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.createGoal(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (goal) {
        final goals = _ref.read(goalsProvider);
        _ref.read(goalsProvider.notifier).state = [goal, ...goals];
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  Future<bool> updateGoal(String id, UpdateGoalRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.updateGoal(id, request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (goal) {
        final goals = _ref.read(goalsProvider);
        final index = goals.indexWhere((g) => g.id == id);
        if (index != -1) {
          final updated = List<Goal>.from(goals);
          updated[index] = goal;
          _ref.read(goalsProvider.notifier).state = updated;
        }
        _ref.read(selectedGoalProvider.notifier).state = goal;
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  Future<bool> updateProgress(String id, double amount) async {
    final request = UpdateProgressRequest(amount: amount);
    final result = await _repository.updateProgress(id, request);

    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (goal) {
        final goals = _ref.read(goalsProvider);
        final index = goals.indexWhere((g) => g.id == id);
        if (index != -1) {
          final updated = List<Goal>.from(goals);
          updated[index] = goal;
          _ref.read(goalsProvider.notifier).state = updated;
        }
        _ref.read(selectedGoalProvider.notifier).state = goal;
        return true;
      },
    );
  }

  Future<bool> completeGoal(String id) async {
    final result = await _repository.completeGoal(id);

    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (goal) {
        final goals = _ref.read(goalsProvider);
        final index = goals.indexWhere((g) => g.id == id);
        if (index != -1) {
          final updated = List<Goal>.from(goals);
          updated[index] = goal;
          _ref.read(goalsProvider.notifier).state = updated;
        }
        return true;
      },
    );
  }

  Future<bool> deleteGoal(String id) async {
    final result = await _repository.deleteGoal(id);

    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (_) {
        final goals = _ref.read(goalsProvider);
        _ref.read(goalsProvider.notifier).state = goals
            .where((g) => g.id != id)
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
    );
  }
}

final goalViewModelProvider = StateNotifierProvider<GoalViewModel, GoalState>((
  ref,
) {
  final repository = ref.read(goalRepositoryProvider);
  return GoalViewModel(repository, ref);
});
