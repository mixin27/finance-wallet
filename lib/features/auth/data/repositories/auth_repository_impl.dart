import 'package:dartz/dartz.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;
  final SecureStorage _storage;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._storage,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest request) async {
    try {
      // Login requires network
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final response = await _remoteDatasource.login(request);

      // Save tokens to secure storage
      await _storage.write(StorageKeys.accessToken, response.accessToken);
      await _storage.write(StorageKeys.refreshToken, response.refreshToken);
      await _storage.write(StorageKeys.userId, response.user.id);
      await _storage.write(StorageKeys.userEmail, response.user.email);

      // Cache user data to local database
      await _localDatasource.cacheUser(response.user);
      await _localDatasource.updateLastLogin(response.user.id);

      return Right(response);
    } on UnauthorizedException catch (e) {
      return Left(Failure.unauthorized(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      // Registration requires network
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final response = await _remoteDatasource.register(request);

      // Save tokens
      await _storage.write(StorageKeys.accessToken, response.accessToken);
      await _storage.write(StorageKeys.refreshToken, response.refreshToken);
      await _storage.write(StorageKeys.userId, response.user.id);
      await _storage.write(StorageKeys.userEmail, response.user.email);

      // Cache user data to local database
      await _localDatasource.cacheUser(response.user);
      // remove when user need to verify email and login again
      await _localDatasource.updateLastLogin(response.user.id);

      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser({
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from cache first (unless force refresh)
      if (!forceRefresh) {
        final cachedUser = await _localDatasource.getCachedUser();

        // If cache exists and is not stale (< 30 minutes), return it
        if (cachedUser != null) {
          final isCacheStale = await _localDatasource.isUserCacheStale(30);
          if (!isCacheStale) {
            return Right(cachedUser);
          }
        }
      }

      // Check network connectivity
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        // Return cached user if available
        final cachedUser = await _localDatasource.getCachedUser();
        if (cachedUser != null) {
          return Right(cachedUser);
        }
        return Left(Failure.network('No internet connection'));
      }

      final user = await _remoteDatasource.getCurrentUser();

      // Update cache
      await _localDatasource.cacheUser(user);

      return Right(user);
    } on UnauthorizedException catch (e) {
      // Clear cache on unauthorized
      await _localDatasource.clearAllUsers();
      return Left(Failure.unauthorized(e.message));
    } on ServerException catch (e) {
      // Try to return cached user on server error
      final cachedUser = await _localDatasource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      // Try to return cached user on network error
      final cachedUser = await _localDatasource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    try {
      final refreshToken = await getRefreshToken();

      // Try to logout from server if connected
      final isConnected = await _networkInfo.isConnected;
      if (isConnected && refreshToken != null) {
        try {
          await _remoteDatasource.logout(refreshToken);
        } catch (e) {
          // Continue with local logout even if server logout fails
        }
      }
    } finally {
      // Always clear local data
      await clearTokens();
      await _localDatasource.clearAllUsers();
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _storage.read(StorageKeys.accessToken);
    return token != null && token.isNotEmpty;
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(StorageKeys.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(StorageKeys.refreshToken);
  }

  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }

  /// Get cached user without network call
  Future<Either<Failure, User>> getCachedUser() async {
    try {
      final cachedUser = await _localDatasource.getCachedUser();
      if (cachedUser == null) {
        return Left(Failure.cache('No cached user data'));
      }
      return Right(cachedUser);
    } catch (e) {
      return Left(Failure.cache(e.toString()));
    }
  }

  /// Update user profile
  // Future<Either<Failure, User>> updateProfile({
  //   String? username,
  //   String? fullName,
  //   String? phoneNumber,
  // }) async {
  //   try {
  //     final isConnected = await _networkInfo.isConnected;
  //     if (!isConnected) {
  //       return Left(Failure.network('No internet connection'));
  //     }

  //     final user = await _remoteDatasource.updateProfile(
  //       username: username,
  //       fullName: fullName,
  //       phoneNumber: phoneNumber,
  //     );

  //     // Update cache
  //     await _localDatasource.cacheUser(user);

  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(Failure.server(e.message, statusCode: e.statusCode));
  //   } on NetworkException catch (e) {
  //     return Left(Failure.network(e.message));
  //   } catch (e) {
  //     return Left(Failure.server(e.toString()));
  //   }
  // }

  /// Update profile image
  // Future<Either<Failure, User>> updateProfileImage(String imageUrl) async {
  //   try {
  //     final isConnected = await _networkInfo.isConnected;
  //     if (!isConnected) {
  //       return Left(Failure.network('No internet connection'));
  //     }

  //     final user = await _remoteDatasource.updateProfileImage(imageUrl);

  //     // Update cache
  //     await _localDatasource.cacheUser(user);

  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(Failure.server(e.message, statusCode: e.statusCode));
  //   } on NetworkException catch (e) {
  //     return Left(Failure.network(e.message));
  //   } catch (e) {
  //     return Left(Failure.server(e.toString()));
  //   }
  // }
}
