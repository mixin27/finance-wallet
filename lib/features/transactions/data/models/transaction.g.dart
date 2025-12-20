// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  id: json['id'] as String,
  account: TransactionAccountInfo.fromJson(
    json['account'] as Map<String, dynamic>,
  ),
  toAccount: json['toAccount'] == null
      ? null
      : TransactionAccountInfo.fromJson(
          json['toAccount'] as Map<String, dynamic>,
        ),
  category: json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>),
  type: json['type'] as String,
  amount: (json['amount'] as num).toDouble(),
  currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
  exchangeRate: (json['exchangeRate'] as num?)?.toDouble(),
  convertedAmount: (json['convertedAmount'] as num?)?.toDouble(),
  transactionDate: DateTime.parse(json['transactionDate'] as String),
  description: json['description'] as String,
  note: json['note'] as String?,
  payee: json['payee'] as String?,
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  status: json['status'] as String,
  tags: (json['tags'] as List<dynamic>)
      .map((e) => Tag.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'toAccount': instance.toAccount,
      'category': instance.category,
      'type': instance.type,
      'amount': instance.amount,
      'currency': instance.currency,
      'exchangeRate': instance.exchangeRate,
      'convertedAmount': instance.convertedAmount,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'description': instance.description,
      'note': instance.note,
      'payee': instance.payee,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_TransactionAccountInfo _$TransactionAccountInfoFromJson(
  Map<String, dynamic> json,
) => _TransactionAccountInfo(
  id: json['id'] as String,
  name: json['name'] as String,
  accountType: AccountTypeInfo.fromJson(
    json['accountType'] as Map<String, dynamic>,
  ),
  currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TransactionAccountInfoToJson(
  _TransactionAccountInfo instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'accountType': instance.accountType,
  'currency': instance.currency,
};

_AccountTypeInfo _$AccountTypeInfoFromJson(Map<String, dynamic> json) =>
    _AccountTypeInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$AccountTypeInfoToJson(_AccountTypeInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'color': instance.color,
  'icon': instance.icon,
};

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
  id: json['id'] as String,
  name: json['name'] as String,
  color: json['color'] as String?,
);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
};
