import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Interceptor that logs requests and responses in debug mode
class LoggingInterceptor extends Interceptor {
  final Logger _logger;
  final bool enabled;

  LoggingInterceptor({Logger? logger, this.enabled = true})
    : _logger =
          logger ??
          Logger(
            printer: PrettyPrinter(
              methodCount: 0,
              errorMethodCount: 5,
              lineLength: 75,
              colors: true,
              printEmojis: true,
              dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
            ),
          );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enabled) {
      _logger.d('📤 REQUEST[${options.method}] => ${options.uri}');
      _logger.d('Headers: ${options.headers}');
      if (options.data != null) {
        _logger.d('Body: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        _logger.d('Query Parameters: ${options.queryParameters}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enabled) {
      _logger.i(
        '📥 RESPONSE[${response.statusCode}] <= ${response.requestOptions.uri}',
      );
      _logger.i('Data: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enabled) {
      _logger.e(
        '❌ ERROR[${err.response?.statusCode}] <= ${err.requestOptions.uri}',
      );
      _logger.e('Message: ${err.message}');
      if (err.response != null) {
        _logger.e('Response: ${err.response?.data}');
      }
      _logger.e('Stack trace: ${err.stackTrace}');
    }
    handler.next(err);
  }
}
