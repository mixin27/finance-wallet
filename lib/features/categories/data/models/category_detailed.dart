import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_detailed.freezed.dart';
part 'category_detailed.g.dart';

@freezed
abstract class CategoryDetailed with _$CategoryDetailed {
  const factory CategoryDetailed({
    required String id,
    required String name,
    required String type,
    String? color,
    String? icon,
    required int displayOrder,
    required bool isSystem,
    required bool isActive,
    String? parentCategoryId,
    String? parentCategoryName,
    required List<CategoryDetailed> subCategories,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CategoryDetailed;

  factory CategoryDetailed.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailedFromJson(json);
}
