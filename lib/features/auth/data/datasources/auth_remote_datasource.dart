import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/user.dart';

class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  Future<AuthResponse> login(LoginRequest request) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await _dio.post(ApiConfig.login, data: request.toJson());

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        final authResponse = AuthResponse.fromJson(apiResponse.data!);
        final user = authResponse.user;
        await prefs.setString('_user', jsonEncode(user.toJson()));

        return authResponse;
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final message = e.response!.data['message'] ?? 'Login failed';

        if (statusCode == 401) {
          throw UnauthorizedException(message);
        }
        throw ServerException(message, statusCode: statusCode);
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.register,
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return AuthResponse.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final message = e.response!.data['message'] ?? 'Registration failed';
        throw ServerException(message, statusCode: statusCode);
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<User> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final cachedUser = prefs.getString('_user');
      if (cachedUser != null && cachedUser.isNotEmpty) {
        final decoded = jsonDecode(cachedUser);
        final user = User.fromJson(decoded);
        return user;
      }

      final response = await _dio.get(ApiConfig.currentUser);

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return User.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to get user',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }
}
