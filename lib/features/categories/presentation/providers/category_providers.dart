import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/category_remote_datasource.dart';
import '../../data/models/category_detailed.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../domain/repositories/category_repository.dart';

// Datasource Provider

final categoryRemoteDatasourceProvider = Provider<CategoryRemoteDatasource>((
  ref,
) {
  return CategoryRemoteDatasource(ApiClient().dio);
});

// Repository Provider
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final datasource = ref.read(categoryRemoteDatasourceProvider);
  return CategoryRepositoryImpl(datasource);
});

// All Categories Provider
final allCategoriesProvider = StateProvider<List<CategoryDetailed>>(
  (ref) => [],
);

// Income Categories Provider
final incomeCategoriesDetailedProvider = Provider<List<CategoryDetailed>>((
  ref,
) {
  final categories = ref.watch(allCategoriesProvider);
  return categories.where((c) => c.type == 'INCOME').toList();
});

// Expense Categories Provider
final expenseCategoriesDetailedProvider = Provider<List<CategoryDetailed>>((
  ref,
) {
  final categories = ref.watch(allCategoriesProvider);
  return categories.where((c) => c.type == 'EXPENSE').toList();
});

// Selected Category Provider
final selectedCategoryProvider = StateProvider<CategoryDetailed?>(
  (ref) => null,
);
