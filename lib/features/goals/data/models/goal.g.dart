// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Goal _$GoalFromJson(Map<String, dynamic> json) => _Goal(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  targetAmount: (json['targetAmount'] as num).toDouble(),
  currentAmount: (json['currentAmount'] as num).toDouble(),
  remaining: (json['remaining'] as num).toDouble(),
  percentageComplete: (json['percentageComplete'] as num).toDouble(),
  targetDate: DateTime.parse(json['targetDate'] as String),
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  isCompleted: json['isCompleted'] as bool,
  accountId: json['accountId'] as String?,
  accountName: json['accountName'] as String?,
  currencyId: json['currencyId'] as String,
  currencyCode: json['currencyCode'] as String,
  currencySymbol: json['currencySymbol'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$GoalToJson(_Goal instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'targetAmount': instance.targetAmount,
  'currentAmount': instance.currentAmount,
  'remaining': instance.remaining,
  'percentageComplete': instance.percentageComplete,
  'targetDate': instance.targetDate.toIso8601String(),
  'color': instance.color,
  'icon': instance.icon,
  'isCompleted': instance.isCompleted,
  'accountId': instance.accountId,
  'accountName': instance.accountName,
  'currencyId': instance.currencyId,
  'currencyCode': instance.currencyCode,
  'currencySymbol': instance.currencySymbol,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
