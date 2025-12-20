import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../models/goal.dart' as models;

class GoalLocalDatasource {
  final AppDatabase _database;

  GoalLocalDatasource(this._database);

  // Get all goals
  Future<List<models.Goal>> getGoals({bool activeOnly = false}) async {
    final query = _database.select(_database.goals);

    if (activeOnly) {
      query.where((t) => t.isCompleted.equals(false));
    }

    final results = await query.get();
    return results.map(_mapToGoalModel).toList();
  }

  // Get goal by ID
  Future<models.Goal?> getGoalById(String id) async {
    final query = _database.select(_database.goals)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToGoalModel(result) : null;
  }

  // Insert or update goal
  Future<void> upsertGoal(models.Goal goal) async {
    await _database
        .into(_database.goals)
        .insertOnConflictUpdate(
          GoalsCompanion(
            id: Value(goal.id),
            name: Value(goal.name),
            description: Value(goal.description),
            targetAmount: Value(goal.targetAmount),
            currentAmount: Value(goal.currentAmount),
            remaining: Value(goal.remaining),
            percentageComplete: Value(goal.percentageComplete),
            targetDate: Value(goal.targetDate),
            color: Value(goal.color),
            icon: Value(goal.icon),
            isCompleted: Value(goal.isCompleted),
            accountId: Value(goal.accountId),
            accountName: Value(goal.accountName),
            currencyId: Value(goal.currencyId),
            currencyCode: Value(goal.currencyCode),
            currencySymbol: Value(goal.currencySymbol),
            createdAt: Value(goal.createdAt),
            updatedAt: Value(goal.updatedAt),
          ),
        );
  }

  // Insert or update multiple goals
  Future<void> upsertGoals(List<models.Goal> goals) async {
    await _database.batch((batch) {
      for (final goal in goals) {
        batch.insert(
          _database.goals,
          GoalsCompanion(
            id: Value(goal.id),
            name: Value(goal.name),
            description: Value(goal.description),
            targetAmount: Value(goal.targetAmount),
            currentAmount: Value(goal.currentAmount),
            remaining: Value(goal.remaining),
            percentageComplete: Value(goal.percentageComplete),
            targetDate: Value(goal.targetDate),
            color: Value(goal.color),
            icon: Value(goal.icon),
            isCompleted: Value(goal.isCompleted),
            accountId: Value(goal.accountId),
            accountName: Value(goal.accountName),
            currencyId: Value(goal.currencyId),
            currencyCode: Value(goal.currencyCode),
            currencySymbol: Value(goal.currencySymbol),
            createdAt: Value(goal.createdAt),
            updatedAt: Value(goal.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  // Delete goal
  Future<void> deleteGoal(String id) async {
    await (_database.delete(
      _database.goals,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all goals
  Future<void> clearAllGoals() async {
    await _database.delete(_database.goals).go();
  }

  // Helper to map database model to domain model
  models.Goal _mapToGoalModel(Goal goal) {
    return models.Goal(
      id: goal.id,
      name: goal.name,
      description: goal.description,
      targetAmount: goal.targetAmount,
      currentAmount: goal.currentAmount,
      remaining: goal.remaining,
      percentageComplete: goal.percentageComplete,
      targetDate: goal.targetDate,
      color: goal.color,
      icon: goal.icon,
      isCompleted: goal.isCompleted,
      accountId: goal.accountId,
      accountName: goal.accountName,
      currencyId: goal.currencyId,
      currencyCode: goal.currencyCode,
      currencySymbol: goal.currencySymbol,
      createdAt: goal.createdAt,
      updatedAt: goal.updatedAt,
    );
  }
}
