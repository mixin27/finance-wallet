import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/goal_repository.dart';
import '../datasources/goal_local_datasource.dart';
import '../datasources/goal_remote_datasource.dart';
import '../models/create_goal_request.dart';
import '../models/goal.dart';
import '../models/update_goal_request.dart';
import '../models/update_progress_request.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalRemoteDatasource _remoteDatasource;
  final GoalLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  GoalRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Goal>>> getGoals({
    bool activeOnly = false,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final localGoals = await _localDatasource.getGoals(
          activeOnly: activeOnly,
        );
        if (localGoals.isNotEmpty) {
          return Right(localGoals);
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final localGoals = await _localDatasource.getGoals(
          activeOnly: activeOnly,
        );
        if (localGoals.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localGoals);
      }

      final goals = await _remoteDatasource.getGoals(activeOnly: activeOnly);
      await _localDatasource.upsertGoals(goals);
      return Right(goals);
    } on ServerException catch (e) {
      final localGoals = await _localDatasource.getGoals(
        activeOnly: activeOnly,
      );
      if (localGoals.isNotEmpty) {
        return Right(localGoals);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localGoals = await _localDatasource.getGoals(
        activeOnly: activeOnly,
      );
      if (localGoals.isNotEmpty) {
        return Right(localGoals);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Goal>> getGoalById(String id) async {
    try {
      // Try local first
      final localGoal = await _localDatasource.getGoalById(id);

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        if (localGoal == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localGoal);
      }

      final goal = await _remoteDatasource.getGoalById(id);

      // Save to local
      await _localDatasource.upsertGoal(goal);

      return Right(goal);
    } on ServerException catch (e) {
      final localGoal = await _localDatasource.getGoalById(id);
      if (localGoal != null) {
        return Right(localGoal);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localGoal = await _localDatasource.getGoalById(id);
      if (localGoal != null) {
        return Right(localGoal);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Goal>> createGoal(CreateGoalRequest request) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final goal = await _remoteDatasource.createGoal(request);

      // Save to local
      await _localDatasource.upsertGoal(goal);

      return Right(goal);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Goal>> updateGoal(
    String id,
    UpdateGoalRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final goal = await _remoteDatasource.updateGoal(id, request);

      // Update local
      await _localDatasource.upsertGoal(goal);

      return Right(goal);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Goal>> updateProgress(
    String id,
    UpdateProgressRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final goal = await _remoteDatasource.updateProgress(id, request);

      // Update local
      await _localDatasource.upsertGoal(goal);

      return Right(goal);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Goal>> completeGoal(String id) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final goal = await _remoteDatasource.completeGoal(id);

      // Update local
      await _localDatasource.upsertGoal(goal);

      return Right(goal);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteGoal(String id) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      await _remoteDatasource.deleteGoal(id);

      // Delete from local
      await _localDatasource.deleteGoal(id);

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
