// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_preference_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateUserPreferenceRequest _$UpdateUserPreferenceRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateUserPreferenceRequest(
  defaultCurrencyId: json['defaultCurrencyId'] as String?,
  language: json['language'] as String?,
  dateFormat: json['dateFormat'] as String?,
  firstDayOfWeek: (json['firstDayOfWeek'] as num?)?.toInt(),
  timezone: json['timezone'] as String?,
  theme: json['theme'] as String?,
  enableNotifications: json['enableNotifications'] as bool?,
  enableBiometric: json['enableBiometric'] as bool?,
  autoBackup: json['autoBackup'] as bool?,
);

Map<String, dynamic> _$UpdateUserPreferenceRequestToJson(
  _UpdateUserPreferenceRequest instance,
) => <String, dynamic>{
  'defaultCurrencyId': instance.defaultCurrencyId,
  'language': instance.language,
  'dateFormat': instance.dateFormat,
  'firstDayOfWeek': instance.firstDayOfWeek,
  'timezone': instance.timezone,
  'theme': instance.theme,
  'enableNotifications': instance.enableNotifications,
  'enableBiometric': instance.enableBiometric,
  'autoBackup': instance.autoBackup,
};
