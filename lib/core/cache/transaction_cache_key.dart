import '../../features/transactions/data/models/transaction_filter.dart';

/// Generates unique cache keys for transaction queries with filters
class TransactionCacheKey {
  final TransactionFilter filter;

  TransactionCacheKey(this.filter);

  /// Generate unique key based on filter parameters
  String get key {
    final parts = <String>[];

    if (filter.accountId != null) parts.add('acc:${filter.accountId}');
    if (filter.categoryId != null) parts.add('cat:${filter.categoryId}');
    if (filter.type != null) parts.add('type:${filter.type}');
    if (filter.startDate != null) {
      parts.add('start:${filter.startDate!.toIso8601String()}');
    }
    if (filter.endDate != null) {
      parts.add('end:${filter.endDate!.toIso8601String()}');
    }

    parts.add('page:${filter.page}');
    parts.add('size:${filter.size}');
    parts.add('sort:${filter.sortBy}:${filter.sortDirection}');

    return parts.join('|');
  }

  /// Generate base key without pagination (for invalidation)
  String get baseKey {
    final parts = <String>[];

    if (filter.accountId != null) parts.add('acc:${filter.accountId}');
    if (filter.categoryId != null) parts.add('cat:${filter.categoryId}');
    if (filter.type != null) parts.add('type:${filter.type}');
    if (filter.startDate != null) {
      parts.add('start:${filter.startDate!.toIso8601String()}');
    }
    if (filter.endDate != null) {
      parts.add('end:${filter.endDate!.toIso8601String()}');
    }

    return parts.join('|');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionCacheKey && other.key == key;
  }

  @override
  int get hashCode => key.hashCode;
}
