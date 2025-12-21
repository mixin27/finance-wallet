import 'package:finance_auth/finance_auth.dart' as auth;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/user_local_datasource.dart';
import '../datasources/user_remote_datasource.dart';

class ProfileRepository {
  final UserRemoteDatasource _remoteDatasource;
  final UserLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  ProfileRepository(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  Future<auth.User> getCurrentUser({bool forceRefresh = false}) async {
    try {
      // Try to get from cache first (unless force refresh)
      if (!forceRefresh) {
        final cachedUser = await _localDatasource.getCachedUser();

        // If cache exists and is not stale (< 30 minutes), return it
        if (cachedUser != null) {
          final isCacheStale = await _localDatasource.isUserCacheStale(30);
          if (!isCacheStale) {
            return cachedUser;
          }
        }
      }

      // Check network connectivity
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        // Return cached user if available
        final cachedUser = await _localDatasource.getCachedUser();
        if (cachedUser != null) {
          return cachedUser;
        }
        return throw NetworkException('No internet connection');
      }

      // Fetch fresh user data from server
      final user = await _remoteDatasource.getCurrentUser();

      // Update cache
      await _localDatasource.cacheUser(user);

      return user;
    } on UnauthorizedException catch (e) {
      // Clear cache on unauthorized
      await _localDatasource.clearAllUsers();
      throw UnauthorizedException(e.message);
    } on ServerException catch (e) {
      // Try to return cached user on server error
      final cachedUser = await _localDatasource.getCachedUser();
      if (cachedUser != null) {
        return cachedUser;
      }
      throw ServerException(e.message, statusCode: e.statusCode);
    } on NetworkException catch (e) {
      // Try to return cached user on network error
      final cachedUser = await _localDatasource.getCachedUser();
      if (cachedUser != null) {
        return cachedUser;
      }
      throw NetworkException(e.message);
    } catch (e) {
      return throw ServerException(e.toString());
    }
  }

  Future<void> clearAllUserData() async {
    await _localDatasource.clearAllUsers();
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

  // /// Update profile image
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
