import 'package:dio/dio.dart';
import 'package:finance_auth/finance_auth.dart';

/// Interceptor that adds authorization header to requests
class AuthInterceptor extends Interceptor {
  final FinanceAuthService _authService;

  AuthInterceptor(this._authService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _authService.getAccessToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (e) {
      // If getting token fails, continue without it
      handler.next(options);
    }
  }
}
