// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Budget _$BudgetFromJson(Map<String, dynamic> json) => _Budget(
  id: json['id'] as String,
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
  period: json['period'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  alertThreshold: (json['alertThreshold'] as num).toDouble(),
  isActive: json['isActive'] as bool,
  categoryId: json['categoryId'] as String?,
  categoryName: json['categoryName'] as String?,
  currencyId: json['currencyId'] as String,
  currencyCode: json['currencyCode'] as String,
  currencySymbol: json['currencySymbol'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$BudgetToJson(_Budget instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
  'period': instance.period,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'alertThreshold': instance.alertThreshold,
  'isActive': instance.isActive,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'currencyId': instance.currencyId,
  'currencyCode': instance.currencyCode,
  'currencySymbol': instance.currencySymbol,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_BudgetProgress _$BudgetProgressFromJson(Map<String, dynamic> json) =>
    _BudgetProgress(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      remaining: (json['remaining'] as num).toDouble(),
      percentageUsed: (json['percentageUsed'] as num).toDouble(),
      period: json['period'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      alertThreshold: (json['alertThreshold'] as num).toDouble(),
      isOverBudget: json['isOverBudget'] as bool,
      isNearLimit: json['isNearLimit'] as bool,
      categoryName: json['categoryName'] as String?,
      currencyCode: json['currencyCode'] as String,
      currencySymbol: json['currencySymbol'] as String,
    );

Map<String, dynamic> _$BudgetProgressToJson(_BudgetProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'spent': instance.spent,
      'remaining': instance.remaining,
      'percentageUsed': instance.percentageUsed,
      'period': instance.period,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'alertThreshold': instance.alertThreshold,
      'isOverBudget': instance.isOverBudget,
      'isNearLimit': instance.isNearLimit,
      'categoryName': instance.categoryName,
      'currencyCode': instance.currencyCode,
      'currencySymbol': instance.currencySymbol,
    };
