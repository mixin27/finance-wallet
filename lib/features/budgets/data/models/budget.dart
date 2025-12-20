import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget.freezed.dart';
part 'budget.g.dart';

@freezed
abstract class Budget with _$Budget {
  const factory Budget({
    required String id,
    required String name,
    required double amount,
    required String period,
    required DateTime startDate,
    required DateTime endDate,
    required double alertThreshold,
    required bool isActive,
    String? categoryId,
    String? categoryName,
    required String currencyId,
    required String currencyCode,
    required String currencySymbol,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
}

@freezed
abstract class BudgetProgress with _$BudgetProgress {
  const factory BudgetProgress({
    required String id,
    required String name,
    required double amount,
    required double spent,
    required double remaining,
    required double percentageUsed,
    required String period,
    required DateTime startDate,
    required DateTime endDate,
    required double alertThreshold,
    required bool isOverBudget,
    required bool isNearLimit,
    String? categoryName,
    required String currencyCode,
    required String currencySymbol,
  }) = _BudgetProgress;

  factory BudgetProgress.fromJson(Map<String, dynamic> json) =>
      _$BudgetProgressFromJson(json);
}
