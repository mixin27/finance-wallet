import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/budget_local_datasource.dart';
import '../../data/datasources/budget_remote_datasource.dart';
import '../../data/models/budget.dart';
import '../../data/repositories/budget_repository_impl.dart';
import '../../domain/repositories/budget_repository.dart';

final budgetRemoteDatasourceProvider = Provider<BudgetRemoteDatasource>((ref) {
  return BudgetRemoteDatasource(ApiClient().dio);
});

final budgetLocalDatasourceProvider = Provider<BudgetLocalDatasource>((ref) {
  final db = ref.read(appDatabaseProvider);
  return BudgetLocalDatasource(db);
});

final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  final remote = ref.read(budgetRemoteDatasourceProvider);
  final local = ref.read(budgetLocalDatasourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return BudgetRepositoryImpl(remote, local, networkInfo);
});

final budgetsProvider = StateProvider<List<Budget>>((ref) => []);
final budgetProgressProvider = StateProvider<List<BudgetProgress>>((ref) => []);
final selectedBudgetProvider = StateProvider<Budget?>((ref) => null);
