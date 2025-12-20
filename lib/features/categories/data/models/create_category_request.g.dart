// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCategoryRequest _$CreateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => _CreateCategoryRequest(
  name: json['name'] as String,
  type: json['type'] as String,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  parentCategoryId: json['parentCategoryId'] as String?,
);

Map<String, dynamic> _$CreateCategoryRequestToJson(
  _CreateCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'color': instance.color,
  'icon': instance.icon,
  'parentCategoryId': instance.parentCategoryId,
};
