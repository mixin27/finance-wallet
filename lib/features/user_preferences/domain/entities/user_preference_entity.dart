class UserPreferenceEntity {
  final String userId;
  final String defaultCurrencyId;
  final String defaultCurrencyCode;
  final String defaultCurrencySymbol;
  final String language;
  final String dateFormat;
  final int firstDayOfWeek;
  final String timezone;
  final String theme;
  final bool enableNotifications;
  final bool enableBiometric;
  final bool autoBackup;

  const UserPreferenceEntity({
    required this.userId,
    required this.defaultCurrencyId,
    required this.defaultCurrencyCode,
    required this.defaultCurrencySymbol,
    required this.language,
    required this.dateFormat,
    required this.firstDayOfWeek,
    required this.timezone,
    required this.theme,
    required this.enableNotifications,
    required this.enableBiometric,
    required this.autoBackup,
  });

  UserPreferenceEntity copyWith({
    String? userId,
    String? defaultCurrencyId,
    String? defaultCurrencyCode,
    String? defaultCurrencySymbol,
    String? language,
    String? dateFormat,
    int? firstDayOfWeek,
    String? timezone,
    String? theme,
    bool? enableNotifications,
    bool? enableBiometric,
    bool? autoBackup,
  }) {
    return UserPreferenceEntity(
      userId: userId ?? this.userId,
      defaultCurrencyId: defaultCurrencyId ?? this.defaultCurrencyId,
      defaultCurrencyCode: defaultCurrencyCode ?? this.defaultCurrencyCode,
      defaultCurrencySymbol:
          defaultCurrencySymbol ?? this.defaultCurrencySymbol,
      language: language ?? this.language,
      dateFormat: dateFormat ?? this.dateFormat,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      timezone: timezone ?? this.timezone,
      theme: theme ?? this.theme,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      enableBiometric: enableBiometric ?? this.enableBiometric,
      autoBackup: autoBackup ?? this.autoBackup,
    );
  }

  @override
  bool operator ==(covariant UserPreferenceEntity other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.defaultCurrencyId == defaultCurrencyId &&
        other.defaultCurrencyCode == defaultCurrencyCode &&
        other.defaultCurrencySymbol == defaultCurrencySymbol &&
        other.language == language &&
        other.dateFormat == dateFormat &&
        other.firstDayOfWeek == firstDayOfWeek &&
        other.timezone == timezone &&
        other.theme == theme &&
        other.enableNotifications == enableNotifications &&
        other.enableBiometric == enableBiometric &&
        other.autoBackup == autoBackup;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        defaultCurrencyId.hashCode ^
        defaultCurrencyCode.hashCode ^
        defaultCurrencySymbol.hashCode ^
        language.hashCode ^
        dateFormat.hashCode ^
        firstDayOfWeek.hashCode ^
        timezone.hashCode ^
        theme.hashCode ^
        enableNotifications.hashCode ^
        enableBiometric.hashCode ^
        autoBackup.hashCode;
  }
}
