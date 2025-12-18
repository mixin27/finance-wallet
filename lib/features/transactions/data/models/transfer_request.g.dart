// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferRequest _$TransferRequestFromJson(Map<String, dynamic> json) =>
    _TransferRequest(
      fromAccountId: json['fromAccountId'] as String,
      toAccountId: json['toAccountId'] as String,
      amount: (json['amount'] as num).toDouble(),
      exchangeRate: (json['exchangeRate'] as num?)?.toDouble(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      description: json['description'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TransferRequestToJson(_TransferRequest instance) =>
    <String, dynamic>{
      'fromAccountId': instance.fromAccountId,
      'toAccountId': instance.toAccountId,
      'amount': instance.amount,
      'exchangeRate': instance.exchangeRate,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'description': instance.description,
      'note': instance.note,
    };
