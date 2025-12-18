import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_type.freezed.dart';
part 'account_type.g.dart';

@freezed
sealed class AccountType with _$AccountType {
  const factory AccountType({
    required String id,
    required String name,
    String? icon,
  }) = _AccountType;

  factory AccountType.fromJson(Map<String, dynamic> json) =>
      _$AccountTypeFromJson(json);
}
