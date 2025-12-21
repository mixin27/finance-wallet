import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../providers/dashboard_providers.dart';

class DashboardState {
  final bool isLoading;
  final String? errorMessage;
  final bool isRefreshing;

  DashboardState({
    this.isLoading = false,
    this.errorMessage,
    this.isRefreshing = false,
  });

  DashboardState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isRefreshing,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class DashboardViewModel extends StateNotifier<DashboardState> {
  final DashboardRepository _repository;
  final Ref _ref;

  DashboardViewModel(this._repository, this._ref) : super(DashboardState());

  /// Load dashboard overview
  Future<void> loadDashboard({bool forceRefresh = false}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.getDashboardOverview(
      forceRefresh: forceRefresh,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (overview) {
        _ref.read(dashboardOverviewProvider.notifier).state = overview;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  /// Refresh dashboard
  Future<void> refreshDashboard() async {
    state = state.copyWith(isRefreshing: true);
    await loadDashboard(forceRefresh: true);
    state = state.copyWith(isRefreshing: false);
  }

  /// Load this month statistics
  Future<void> loadThisMonthStatistics() async {
    final result = await _repository.getThisMonthStatistics();

    result.fold(
      (failure) {
        // Silently fail for statistics
      },
      (statistics) {
        _ref.read(statisticsProvider.notifier).state = statistics;
      },
    );
  }

  /// Load statistics for custom date range
  Future<void> loadStatistics({
    required String startDate,
    required String endDate,
  }) async {
    final result = await _repository.getStatistics(
      startDate: startDate,
      endDate: endDate,
    );

    result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
      },
      (statistics) {
        _ref.read(statisticsProvider.notifier).state = statistics;
      },
    );
  }

  /// Load last month statistics for comparison
  Future<void> loadLastMonthStatistics() async {
    final result = await _repository.getLastMonthStatistics();

    result.fold(
      (failure) {
        // Silently fail
      },
      (statistics) {
        // Store in a separate provider if needed for comparison
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

final dashboardViewModelProvider =
    StateNotifierProvider<DashboardViewModel, DashboardState>((ref) {
      final repository = ref.read(dashboardRepositoryProvider);
      return DashboardViewModel(repository, ref);
    });
