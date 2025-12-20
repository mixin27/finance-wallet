import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/cache/cache_entry.dart';
import '../../../../core/cache/transaction_cache_key.dart';
import '../../../../core/network/page.dart';
import '../models/transaction.dart';
import '../models/transaction_filter.dart';

/// Cache manager for transaction data with pagination support
class TransactionCacheManager {
  final SharedPreferences? prefs;

  TransactionCacheManager({this.prefs});

  // In-memory cache with TTL
  final Map<String, CacheEntry<Page<Transaction>>> _cache = {};

  // Default TTL: 5 minutes
  static const Duration defaultTTL = Duration(minutes: 5);

  // Max cache size (prevent memory bloat)
  static const int maxCacheSize = 50;

  /// Get cached page if available and valid
  Page<Transaction>? get(TransactionFilter filter) {
    final key = TransactionCacheKey(filter).key;

    if (prefs != null) {
      final cached = prefs!.getString(key);
      if (cached == null) return null;

      final Map<String, dynamic> decodedJson = jsonDecode(cached);

      final page = Page<Transaction>.fromJson(
        decodedJson,
        (json) => Transaction.fromJson(json),
      );
      return page;
    } else {
      final entry = _cache[key];

      if (entry == null) return null;

      // Check if expired
      if (entry.isExpired) {
        _cache.remove(key);
        return null;
      }

      return entry.data;
    }
  }

  /// Cache a page of transactions
  void put(TransactionFilter filter, Page<Transaction> page, {Duration? ttl}) {
    final key = TransactionCacheKey(filter).key;

    if (prefs != null) {
      final encoded = jsonEncode(
        page.toJson((transaction) => transaction.toJson()),
      );
      prefs!.setString(key, encoded);
      return;
    } else {
      // Enforce max cache size (LRU-style: remove oldest)
      if (_cache.length >= maxCacheSize) {
        final oldestKey = _cache.keys.first;
        _cache.remove(oldestKey);
      }

      _cache[key] = CacheEntry(
        data: page,
        timestamp: DateTime.now(),
        ttl: ttl ?? defaultTTL,
      );
    }
  }

  /// Invalidate cache for specific filter (all pages)
  void invalidate(TransactionFilter filter) {
    final baseKey = TransactionCacheKey(filter).baseKey;

    // Remove all entries that match the base key (all pages of same filter)
    _cache.removeWhere((key, _) => key.startsWith(baseKey));
  }

  /// Invalidate all transaction caches
  void invalidateAll() {
    _cache.clear();
  }

  /// Invalidate caches related to specific account
  void invalidateByAccount(String accountId) {
    _cache.removeWhere((key, _) => key.contains('acc:$accountId'));
  }

  /// Invalidate caches related to specific category
  void invalidateByCategory(String categoryId) {
    _cache.removeWhere((key, _) => key.contains('cat:$categoryId'));
  }

  /// Invalidate caches related to specific type
  void invalidateByType(String type) {
    _cache.removeWhere((key, _) => key.contains('type:$type'));
  }

  /// Get cache statistics (for debugging)
  Map<String, dynamic> getStats() {
    final validEntries = _cache.values.where((e) => e.isValid).length;
    final expiredEntries = _cache.length - validEntries;

    return {
      'total': _cache.length,
      'valid': validEntries,
      'expired': expiredEntries,
      'maxSize': maxCacheSize,
    };
  }

  /// Clear expired entries (call periodically)
  void cleanupExpired() {
    _cache.removeWhere((_, entry) => entry.isExpired);
  }
}
