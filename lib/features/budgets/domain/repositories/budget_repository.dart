import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/budget.dart';
import '../../data/models/create_budget_request.dart';
import '../../data/models/update_budget_request.dart';

abstract class BudgetRepository {
  Future<Either<Failure, List<Budget>>> getBudgets({
    bool activeOnly,
    bool forceRefresh,
  });
  Future<Either<Failure, Budget>> getBudgetById(String id);
  Future<Either<Failure, Budget>> createBudget(CreateBudgetRequest request);
  Future<Either<Failure, Budget>> updateBudget(
    String id,
    UpdateBudgetRequest request,
  );
  Future<Either<Failure, void>> deleteBudget(String id);
  Future<Either<Failure, List<BudgetProgress>>> getActiveBudgetsWithProgress({
    bool forceRefresh,
  });
}
