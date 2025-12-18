import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_request.freezed.dart';
part 'create_account_request.g.dart';

@freezed
sealed class CreateAccountRequest with _$CreateAccountRequest {
  const factory CreateAccountRequest({
    required String name,
    required String accountTypeId,
    required String currencyId,
    String? description,
    required double initialBalance,
    String? color,
    String? icon,
    @Default(true) bool isIncludedInTotal,
  }) = _CreateAccountRequest;

  factory CreateAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountRequestFromJson(json);
}
