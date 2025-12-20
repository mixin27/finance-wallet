import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/budget_repository.dart';
import '../datasources/budget_remote_datasource.dart';
import '../models/budget.dart';
import '../models/create_budget_request.dart';
import '../models/update_budget_request.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetRemoteDatasource _remoteDatasource;

  BudgetRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Budget>>> getBudgets({
    bool activeOnly = false,
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = 'budgets_${activeOnly ? "active" : "all"}';

    try {
      final cachedData = prefs.getString(cacheKey);
      if (cachedData != null && !forceRefresh) {
        final List<dynamic> jsonData = jsonDecode(cachedData);
        final budgets = jsonData
            .map((json) => Budget.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(budgets);
      }

      final budgets = await _remoteDatasource.getBudgets(
        activeOnly: activeOnly,
      );
      await prefs.setString(
        cacheKey,
        jsonEncode(budgets.map((e) => e.toJson()).toList()),
      );
      return Right(budgets);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Budget>> getBudgetById(String id) async {
    try {
      final budget = await _remoteDatasource.getBudgetById(id);
      return Right(budget);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Budget>> createBudget(
    CreateBudgetRequest request,
  ) async {
    try {
      final budget = await _remoteDatasource.createBudget(request);
      return Right(budget);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Budget>> updateBudget(
    String id,
    UpdateBudgetRequest request,
  ) async {
    try {
      final budget = await _remoteDatasource.updateBudget(id, request);
      return Right(budget);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBudget(String id) async {
    try {
      await _remoteDatasource.deleteBudget(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BudgetProgress>>> getActiveBudgetsWithProgress({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = 'budgets_active_with_progress';

    try {
      final cachedData = prefs.getString(cacheKey);
      if (cachedData != null && !forceRefresh) {
        final List<dynamic> jsonData = jsonDecode(cachedData);
        final budgets = jsonData
            .map(
              (json) => BudgetProgress.fromJson(json as Map<String, dynamic>),
            )
            .toList();
        return Right(budgets);
      }

      final budgets = await _remoteDatasource.getActiveBudgetsWithProgress();
      await prefs.setString(
        cacheKey,
        jsonEncode(budgets.map((e) => e.toJson()).toList()),
      );
      return Right(budgets);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
