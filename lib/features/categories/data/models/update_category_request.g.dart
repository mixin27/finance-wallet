// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCategoryRequest _$UpdateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCategoryRequest(
  name: json['name'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateCategoryRequestToJson(
  _UpdateCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'color': instance.color,
  'icon': instance.icon,
  'displayOrder': instance.displayOrder,
};
