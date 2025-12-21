import 'package:dio/dio.dart';
import 'package:finance_auth/finance_auth.dart' hide NetworkException;

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';

class UserRemoteDatasource {
  final Dio _dio;

  UserRemoteDatasource(this._dio);

  Future<User> getCurrentUser() async {
    try {
      final response = await _dio.get(ApiConfig.currentUser);

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (!apiResponse.success && response.statusCode == 401) {
        throw UnauthorizedException('Unauthorized');
      }

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
