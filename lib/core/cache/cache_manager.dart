abstract class CacheManager<T> {
  T? get();
  void put(T data, {Duration? ttl});
  void invalidate();
  void invalidateAll();
  Map<String, dynamic> getStats();
  void cleanupExpired();
}
