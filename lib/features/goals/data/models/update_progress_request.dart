import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_progress_request.freezed.dart';
part 'update_progress_request.g.dart';

@freezed
abstract class UpdateProgressRequest with _$UpdateProgressRequest {
  const factory UpdateProgressRequest({required double amount}) =
      _UpdateProgressRequest;

  factory UpdateProgressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProgressRequestFromJson(json);
}
