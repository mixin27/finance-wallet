import '../models/auth_models.dart';
import '../models/credentials.dart';

/// Abstract repository interface for authentication operations.
///
/// Implement this interface with your specific API client (Dio, http, etc.)
/// to provide the actual authentication logic for your application.
abstract class AuthRepository {
  /// Authenticates a user with the provided credentials
  ///
  /// Throws:
  /// - [InvalidCredentialsException] if credentials are invalid
  /// - [NetworkException] if a network error occurs
  Future<AuthResponse> login(Credentials credentials);

  /// Register a user with the provided data
  ///
  /// Throws:
  /// - [NetworkException] if a network error occurs
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
    Map<String, dynamic>? additionalData,
  });

  /// Logs out the current user
  ///
  /// This should invalidate the refresh token on the server side if applicable
  Future<void> logout();

  /// Refreshes the access token using the refresh token
  ///
  /// Throws:
  /// - [SessionExpiredException] if the refresh token is invalid or expired
  /// - [NetworkException] if a network error occurs
  Future<AuthResponse> refreshToken(String refreshToken);

  /// Sends a verification email to the current user
  ///
  /// Throws:
  /// - [NetworkException] if a network error occurs
  Future<void> sendVerificationEmail(String email);

  /// Verifies the user's email with a verification token
  ///
  /// Throws:
  /// - [NetworkException] if a network error occurs
  Future<void> verifyEmail(String token);

  /// Sends a password reset email to the specified email address
  ///
  /// Throws:
  /// - [NetworkException] if a network error occurs
  Future<void> forgotPassword(String email);

  /// Resets the user's password with a reset token
  ///
  /// Throws:
  /// - [NetworkException] if a network error occurs
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Gets the current authenticated user from the server
  ///
  /// Throws:
  /// - [SessionExpiredException] if the session is invalid
  /// - [NetworkException] if a network error occurs
  Future<User> getCurrentUser();

  /// Updates the user's password
  ///
  /// Throws:
  /// - [InvalidCredentialsException] if the old password is incorrect
  /// - [NetworkException] if a network error occurs
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });

  // Token management

  /// Get the current access token
  ///
  /// Returns null if no token is available or user is not authenticated.
  /// This is called by AuthInterceptor to add Authorization header to requests.
  Future<String?> getAccessToken();
  Future<String?> getTokenType();

  /// Get the current refresh token
  ///
  /// Returns null if no token is available or user is not authenticated.
  /// This is called by RefreshTokenInterceptor when access token expires.
  Future<String?> getRefreshToken();

  /// Save a new access token
  ///
  /// This is called by RefreshTokenInterceptor after successful token refresh.
  /// You should store the token securely in your authentication service.
  Future<void> saveAccessToken(String token);

  /// Save a new refresh token
  ///
  /// This is called by RefreshTokenInterceptor after successful token refresh
  /// if the server returns a new refresh token.
  /// You should store the token securely in your authentication service.
  Future<void> saveRefreshToken(String token);

  Future<void> saveTokenType(String type);

  /// Clear all tokens
  ///
  /// This is called by RefreshTokenInterceptor when token refresh fails
  /// (e.g., refresh token is invalid or expired).
  /// You should clear all authentication data and transition to logged out state.
  Future<void> clearTokens();
}
