// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTransactionRequest _$CreateTransactionRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTransactionRequest(
  accountId: json['accountId'] as String,
  type: json['type'] as String,
  amount: (json['amount'] as num).toDouble(),
  categoryId: json['categoryId'] as String?,
  transactionDate: DateTime.parse(json['transactionDate'] as String),
  description: json['description'] as String,
  note: json['note'] as String?,
  payee: json['payee'] as String?,
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$CreateTransactionRequestToJson(
  _CreateTransactionRequest instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'type': instance.type,
  'amount': instance.amount,
  'categoryId': instance.categoryId,
  'transactionDate': instance.transactionDate.toIso8601String(),
  'description': instance.description,
  'note': instance.note,
  'payee': instance.payee,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'tags': instance.tags,
};
