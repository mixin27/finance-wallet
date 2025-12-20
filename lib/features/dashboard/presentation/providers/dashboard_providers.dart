import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/dashboard_local_datasource.dart';
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

@riverpod
DashboardLocalDatasource dashboardLocalDataSource(Ref ref) {
  return DashboardLocalDatasource(ref.read(appDatabaseProvider));
}

// Repository Provider
@riverpod
DashboardRepository dashboardRepository(Ref ref) {
  final remote = ref.read(dashboardRemoteDataSourceProvider);
  final local = ref.read(dashboardLocalDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return DashboardRepositoryImpl(remote, local, networkInfo);
}

// Dashboard Overview Provider
final dashboardOverviewProvider = StateProvider<DashboardOverview?>(
  (ref) => null,
);

// Statistics Provider
final statisticsProvider = StateProvider<Statistics?>((ref) => null);
