import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../currencies/data/models/currency.dart';
import 'account.dart';

part 'account_summary.freezed.dart';
part 'account_summary.g.dart';

@freezed
sealed class AccountSummary with _$AccountSummary {
  const factory AccountSummary({
    required int totalAccounts,
    required int activeAccounts,
    required double totalBalance,
    required List<CurrencyBalance> balanceByCurrency,
    required List<Account> accounts,
    required Currency defaultCurrency,
  }) = _AccountSummary;

  factory AccountSummary.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryFromJson(json);
}

@freezed
sealed class CurrencyBalance with _$CurrencyBalance {
  const factory CurrencyBalance({
    required String currencyCode,
    required String currencySymbol,
    required double balance,
    required int accountCount,
  }) = _CurrencyBalance;

  factory CurrencyBalance.fromJson(Map<String, dynamic> json) =>
      _$CurrencyBalanceFromJson(json);
}
