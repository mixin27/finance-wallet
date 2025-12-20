import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_goal_request.freezed.dart';
part 'create_goal_request.g.dart';

@freezed
abstract class CreateGoalRequest with _$CreateGoalRequest {
  const factory CreateGoalRequest({
    required String name,
    String? description,
    required double targetAmount,
    double? initialAmount,
    required DateTime targetDate,
    required String currencyId,
    String? accountId,
    String? color,
    String? icon,
  }) = _CreateGoalRequest;

  factory CreateGoalRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGoalRequestFromJson(json);
}
