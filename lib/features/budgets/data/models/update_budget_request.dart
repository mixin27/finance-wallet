import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_budget_request.freezed.dart';
part 'update_budget_request.g.dart';

@freezed
abstract class UpdateBudgetRequest with _$UpdateBudgetRequest {
  const factory UpdateBudgetRequest({
    String? name,
    double? amount,
    double? alertThreshold,
  }) = _UpdateBudgetRequest;

  factory UpdateBudgetRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBudgetRequestFromJson(json);
}
