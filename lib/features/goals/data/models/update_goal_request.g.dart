// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_goal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateGoalRequest _$UpdateGoalRequestFromJson(Map<String, dynamic> json) =>
    _UpdateGoalRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      targetAmount: (json['targetAmount'] as num?)?.toDouble(),
      targetDate: json['targetDate'] == null
          ? null
          : DateTime.parse(json['targetDate'] as String),
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$UpdateGoalRequestToJson(_UpdateGoalRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'targetAmount': instance.targetAmount,
      'targetDate': instance.targetDate?.toIso8601String(),
      'color': instance.color,
      'icon': instance.icon,
    };
