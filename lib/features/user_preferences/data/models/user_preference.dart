import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_preference_entity.dart';

part 'user_preference.freezed.dart';
part 'user_preference.g.dart';

@freezed
abstract class UserPreference with _$UserPreference {
  const UserPreference._();

  const factory UserPreference({
    required String userId,
    required String defaultCurrencyId,
    required String defaultCurrencyCode,
    required String defaultCurrencySymbol,
    required String language,
    required String dateFormat,
    required int firstDayOfWeek,
    required String timezone,
    required String theme,
    required bool enableNotifications,
    required bool enableBiometric,
    required bool autoBackup,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _UserPreference;

  factory UserPreference.fromJson(Map<String, dynamic> json) =>
      _$UserPreferenceFromJson(json);

  UserPreferenceEntity toEntity() => UserPreferenceEntity(
    userId: userId,
    defaultCurrencyId: defaultCurrencyId,
    defaultCurrencyCode: defaultCurrencyCode,
    defaultCurrencySymbol: defaultCurrencySymbol,
    language: language,
    dateFormat: dateFormat,
    firstDayOfWeek: firstDayOfWeek,
    timezone: timezone,
    theme: theme,
    enableNotifications: enableNotifications,
    enableBiometric: enableBiometric,
    autoBackup: autoBackup,
  );
}

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is String) {
      return DateTime.parse(json);
    } else if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json);
    }
    return DateTime.now();
  }

  @override
  dynamic toJson(DateTime date) => date.toIso8601String();
}
