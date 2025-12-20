import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../models/dashboard_overview.dart';
import '../models/statistics.dart';

class DashboardLocalDatasource {
  final AppDatabase _database;

  DashboardLocalDatasource(this._database);

  // Cache dashboard overview
  Future<void> cacheDashboardOverview(DashboardOverview overview) async {
    await _database
        .into(_database.dashboardCache)
        .insertOnConflictUpdate(
          DashboardCacheCompanion(
            key: const Value('dashboard_overview'),
            jsonData: Value(jsonEncode(overview.toJson())),
            cachedAt: Value(DateTime.now()),
          ),
        );
  }

  // Get cached dashboard overview
  Future<DashboardOverview?> getCachedDashboardOverview() async {
    final query = _database.select(_database.dashboardCache)
      ..where((t) => t.key.equals('dashboard_overview'));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    try {
      final Map<String, dynamic> jsonData =
          jsonDecode(result.jsonData) as Map<String, dynamic>;
      return DashboardOverview.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }

  // Cache statistics with key
  Future<void> cacheStatistics(String key, Statistics statistics) async {
    await _database
        .into(_database.dashboardCache)
        .insertOnConflictUpdate(
          DashboardCacheCompanion(
            key: Value(key),
            jsonData: Value(jsonEncode(statistics.toJson())),
            cachedAt: Value(DateTime.now()),
          ),
        );
  }

  // Get cached statistics by key
  Future<Statistics?> getCachedStatistics(String key) async {
    final query = _database.select(_database.dashboardCache)
      ..where((t) => t.key.equals(key));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    try {
      final Map<String, dynamic> jsonData =
          jsonDecode(result.jsonData) as Map<String, dynamic>;
      return Statistics.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }

  // Clear specific cache
  Future<void> clearCache(String key) async {
    await (_database.delete(
      _database.dashboardCache,
    )..where((t) => t.key.equals(key))).go();
  }

  // Clear all dashboard cache
  Future<void> clearAllCache() async {
    await _database.delete(_database.dashboardCache).go();
  }

  // Check if cache is stale (older than specified minutes)
  Future<bool> isCacheStale(String key, int maxAgeMinutes) async {
    final query = _database.select(_database.dashboardCache)
      ..where((t) => t.key.equals(key));

    final result = await query.getSingleOrNull();
    if (result == null) return true;

    final age = DateTime.now().difference(result.cachedAt);
    return age.inMinutes > maxAgeMinutes;
  }
}
