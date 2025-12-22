import 'package:finance_wallet/core/database/app_database.dart';
import '../models/user_preference.dart' as models;

class UserPreferenceLocalDatasource {
  final AppDatabase _database;

  UserPreferenceLocalDatasource(this._database);

  Future<models.UserPreference?> getCachedUserPreference() async {
    final query = _database.select(_database.userPreferences);
    final result = await query.getSingleOrNull();
    return result != null ? _mapToModel(result) : null;
  }

  Future<void> cacheUserPreference(models.UserPreference preference) async {
    await _database
        .into(_database.userPreferences)
        .insertOnConflictUpdate(
          UserPreferencesCompanion.insert(
            userId: preference.userId,
            defaultCurrencyId: preference.defaultCurrencyId,
            defaultCurrencyCode: preference.defaultCurrencyCode,
            defaultCurrencySymbol: preference.defaultCurrencySymbol,
            language: preference.language,
            dateFormat: preference.dateFormat,
            firstDayOfWeek: preference.firstDayOfWeek,
            timezone: preference.timezone,
            theme: preference.theme,
            enableNotifications: preference.enableNotifications,
            enableBiometric: preference.enableBiometric,
            autoBackup: preference.autoBackup,
            createdAt: preference.createdAt,
            updatedAt: preference.updatedAt,
          ),
        );
  }

  Future<void> clearUserPreference() async {
    await _database.delete(_database.userPreferences).go();
  }

  models.UserPreference _mapToModel(UserPreference data) {
    return models.UserPreference(
      userId: data.userId,
      defaultCurrencyId: data.defaultCurrencyId,
      defaultCurrencyCode: data.defaultCurrencyCode,
      defaultCurrencySymbol: data.defaultCurrencySymbol,
      language: data.language,
      dateFormat: data.dateFormat,
      firstDayOfWeek: data.firstDayOfWeek,
      timezone: data.timezone,
      theme: data.theme,
      enableNotifications: data.enableNotifications,
      enableBiometric: data.enableBiometric,
      autoBackup: data.autoBackup,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }
}
