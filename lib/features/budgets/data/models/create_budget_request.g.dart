// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_budget_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateBudgetRequest _$CreateBudgetRequestFromJson(Map<String, dynamic> json) =>
    _CreateBudgetRequest(
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      period: json['period'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      currencyId: json['currencyId'] as String,
      categoryId: json['categoryId'] as String?,
      alertThreshold: (json['alertThreshold'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateBudgetRequestToJson(
  _CreateBudgetRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'amount': instance.amount,
  'period': instance.period,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'currencyId': instance.currencyId,
  'categoryId': instance.categoryId,
  'alertThreshold': instance.alertThreshold,
};
