import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../currencies/data/models/currency.dart';
import 'account_type.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
sealed class Account with _$Account {
  const factory Account({
    required String id,
    required String name,
    required AccountType accountType,
    required Currency currency,
    String? description,
    required double initialBalance,
    required double currentBalance,
    required double balanceInDefaultCurrency,
    String? color,
    String? icon,
    required bool isIncludedInTotal,
    required int displayOrder,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
