// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateAccountRequest _$UpdateAccountRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateAccountRequest(
  name: json['name'] as String?,
  accountTypeId: json['accountTypeId'] as String?,
  currencyId: json['currencyId'] as String?,
  description: json['description'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  isIncludedInTotal: json['isIncludedInTotal'] as bool?,
  isActive: json['isActive'] as bool?,
);

Map<String, dynamic> _$UpdateAccountRequestToJson(
  _UpdateAccountRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'accountTypeId': instance.accountTypeId,
  'currencyId': instance.currencyId,
  'description': instance.description,
  'color': instance.color,
  'icon': instance.icon,
  'isIncludedInTotal': instance.isIncludedInTotal,
  'isActive': instance.isActive,
};
