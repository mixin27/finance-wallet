import 'package:drift/drift.dart';
import 'package:finance_auth/finance_auth.dart' as models;

import '../../../../core/database/app_database.dart';

class AuthLocalDatasource {
  final AppDatabase _database;

  AuthLocalDatasource(this._database);

  // ========== USER OPERATIONS ==========

  // Get current user from local cache
  Future<models.User?> getCachedUser() async {
    final query = _database.select(_database.users);

    final result = await query.getSingleOrNull();
    return result != null ? _mapToUserModel(result) : null;
  }

  // Get user by ID
  Future<models.User?> getUserById(String id) async {
    final query = _database.select(_database.users)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToUserModel(result) : null;
  }

  // Cache/Update user data
  Future<void> cacheUser(models.User user) async {
    await _database
        .into(_database.users)
        .insertOnConflictUpdate(
          UsersCompanion(
            id: Value(user.id),
            email: Value(user.email),
            username: Value(user.username),
            fullName: Value(user.fullName),
            phoneNumber: Value(user.phoneNumber),
            profileImageUrl: Value(user.profileImageUrl),
            isEmailVerified: Value(user.isEmailVerified),
            authProvider: Value(user.authProvider),
            createdAt: Value(user.createdAt),
            lastLoginAt: Value(user.lastLoginAt),
            cachedAt: Value(DateTime.now()),
          ),
        );
  }

  // Delete user from cache (on logout)
  Future<void> deleteUser(String id) async {
    await (_database.delete(
      _database.users,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all users (complete logout)
  Future<void> clearAllUsers() async {
    await _database.delete(_database.users).go();
  }

  // Check if user cache is stale
  Future<bool> isUserCacheStale(int maxAgeMinutes) async {
    final query = _database.select(_database.users);

    final result = await query.getSingleOrNull();
    if (result == null) return true;

    final age = DateTime.now().difference(result.cachedAt);
    return age.inMinutes > maxAgeMinutes;
  }

  // Update last login time
  Future<void> updateLastLogin(String userId) async {
    await (_database.update(
      _database.users,
    )..where((t) => t.id.equals(userId))).write(
      UsersCompanion(
        lastLoginAt: Value(DateTime.now()),
        cachedAt: Value(DateTime.now()),
      ),
    );
  }

  // Update profile image URL
  Future<void> updateProfileImage(String userId, String? imageUrl) async {
    await (_database.update(
      _database.users,
    )..where((t) => t.id.equals(userId))).write(
      UsersCompanion(
        profileImageUrl: Value(imageUrl),
        cachedAt: Value(DateTime.now()),
      ),
    );
  }

  // Update user info (for profile updates)
  Future<void> updateUserInfo(
    String userId, {
    String? username,
    String? fullName,
    String? phoneNumber,
  }) async {
    final companion = UsersCompanion(
      username: username != null ? Value(username) : const Value.absent(),
      fullName: fullName != null ? Value(fullName) : const Value.absent(),
      phoneNumber: phoneNumber != null
          ? Value(phoneNumber)
          : const Value.absent(),
      cachedAt: Value(DateTime.now()),
    );

    await (_database.update(
      _database.users,
    )..where((t) => t.id.equals(userId))).write(companion);
  }

  // Helper to map database model to domain model
  models.User _mapToUserModel(User user) {
    return models.User(
      id: user.id,
      email: user.email,
      username: user.username,
      fullName: user.fullName,
      phoneNumber: user.phoneNumber,
      profileImageUrl: user.profileImageUrl,
      isEmailVerified: user.isEmailVerified,
      authProvider: user.authProvider,
      createdAt: user.createdAt,
      lastLoginAt: user.lastLoginAt,
    );
  }
}
