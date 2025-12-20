class CacheEntry<T> {
  final T data;
  final DateTime timestamp;
  final Duration ttl;

  CacheEntry({required this.data, required this.timestamp, required this.ttl});

  bool get isExpired {
    return DateTime.now().difference(timestamp) > ttl;
  }

  bool get isValid => !isExpired;
}
