import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:finance_auth/finance_auth.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/auth_local_datasource.dart';

class FinanceAuthRepository implements AuthRepository {
  final Dio _dio;

  final AuthLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  static const String _accessTokenKey = 'fw_auth_access_token';
  static const String _refreshTokenKey = 'fw_auth_refresh_token';
  static const String _tokenTypeKey = 'fw_auth_token_type';

  static const String _userKey = 'fw_auth_user';
  static const String _expiresAtKey = 'fw_auth_expires_at';
  static const String _rememberMeKey = 'fw_auth_remember_me';

  FinanceAuthRepository({
    required AuthLocalDatasource localDatasource,
    Dio? dio,
    NetworkInfo? networkInfo,
  }) : _localDatasource = localDatasource,
       _dio = dio ?? Dio(),
       _networkInfo = networkInfo ?? NetworkInfoImpl(Connectivity());

  @override
  Future<AuthResponse> login(Credentials credentials) async {
    try {
      // Login requires network
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        throw NetworkException();
      }

      final response = await _dio.post(
        ApiConfig.login,
        data: credentials.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        final authResponse = AuthResponse.fromJson(apiResponse.data!);

        // Cache user data to local database
        await _localDatasource.cacheUser(authResponse.user);
        await _localDatasource.updateLastLogin(authResponse.user.id);

        return authResponse;
      } else {
        throw AuthApiException(message: apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        throw InvalidCredentialsException(originalError: e);
      }
      throw NetworkException(originalError: e);
    }
  }

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      // Registration requires network
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        throw NetworkException();
      }

      final response = await _dio.post(
        ApiConfig.register,
        data: {
          "username": username,
          "email": email,
          "password": password,
          "fullName": fullName,
          if (additionalData != null) ...additionalData,
        },
      );

      if (response.statusCode == 400) {
        throw AuthApiException(
          message: response.statusMessage ?? "Validation failed",
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw AuthApiException(
          message: e.response?.statusMessage ?? "An error occurred",
          originalError: e,
        );
      }

      throw NetworkException(originalError: e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      final refreshToken = await getRefreshToken();
      await _dio.post(ApiConfig.logout, data: {'refreshToken': refreshToken});
    } on DioException catch (e) {
      throw NetworkException(originalError: e);
    }
  }

  @override
  Future<AuthResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        ApiConfig.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      return AuthResponse.fromJson(response.data["data"]);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const SessionExpiredException();
      }
      throw NetworkException(originalError: e);
    }
  }

  @override
  Future<User> getCurrentUser() async {
    try {
      final accessToken = await getAccessToken();
      final response = await _dio.get(
        ApiConfig.currentUser,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return User.fromJson(response.data["data"]);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const SessionExpiredException();
      }
      throw NetworkException(originalError: e);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _dio.put(
        ApiConfig.changePassword,
        data: {'currentPassword': oldPassword, 'newPassword': newPassword},
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw const InvalidCredentialsException(
          message: 'Current password is incorrect',
        );
      }
      throw NetworkException(
        message: 'Failed to update password',
        originalError: e,
      );
    }
  }

  @override
  Future<void> clearTokens() async {
    final secureStorage = SecureStorageService.instance;
    await Future.wait([
      secureStorage.delete(_accessTokenKey),
      secureStorage.delete(_refreshTokenKey),
      secureStorage.delete(_tokenTypeKey),
      secureStorage.delete(_userKey),
      secureStorage.delete(_expiresAtKey),
      secureStorage.delete(_rememberMeKey),
    ]);
  }

  @override
  Future<String?> getAccessToken() async {
    final secureStorage = SecureStorageService.instance;
    return secureStorage.get<String?>(_accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    final secureStorage = SecureStorageService.instance;
    return secureStorage.get<String?>(_refreshTokenKey);
  }

  @override
  Future<String?> getTokenType() async {
    final secureStorage = SecureStorageService.instance;
    return secureStorage.get<String?>(_tokenTypeKey);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    final secureStorage = SecureStorageService.instance;
    await secureStorage.save<String>(_accessTokenKey, token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    final secureStorage = SecureStorageService.instance;
    await secureStorage.save<String>(_refreshTokenKey, token);
  }

  @override
  Future<void> saveTokenType(String type) async {
    final secureStorage = SecureStorageService.instance;
    await secureStorage.save<String>(_tokenTypeKey, type);
  }

  @override
  Future<void> sendVerificationEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> verifyEmail(String token) {
    throw UnimplementedError();
  }
}
