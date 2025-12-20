import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
abstract class Currency with _$Currency {
  const factory Currency({
    required String id,
    required String code,
    required String name,
    required String symbol,
    @Default(0) int decimalPlaces,
    @Default(true) bool isActive,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
