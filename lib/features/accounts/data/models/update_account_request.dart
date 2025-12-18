import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_account_request.freezed.dart';
part 'update_account_request.g.dart';

@freezed
sealed class UpdateAccountRequest with _$UpdateAccountRequest {
  const factory UpdateAccountRequest({
    String? name,
    String? accountTypeId,
    String? currencyId,
    String? description,
    String? color,
    String? icon,
    bool? isIncludedInTotal,
    bool? isActive,
  }) = _UpdateAccountRequest;

  factory UpdateAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountRequestFromJson(json);
}
