// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  id: json['id'] as String,
  name: json['name'] as String,
  accountType: AccountType.fromJson(
    json['accountType'] as Map<String, dynamic>,
  ),
  currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
  description: json['description'] as String?,
  initialBalance: (json['initialBalance'] as num).toDouble(),
  currentBalance: (json['currentBalance'] as num).toDouble(),
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  isIncludedInTotal: json['isIncludedInTotal'] as bool,
  isActive: json['isActive'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'accountType': instance.accountType,
  'currency': instance.currency,
  'description': instance.description,
  'initialBalance': instance.initialBalance,
  'currentBalance': instance.currentBalance,
  'color': instance.color,
  'icon': instance.icon,
  'isIncludedInTotal': instance.isIncludedInTotal,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
