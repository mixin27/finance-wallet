// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_budget_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateBudgetRequest _$UpdateBudgetRequestFromJson(Map<String, dynamic> json) =>
    _UpdateBudgetRequest(
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      alertThreshold: (json['alertThreshold'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UpdateBudgetRequestToJson(
  _UpdateBudgetRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'amount': instance.amount,
  'alertThreshold': instance.alertThreshold,
};
