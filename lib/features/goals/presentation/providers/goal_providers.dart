import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/goal_remote_datasource.dart';
import '../../data/models/goal.dart';
import '../../data/repositories/goal_repository_impl.dart';
import '../../domain/repositories/goal_repository.dart';

final goalRemoteDatasourceProvider = Provider<GoalRemoteDatasource>((ref) {
  return GoalRemoteDatasource(ApiClient().dio);
});

final goalRepositoryProvider = Provider<GoalRepository>((ref) {
  final datasource = ref.read(goalRemoteDatasourceProvider);
  return GoalRepositoryImpl(datasource);
});

final goalsProvider = StateProvider<List<Goal>>((ref) => []);
final selectedGoalProvider = StateProvider<Goal?>((ref) => null);
