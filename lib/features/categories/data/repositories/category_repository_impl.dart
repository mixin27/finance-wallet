import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_local_datasource.dart';
import '../datasources/category_remote_datasource.dart';
import '../models/category_detailed.dart';
import '../models/create_category_request.dart';
import '../models/update_category_request.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource _remoteDatasource;
  final CategoryLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  CategoryRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<CategoryDetailed>>> getCategories({
    String? type,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final localCategories = await _localDatasource.getCategories(
          type: type,
        );
        if (localCategories.isNotEmpty) {
          return Right(localCategories);
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final localCategories = await _localDatasource.getCategories(
          type: type,
        );
        if (localCategories.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localCategories);
      }

      final categories = await _remoteDatasource.getCategories(type: type);
      await _localDatasource.upsertCategories(categories);
      return Right(categories);
    } on ServerException catch (e) {
      final localCategories = await _localDatasource.getCategories(type: type);
      if (localCategories.isNotEmpty) {
        return Right(localCategories);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localCategories = await _localDatasource.getCategories(type: type);
      if (localCategories.isNotEmpty) {
        return Right(localCategories);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryDetailed>> getCategoryById(String id) async {
    try {
      final localCategory = await _localDatasource.getCategoryById(id);

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        if (localCategory == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localCategory);
      }

      final category = await _remoteDatasource.getCategoryById(id);
      await _localDatasource.upsertCategory(category);
      return Right(category);
    } on ServerException catch (e) {
      final localCategory = await _localDatasource.getCategoryById(id);
      if (localCategory != null) {
        return Right(localCategory);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localCategory = await _localDatasource.getCategoryById(id);
      if (localCategory != null) {
        return Right(localCategory);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryDetailed>> createCategory(
    CreateCategoryRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final category = await _remoteDatasource.createCategory(request);

      // Save to local
      await _localDatasource.upsertCategory(category);

      return Right(category);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryDetailed>> updateCategory(
    String id,
    UpdateCategoryRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final category = await _remoteDatasource.updateCategory(id, request);

      // Update local
      await _localDatasource.upsertCategory(category);

      return Right(category);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String id) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      await _remoteDatasource.deleteCategory(id);

      // Delete from local
      await _localDatasource.deleteCategory(id);

      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
