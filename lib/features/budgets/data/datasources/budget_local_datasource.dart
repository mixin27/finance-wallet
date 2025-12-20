import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../models/budget.dart' as models;

class BudgetLocalDatasource {
  final AppDatabase _database;

  BudgetLocalDatasource(this._database);

  // Get all budgets
  Future<List<models.Budget>> getBudgets({bool activeOnly = false}) async {
    final query = _database.select(_database.budgets);

    if (activeOnly) {
      query.where((t) => t.isActive.equals(true));
    }

    final results = await query.get();
    return results.map(_mapToBudgetModel).toList();
  }

  // Get budget by ID
  Future<models.Budget?> getBudgetById(String id) async {
    final query = _database.select(_database.budgets)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToBudgetModel(result) : null;
  }

  // Insert or update budget
  Future<void> upsertBudget(models.Budget budget) async {
    await _database
        .into(_database.budgets)
        .insertOnConflictUpdate(
          BudgetsCompanion(
            id: Value(budget.id),
            name: Value(budget.name),
            amount: Value(budget.amount),
            period: Value(budget.period),
            startDate: Value(budget.startDate),
            endDate: Value(budget.endDate),
            alertThreshold: Value(budget.alertThreshold),
            isActive: Value(budget.isActive),
            categoryId: Value(budget.categoryId),
            categoryName: Value(budget.categoryName),
            currencyId: Value(budget.currencyId),
            currencyCode: Value(budget.currencyCode),
            currencySymbol: Value(budget.currencySymbol),
            createdAt: Value(budget.createdAt),
            updatedAt: Value(budget.updatedAt),
          ),
        );
  }

  // Insert or update multiple budgets
  Future<void> upsertBudgets(List<models.Budget> budgets) async {
    await _database.batch((batch) {
      for (final budget in budgets) {
        batch.insert(
          _database.budgets,
          BudgetsCompanion(
            id: Value(budget.id),
            name: Value(budget.name),
            amount: Value(budget.amount),
            period: Value(budget.period),
            startDate: Value(budget.startDate),
            endDate: Value(budget.endDate),
            alertThreshold: Value(budget.alertThreshold),
            isActive: Value(budget.isActive),
            categoryId: Value(budget.categoryId),
            categoryName: Value(budget.categoryName),
            currencyId: Value(budget.currencyId),
            currencyCode: Value(budget.currencyCode),
            currencySymbol: Value(budget.currencySymbol),
            createdAt: Value(budget.createdAt),
            updatedAt: Value(budget.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  // Delete budget
  Future<void> deleteBudget(String id) async {
    await (_database.delete(
      _database.budgets,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all budgets
  Future<void> clearAllBudgets() async {
    await _database.delete(_database.budgets).go();
  }

  // Helper to map database model to domain model
  models.Budget _mapToBudgetModel(Budget budget) {
    return models.Budget(
      id: budget.id,
      name: budget.name,
      amount: budget.amount,
      period: budget.period,
      startDate: budget.startDate,
      endDate: budget.endDate,
      alertThreshold: budget.alertThreshold,
      isActive: budget.isActive,
      categoryId: budget.categoryId,
      categoryName: budget.categoryName,
      currencyId: budget.currencyId,
      currencyCode: budget.currencyCode,
      currencySymbol: budget.currencySymbol,
      createdAt: budget.createdAt,
      updatedAt: budget.updatedAt,
    );
  }

  // Cache budget progress (stored as JSON in DashboardCache table)
  Future<void> cacheBudgetProgress(
    List<models.BudgetProgress> progressList,
  ) async {
    final jsonData = progressList.map((e) => e.toJson()).toList();
    await _database
        .into(_database.dashboardCache)
        .insertOnConflictUpdate(
          DashboardCacheCompanion(
            key: const Value('budget_progress'),
            jsonData: Value(jsonEncode(jsonData)),
            cachedAt: Value(DateTime.now()),
          ),
        );
  }

  // Get cached budget progress
  Future<List<models.BudgetProgress>?> getCachedBudgetProgress() async {
    final query = _database.select(_database.dashboardCache)
      ..where((t) => t.key.equals('budget_progress'));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    try {
      final List<dynamic> jsonData = jsonDecode(result.jsonData);
      return jsonData
          .map(
            (json) =>
                models.BudgetProgress.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      return null;
    }
  }
}
