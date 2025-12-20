import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/goal_repository.dart';
import '../datasources/goal_remote_datasource.dart';
import '../models/create_goal_request.dart';
import '../models/goal.dart';
import '../models/update_goal_request.dart';
import '../models/update_progress_request.dart';

class GoalRepositoryImpl implements GoalRepository {
  final GoalRemoteDatasource _remoteDatasource;

  GoalRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Goal>>> getGoals({
    bool activeOnly = false,
    bool force = false,
  }) async {
    try {
      final goals = await _remoteDatasource.getGoals(
        activeOnly: activeOnly,
        force: force,
      );
      return Right(goals);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Goal>> getGoalById(String id) async {
    try {
      final goal = await _remoteDatasource.getGoalById(id);
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
  Future<Either<Failure, Goal>> createGoal(CreateGoalRequest request) async {
    try {
      final goal = await _remoteDatasource.createGoal(request);
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
      final goal = await _remoteDatasource.updateGoal(id, request);
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
      final goal = await _remoteDatasource.updateProgress(id, request);
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
      final goal = await _remoteDatasource.completeGoal(id);
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
      await _remoteDatasource.deleteGoal(id);
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
