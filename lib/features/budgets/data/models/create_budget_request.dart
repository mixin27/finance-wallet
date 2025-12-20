import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_budget_request.freezed.dart';
part 'create_budget_request.g.dart';

@freezed
abstract class CreateBudgetRequest with _$CreateBudgetRequest {
  const factory CreateBudgetRequest({
    required String name,
    required double amount,
    required String period,
    required DateTime startDate,
    DateTime? endDate,
    required String currencyId,
    String? categoryId,
    double? alertThreshold,
  }) = _CreateBudgetRequest;

  factory CreateBudgetRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBudgetRequestFromJson(json);
}
