import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_request.freezed.dart';
part 'update_category_request.g.dart';

@freezed
abstract class UpdateCategoryRequest with _$UpdateCategoryRequest {
  const factory UpdateCategoryRequest({
    String? name,
    String? color,
    String? icon,
    int? displayOrder,
  }) = _UpdateCategoryRequest;

  factory UpdateCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryRequestFromJson(json);
}
