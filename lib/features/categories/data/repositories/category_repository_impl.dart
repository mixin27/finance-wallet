import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_datasource.dart';
import '../models/category_detailed.dart';
import '../models/create_category_request.dart';
import '../models/update_category_request.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDatasource _remoteDatasource;

  CategoryRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<CategoryDetailed>>> getCategories({
    String? type,
  }) async {
    try {
      final categories = await _remoteDatasource.getCategories(type: type);
      return Right(categories);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryDetailed>> getCategoryById(String id) async {
    try {
      final category = await _remoteDatasource.getCategoryById(id);
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
  Future<Either<Failure, CategoryDetailed>> createCategory(
    CreateCategoryRequest request,
  ) async {
    try {
      final category = await _remoteDatasource.createCategory(request);
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
      final category = await _remoteDatasource.updateCategory(id, request);
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
      await _remoteDatasource.deleteCategory(id);
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
