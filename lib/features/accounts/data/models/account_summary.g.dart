// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountSummary _$AccountSummaryFromJson(Map<String, dynamic> json) =>
    _AccountSummary(
      totalAccounts: (json['totalAccounts'] as num).toInt(),
      activeAccounts: (json['activeAccounts'] as num).toInt(),
      totalBalance: (json['totalBalance'] as num).toDouble(),
      balanceByCurrency: (json['balanceByCurrency'] as List<dynamic>)
          .map((e) => CurrencyBalance.fromJson(e as Map<String, dynamic>))
          .toList(),
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountSummaryToJson(_AccountSummary instance) =>
    <String, dynamic>{
      'totalAccounts': instance.totalAccounts,
      'activeAccounts': instance.activeAccounts,
      'totalBalance': instance.totalBalance,
      'balanceByCurrency': instance.balanceByCurrency,
      'accounts': instance.accounts,
    };

_CurrencyBalance _$CurrencyBalanceFromJson(Map<String, dynamic> json) =>
    _CurrencyBalance(
      currencyCode: json['currencyCode'] as String,
      currencySymbol: json['currencySymbol'] as String,
      balance: (json['balance'] as num).toDouble(),
      accountCount: (json['accountCount'] as num).toInt(),
    );

Map<String, dynamic> _$CurrencyBalanceToJson(_CurrencyBalance instance) =>
    <String, dynamic>{
      'currencyCode': instance.currencyCode,
      'currencySymbol': instance.currencySymbol,
      'balance': instance.balance,
      'accountCount': instance.accountCount,
    };
