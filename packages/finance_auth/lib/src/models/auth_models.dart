import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
sealed class AuthResponse with _$AuthResponse {
  const AuthResponse._();

  const factory AuthResponse({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
    required User user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  bool get isExpired =>
      DateTime.now().isAfter(DateTime.now().add(Duration(seconds: expiresIn)));

  bool willExpireSoon({Duration threshold = const Duration(minutes: 5)}) {
    final expirationThreshold = DateTime.now().add(threshold);
    return expirationThreshold.isAfter(
      DateTime.now().add(Duration(seconds: expiresIn)),
    );
  }
}

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String username,
    required String fullName,
    String? phoneNumber,
    String? profileImageUrl,
    required bool isEmailVerified,
    required String authProvider,
    required DateTime createdAt,
    DateTime? lastLoginAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
