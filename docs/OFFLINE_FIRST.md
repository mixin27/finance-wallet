# Offline-First Implementation Guide

## Overview

This implementation provides offline-first functionality for your Flutter finance wallet app using Drift ORM. The architecture follows this pattern:

**Local First → Network Fallback → Cache on Success**

## Key Features

✅ **Offline-first data fetching** - Always try local cache first
✅ **Automatic cache updates** - Save remote data to local DB
✅ **Network-aware operations** - Check connectivity before API calls
✅ **Graceful degradation** - Fall back to cached data on errors
✅ **Background sync** - Easy to implement with this foundation

## Implementation Steps

### 1. Add Dependencies

Update your `pubspec.yaml` with the required dependencies (see artifacts).

### 2. Generate Code

Run code generation for Drift and other packages:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Project Structure

```
lib/
├── core/
│   ├── database/
│   │   ├── database.dart              # Drift database definition
│   │   └── database.g.dart            # Generated
│   ├── network/
│   │   └── network_info.dart          # Network connectivity helper
│   └── di/
│       └── injection.dart             # Dependency injection
│
└── features/
    └── [feature]/
        └── data/
            ├── datasources/
            │   ├── [feature]_remote_datasource.dart
            │   └── [feature]_local_datasource.dart  # New
            └── repositories/
                └── [feature]_repository_impl.dart    # Updated
```

### 4. How It Works

#### Data Flow

```
UI Request
    ↓
Repository checks forceRefresh flag
    ↓
[No] → Try local database first
    ↓
Local data exists?
    ↓
[Yes] → Return cached data
[No]  → Continue to network
    ↓
Check network connectivity
    ↓
[No connection] → Return error or cached data
[Connected]     → Fetch from API
    ↓
Save to local database
    ↓
Return fresh data
```

#### Error Handling

```
API Call Fails
    ↓
Try local database
    ↓
Local data exists?
    ↓
[Yes] → Return cached data
[No]  → Return error
```

### 5. Repository Pattern

Each repository now follows this pattern:

```dart
@override
Future<Either<Failure, T>> getData({
  bool forceRefresh = false,
}) async {
  try {
    // Step 1: Try local first (unless force refresh)
    if (!forceRefresh) {
      final localData = await _localDatasource.getData();
      if (localData.isNotEmpty) {
        return Right(localData);
      }
    }

    // Step 2: Check network
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      final localData = await _localDatasource.getData();
      if (localData.isEmpty) {
        return Left(Failure.network('No internet'));
      }
      return Right(localData);
    }

    // Step 3: Fetch from API
    final remoteData = await _remoteDatasource.getData();

    // Step 4: Cache locally
    await _localDatasource.upsertData(remoteData);

    return Right(remoteData);
  } on ServerException catch (e) {
    // Step 5: Fallback to cache on error
    final localData = await _localDatasource.getData();
    if (localData.isNotEmpty) {
      return Right(localData);
    }
    return Left(Failure.server(e.message));
  }
}
```

### 6. CRUD Operations Strategy

#### Read Operations (GET)
- ✅ Offline-first
- ✅ Network as backup
- ✅ Cache on success

#### Create/Update/Delete Operations
- ⚠️ Require network connection
- ✅ Update local cache on success
- ❌ No offline queue (can be added)

### 7. Cache Invalidation

There are several strategies for cache invalidation:

#### 1. Manual Refresh
```dart
// In UI
onRefresh: () async {
  ref.invalidate(budgetsProvider);
}
```

#### 2. Time-based (Dashboard)
```dart
final isCacheStale = await _localDatasource.isCacheStale(
  cacheKey,
  60, // minutes
);
```

#### 3. On mutation
```dart
// After creating/updating/deleting
await _localDatasource.clearCache(cacheKey);
```

### 8. Testing Offline Functionality

#### Airplane Mode Testing
1. Open app with internet
2. Enable airplane mode
3. Navigate around - should see cached data
4. Try to create/edit - should show error
5. Disable airplane mode
6. Pull to refresh - should get fresh data

#### No Cache Testing
1. Clear app data
2. Open app in airplane mode
3. Should show appropriate error messages

### 9. Optimization Tips

#### Selective Caching
```dart
// Don't cache everything - be strategic
if (shouldCache(dataType)) {
  await _localDatasource.upsert(data);
}
```

#### Batch Operations
```dart
// Use batch inserts for better performance
await _database.batch((batch) {
  for (final item in items) {
    batch.insert(table, item, mode: InsertMode.replace);
  }
});
```

#### Index Your Tables
```dart
class Transactions extends Table {
  // ...fields...

  @override
  List<Set<Column>> get uniqueKeys => [
    {transactionDate, accountId}, // Composite index
  ];
}
```

### 10. Background Sync (Optional)

To implement background sync for offline mutations:

```dart
// Store pending changes
class PendingChanges extends Table {
  TextColumn get id => text()();
  TextColumn get operation => text()(); // CREATE, UPDATE, DELETE
  TextColumn get entityType => text()(); // budget, transaction, etc
  TextColumn get entityId => text()();
  TextColumn get jsonData => text()();
  DateTimeColumn get createdAt => dateTime()();
}

// Sync when network returns
Future<void> syncPendingChanges() async {
  final pending = await _database.select(_database.pendingChanges).get();

  for (final change in pending) {
    try {
      await _performSync(change);
      await _database.delete(_database.pendingChanges)
        .delete(change);
    } catch (e) {
      // Retry later
    }
  }
}
```

### 11. Migration Strategy

If you already have existing code using SharedPreferences:

```dart
// Migrate existing cache to Drift
Future<void> migrateFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = ['cached_goals', 'cached_budgets', ...];

  for (final key in keys) {
    final cached = prefs.getString(key);
    if (cached != null) {
      // Parse and insert into Drift
      final data = jsonDecode(cached);
      await _localDatasource.upsertData(data);

      // Remove from SharedPreferences
      await prefs.remove(key);
    }
  }
}
```

### 12. Common Patterns

#### Loading States
```dart
final dataAsync = ref.watch(dataProvider);

return dataAsync.when(
  data: (data) => DataView(data),
  loading: () => LoadingIndicator(),
  error: (error, _) => ErrorView(error),
);
```

#### Optimistic Updates
```dart
// Update UI immediately
ref.read(budgetsProvider.notifier).update(updatedBudget);

// Then sync with server
final result = await repository.updateBudget(id, request);
result.fold(
  (failure) => ref.invalidate(budgetsProvider), // Revert on error
  (_) => null, // Success - already updated
);
```

### 13. Monitoring

Add logging to track cache hits/misses:

```dart
if (localData.isNotEmpty) {
  debugPrint('✅ Cache hit: $cacheKey');
  return Right(localData);
}

debugPrint('❌ Cache miss: $cacheKey - fetching from network');
```

## Benefits

1. **Faster app** - Data loads instantly from cache
2. **Offline capability** - Core features work without internet
3. **Better UX** - No loading spinners for cached data
4. **Reduced bandwidth** - Less API calls
5. **Cost savings** - Lower server costs

## Trade-offs

1. **Storage space** - Local database takes device storage
2. **Complexity** - More code to maintain
3. **Stale data** - Cached data might be outdated
4. **Sync conflicts** - Potential for data conflicts (if offline mutations allowed)

## Next Steps

1. Implement local datasources for all features
2. Update repository implementations
3. Add dependency injection
4. Test offline scenarios thoroughly
5. Consider adding background sync
6. Monitor cache performance
7. Add cache size limits if needed

## Questions?

Common scenarios:

**Q: How long should cache be valid?**
A: Depends on data freshness requirements. Financial data: 5-15 minutes. Static data (currencies): days.

**Q: Should I cache everything?**
A: No. Cache frequently accessed, relatively stable data. Don't cache one-time reports or very large datasets.

**Q: What about sensitive data?**
A: Use SQLCipher for encryption if storing sensitive financial data.

**Q: How to handle conflicts?**
A: Use timestamps. Server timestamp > local timestamp = server wins. Or implement CRDTs for complex scenarios.
