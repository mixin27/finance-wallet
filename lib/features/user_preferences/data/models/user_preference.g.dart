// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPreference _$UserPreferenceFromJson(Map<String, dynamic> json) =>
    _UserPreference(
      userId: json['userId'] as String,
      defaultCurrencyId: json['defaultCurrencyId'] as String,
      defaultCurrencyCode: json['defaultCurrencyCode'] as String,
      defaultCurrencySymbol: json['defaultCurrencySymbol'] as String,
      language: json['language'] as String,
      dateFormat: json['dateFormat'] as String,
      firstDayOfWeek: (json['firstDayOfWeek'] as num).toInt(),
      timezone: json['timezone'] as String,
      theme: json['theme'] as String,
      enableNotifications: json['enableNotifications'] as bool,
      enableBiometric: json['enableBiometric'] as bool,
      autoBackup: json['autoBackup'] as bool,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$UserPreferenceToJson(_UserPreference instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'defaultCurrencyId': instance.defaultCurrencyId,
      'defaultCurrencyCode': instance.defaultCurrencyCode,
      'defaultCurrencySymbol': instance.defaultCurrencySymbol,
      'language': instance.language,
      'dateFormat': instance.dateFormat,
      'firstDayOfWeek': instance.firstDayOfWeek,
      'timezone': instance.timezone,
      'theme': instance.theme,
      'enableNotifications': instance.enableNotifications,
      'enableBiometric': instance.enableBiometric,
      'autoBackup': instance.autoBackup,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
