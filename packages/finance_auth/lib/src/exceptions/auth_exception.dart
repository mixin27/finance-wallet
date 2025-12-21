/// Base exception class for all authentication-related exceptions
abstract class AuthException implements Exception {
  final String message;
  final dynamic originalError;
  final StackTrace? stackTrace;

  const AuthException(this.message, {this.originalError, this.stackTrace});

  @override
  String toString() => 'AuthException: $message';
}

class AuthApiException extends AuthException {
  const AuthApiException({
    String message = 'Error occurred when calling API',
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(message, originalError: originalError, stackTrace: stackTrace);

  @override
  String toString() => 'AuthApiException: $message';
}

class InvalidCredentialsException extends AuthException {
  const InvalidCredentialsException({
    String message = 'Invalid email or password',
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(message, originalError: originalError, stackTrace: stackTrace);

  @override
  String toString() => 'InvalidCredentialsException: $message';
}

class NetworkException extends AuthException {
  const NetworkException({
    String message = 'Network error occurred. Please check your connection.',
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(message, originalError: originalError, stackTrace: stackTrace);

  @override
  String toString() => 'NetworkException: $message';
}

class SessionExpiredException extends AuthException {
  const SessionExpiredException({
    String message = 'Your session has expired. Please login again.',
    dynamic originalError,
    StackTrace? stackTrace,
  }) : super(message, originalError: originalError, stackTrace: stackTrace);

  @override
  String toString() => 'SessionExpiredException: $message';
}
