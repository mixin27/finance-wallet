// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDetailed _$CategoryDetailedFromJson(Map<String, dynamic> json) =>
    _CategoryDetailed(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
      displayOrder: (json['displayOrder'] as num).toInt(),
      isSystem: json['isSystem'] as bool,
      isActive: json['isActive'] as bool,
      parentCategoryId: json['parentCategoryId'] as String?,
      parentCategoryName: json['parentCategoryName'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => CategoryDetailed.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CategoryDetailedToJson(_CategoryDetailed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'color': instance.color,
      'icon': instance.icon,
      'displayOrder': instance.displayOrder,
      'isSystem': instance.isSystem,
      'isActive': instance.isActive,
      'parentCategoryId': instance.parentCategoryId,
      'parentCategoryName': instance.parentCategoryName,
      'subCategories': instance.subCategories,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
