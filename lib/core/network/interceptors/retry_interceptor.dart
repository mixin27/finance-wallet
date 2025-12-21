import 'package:dio/dio.dart';

/// Interceptor that retries failed requests for network errors
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;
  final Dio dio;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only retry on network errors or timeout
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    final extra = err.requestOptions.extra;
    final retries = extra['retries'] ?? 0;

    if (retries >= maxRetries) {
      return handler.next(err);
    }

    // Increment retry count
    err.requestOptions.extra['retries'] = retries + 1;

    // Wait before retrying
    await Future.delayed(retryDelay * (retries + 1));

    try {
      // Retry the request
      final response = await dio.fetch(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }

  bool _shouldRetry(DioException err) {
    // Retry on connection errors, timeouts, or 503 Service Unavailable
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode == 503);
  }
}
