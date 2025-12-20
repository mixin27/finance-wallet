import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_goal_request.freezed.dart';
part 'update_goal_request.g.dart';

@freezed
abstract class UpdateGoalRequest with _$UpdateGoalRequest {
  const factory UpdateGoalRequest({
    String? name,
    String? description,
    double? targetAmount,
    DateTime? targetDate,
    String? color,
    String? icon,
  }) = _UpdateGoalRequest;

  factory UpdateGoalRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateGoalRequestFromJson(json);
}
