import 'package:dio/dio.dart';

import '../constants/storage_keys.dart';
import '../storage/secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final _storage = SecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add auth token to requests
    final token = await _storage.read(StorageKeys.accessToken);
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - token expired
    if (err.response?.statusCode == 401) {
      // todo(mixin27): Trigger refresh token or logout
      // For now, just pass the error
    }

    handler.next(err);
  }
}
