import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/create_goal_request.dart';
import '../../data/models/goal.dart';
import '../../data/models/update_goal_request.dart';
import '../../data/models/update_progress_request.dart';

abstract class GoalRepository {
  Future<Either<Failure, List<Goal>>> getGoals({bool activeOnly, bool force});
  Future<Either<Failure, Goal>> getGoalById(String id);
  Future<Either<Failure, Goal>> createGoal(CreateGoalRequest request);
  Future<Either<Failure, Goal>> updateGoal(
    String id,
    UpdateGoalRequest request,
  );
  Future<Either<Failure, Goal>> updateProgress(
    String id,
    UpdateProgressRequest request,
  );
  Future<Either<Failure, Goal>> completeGoal(String id);
  Future<Either<Failure, void>> deleteGoal(String id);
}
