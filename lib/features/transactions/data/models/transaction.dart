import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../accounts/data/models/currency.dart';
import 'category.dart';
import 'tag.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required TransactionAccountInfo account,
    TransactionAccountInfo? toAccount, // For transfers
    Category? category,
    required String type, // INCOME, EXPENSE, TRANSFER
    required double amount,
    required Currency currency,
    double? exchangeRate,
    double? convertedAmount,
    required DateTime transactionDate,
    required String description,
    String? note,
    String? payee,
    String? location,
    double? latitude,
    double? longitude,
    required String status,
    required List<Tag> tags,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
abstract class TransactionAccountInfo with _$TransactionAccountInfo {
  const factory TransactionAccountInfo({
    required String id,
    required String name,
    required AccountTypeInfo accountType,
    required Currency currency,
  }) = _TransactionAccountInfo;

  factory TransactionAccountInfo.fromJson(Map<String, dynamic> json) =>
      _$TransactionAccountInfoFromJson(json);
}

@freezed
abstract class AccountTypeInfo with _$AccountTypeInfo {
  const factory AccountTypeInfo({
    required String id,
    required String name,
    String? icon,
  }) = _AccountTypeInfo;

  factory AccountTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountTypeInfoFromJson(json);
}
