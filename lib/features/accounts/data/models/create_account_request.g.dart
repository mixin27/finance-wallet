// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAccountRequest _$CreateAccountRequestFromJson(
  Map<String, dynamic> json,
) => _CreateAccountRequest(
  name: json['name'] as String,
  accountTypeId: json['accountTypeId'] as String,
  currencyId: json['currencyId'] as String,
  description: json['description'] as String?,
  initialBalance: (json['initialBalance'] as num).toDouble(),
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  isIncludedInTotal: json['isIncludedInTotal'] as bool? ?? true,
);

Map<String, dynamic> _$CreateAccountRequestToJson(
  _CreateAccountRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'accountTypeId': instance.accountTypeId,
  'currencyId': instance.currencyId,
  'description': instance.description,
  'initialBalance': instance.initialBalance,
  'color': instance.color,
  'icon': instance.icon,
  'isIncludedInTotal': instance.isIncludedInTotal,
};
