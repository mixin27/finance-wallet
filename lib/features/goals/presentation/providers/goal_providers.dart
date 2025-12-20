import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/goal_local_datasource.dart';
import '../../data/datasources/goal_remote_datasource.dart';
import '../../data/models/goal.dart';
import '../../data/repositories/goal_repository_impl.dart';
import '../../domain/repositories/goal_repository.dart';

final goalRemoteDatasourceProvider = Provider<GoalRemoteDatasource>((ref) {
  return GoalRemoteDatasource(ApiClient().dio);
});

final goalLocalDatasourceProvider = Provider<GoalLocalDatasource>((ref) {
  return GoalLocalDatasource(ref.read(appDatabaseProvider));
});

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  final remote = ref.read(goalRemoteDatasourceProvider);
  final local = ref.read(goalLocalDatasourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return GoalRepositoryImpl(remote, local, networkInfo);
});

final goalsProvider = StateProvider<List<Goal>>((ref) => []);
final selectedGoalProvider = StateProvider<Goal?>((ref) => null);
