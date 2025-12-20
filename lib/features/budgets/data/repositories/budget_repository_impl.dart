import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/budget_repository.dart';
import '../datasources/budget_local_datasource.dart';
import '../datasources/budget_remote_datasource.dart';
import '../models/budget.dart';
import '../models/create_budget_request.dart';
import '../models/update_budget_request.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetRemoteDatasource _remoteDatasource;
  final BudgetLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  BudgetRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Budget>>> getBudgets({
    bool activeOnly = false,
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from local first
      if (!forceRefresh) {
        final localBudgets = await _localDatasource.getBudgets(
          activeOnly: activeOnly,
        );
        if (localBudgets.isNotEmpty) {
          return Right(localBudgets);
        }
      }

      // Check network connectivity
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final localBudgets = await _localDatasource.getBudgets(
          activeOnly: activeOnly,
        );
        if (localBudgets.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localBudgets);
      }

      final budgets = await _remoteDatasource.getBudgets(
        activeOnly: activeOnly,
      );

      // Save to local
      await _localDatasource.upsertBudgets(budgets);

      return Right(budgets);
    } on ServerException catch (e) {
      // Try to return local data on server error
      final localBudgets = await _localDatasource.getBudgets(
        activeOnly: activeOnly,
      );
      if (localBudgets.isNotEmpty) {
        return Right(localBudgets);
      }

      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localBudgets = await _localDatasource.getBudgets(
        activeOnly: activeOnly,
      );
      if (localBudgets.isNotEmpty) {
        return Right(localBudgets);
      }

      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Budget>> getBudgetById(String id) async {
    try {
      // Try local first
      final localBudget = await _localDatasource.getBudgetById(id);

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        if (localBudget == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localBudget);
      }

      // Fetch from remote
      final budget = await _remoteDatasource.getBudgetById(id);

      // Save to local
      await _localDatasource.upsertBudget(budget);

      return Right(budget);
    } on ServerException catch (e) {
      final localBudget = await _localDatasource.getBudgetById(id);
      if (localBudget != null) {
        return Right(localBudget);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localBudget = await _localDatasource.getBudgetById(id);
      if (localBudget != null) {
        return Right(localBudget);
      }
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
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final budget = await _remoteDatasource.createBudget(request);

      // Save to local
      await _localDatasource.upsertBudget(budget);

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
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final budget = await _remoteDatasource.updateBudget(id, request);

      // Update local
      await _localDatasource.upsertBudget(budget);

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
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      await _remoteDatasource.deleteBudget(id);

      // Delete from local
      await _localDatasource.deleteBudget(id);

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
    try {
      // Try to get from local cache first
      if (!forceRefresh) {
        final cachedProgress = await _localDatasource.getCachedBudgetProgress();
        if (cachedProgress != null && cachedProgress.isNotEmpty) {
          return Right(cachedProgress);
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedProgress = await _localDatasource.getCachedBudgetProgress();
        if (cachedProgress == null || cachedProgress.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedProgress);
      }

      final budgets = await _remoteDatasource.getActiveBudgetsWithProgress();

      // Cache the result
      await _localDatasource.cacheBudgetProgress(budgets);

      return Right(budgets);
    } on ServerException catch (e) {
      final cachedProgress = await _localDatasource.getCachedBudgetProgress();
      if (cachedProgress != null && cachedProgress.isNotEmpty) {
        return Right(cachedProgress);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedProgress = await _localDatasource.getCachedBudgetProgress();
      if (cachedProgress != null && cachedProgress.isNotEmpty) {
        return Right(cachedProgress);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
