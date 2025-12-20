import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/dashboard_remote_datasource.dart';
import '../../data/models/dashboard_overview.dart';
import '../../data/models/statistics.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_providers.g.dart';

// Datasource Provider
@riverpod
DashboardRemoteDatasource dashboardRemoteDataSource(Ref ref) {
  return DashboardRemoteDatasource(ApiClient().dio);
}

// Repository Provider
@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  return DashboardRepositoryImpl(ref.read(dashboardRemoteDataSourceProvider));
}

// Dashboard Overview Provider
final dashboardOverviewProvider = StateProvider<DashboardOverview?>(
  (ref) => null,
);

// Statistics Provider
final statisticsProvider = StateProvider<Statistics?>((ref) => null);
