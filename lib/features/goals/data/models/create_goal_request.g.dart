// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_goal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateGoalRequest _$CreateGoalRequestFromJson(Map<String, dynamic> json) =>
    _CreateGoalRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      initialAmount: (json['initialAmount'] as num?)?.toDouble(),
      targetDate: DateTime.parse(json['targetDate'] as String),
      currencyId: json['currencyId'] as String,
      accountId: json['accountId'] as String?,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CreateGoalRequestToJson(_CreateGoalRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'targetAmount': instance.targetAmount,
      'initialAmount': instance.initialAmount,
      'targetDate': instance.targetDate.toIso8601String(),
      'currencyId': instance.currencyId,
      'accountId': instance.accountId,
      'color': instance.color,
      'icon': instance.icon,
    };
