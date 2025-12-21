import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.server(String message, {int? statusCode}) =
      ServerFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.cache(String message) = CacheFailure;
  const factory Failure.unauthorized(String message) = UnauthorizedFailure;
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.unknown(String message) = UnknownFailure;
}

extension FailureX on Failure {
  String get message => when(
    server: (msg, _) => msg,
    network: (msg) => msg,
    unauthorized: (msg) => msg,
    validation: (msg) => msg,
    cache: (msg) => msg,
    unknown: (msg) => msg,
  );

  String get displayMessage => when(
    server: (msg, statusCode) {
      if (statusCode == 500) {
        return 'Server error. Please try again later.';
      }
      return msg;
    },
    network: (msg) => 'No internet connection. Please check your network.',
    unauthorized: (msg) => 'Session expired. Please login again.',
    validation: (msg) => msg,
    cache: (msg) => 'Failed to load cached data.',
    unknown: (msg) => 'An unexpected error occurred.',
  );
}
