// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Currency _$CurrencyFromJson(Map<String, dynamic> json) => _Currency(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  decimalPlaces: (json['decimalPlaces'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$CurrencyToJson(_Currency instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'symbol': instance.symbol,
  'decimalPlaces': instance.decimalPlaces,
  'isActive': instance.isActive,
};
