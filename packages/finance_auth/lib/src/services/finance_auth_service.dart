import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import '../exceptions/auth_exception.dart';
import '../models/auth_models.dart';
import '../models/auth_state.dart';
import '../models/credentials.dart';
import '../repositories/auth_repository.dart';
import 'secure_storage_service.dart';

/// Service class that manages authentication state and token persistence
///
/// This class uses dependency injection to work with any [AuthRepository]
/// implementation and handles token refresh, secure storage, and state management.
class FinanceAuthService {
  final AuthRepository _repository;

  static const String _userKey = 'fw_auth_user';
  static const String _expiresAtKey = 'fw_auth_expires_at';
  static const String _rememberMeKey = 'fw_auth_remember_me';

  final _authStateController = BehaviorSubject<AuthState>.seeded(
    AuthState.unauthenticated,
  );
  final _userController = BehaviorSubject<User?>.seeded(null);

  AuthResponse? _currentAuthResponse;
  bool _isRefreshing = false;
  bool _rememberMe = false;

  final _secureStorage = SecureStorageService.instance;

  FinanceAuthService({required AuthRepository repository})
    : _repository = repository;

  /// Stream of authentication state changes
  Stream<AuthState> get authStateStream => _authStateController.stream;

  /// Current authentication state
  AuthState get authState => _authStateController.value;

  /// Stream of user changes
  Stream<User?> get userStream => _userController.stream;

  /// Current authenticated user (null if not authenticated)
  User? get currentUser => _userController.value;

  /// Whether the user is currently authenticated
  bool get isAuthenticated => authState == AuthState.authenticated;

  /// Initialize the service and restore session if available
  Future<void> initialize() async {
    try {
      _authStateController.add(AuthState.loading);

      // Check if user opted for "remember me"
      final rememberMeValue = await _secureStorage.get<String>(_rememberMeKey);
      _rememberMe = rememberMeValue == 'true';

      // Only restore session if remember me was enabled
      if (_rememberMe) {
        final storedResponse = await _loadStoredAuthResponse();

        if (storedResponse != null) {
          _currentAuthResponse = storedResponse;

          // Check if token needs refresh
          if (await _shouldRefreshToken()) {
            try {
              await _performTokenRefresh(storedResponse.refreshToken);
            } catch (e) {
              // Refresh failed, clear session
              await clearSession();
              _authStateController.add(AuthState.unauthenticated);
              return;
            }
          } else {
            _userController.add(storedResponse.user);
            _authStateController.add(AuthState.authenticated);
          }
        } else {
          _authStateController.add(AuthState.unauthenticated);
        }
      } else {
        // User didn't want to be remembered, clear any old session
        await clearSession();
        _authStateController.add(AuthState.unauthenticated);
      }
    } catch (e) {
      _authStateController.add(AuthState.error);
      rethrow;
    }
  }

  /// Login with credentials
  Future<void> login(Credentials credentials) async {
    try {
      _authStateController.add(AuthState.loading);

      final authResponse = await _repository.login(credentials);

      // Store remember me preference
      _rememberMe = credentials.rememberMe;
      await _secureStorage.save<String>(_rememberMeKey, _rememberMe.toString());

      await _handleSuccessfulAuth(authResponse);
    } catch (e) {
      _authStateController.add(AuthState.error);
      rethrow;
    }
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      _authStateController.add(AuthState.loading);

      await _repository.register(
        username: username,
        email: email,
        password: password,
        fullName: fullName,
        additionalData: additionalData,
      );
    } catch (e) {
      _authStateController.add(AuthState.error);
      rethrow;
    }
  }

  /// Logout the current user
  Future<void> logout() async {
    try {
      _authStateController.add(AuthState.loading);

      await _repository.logout();
      await clearSession();

      _authStateController.add(AuthState.unauthenticated);
    } catch (e) {
      // Even if server logout fails, clear local session
      await clearSession();
      _authStateController.add(AuthState.unauthenticated);
    }
  }

  /// Manually refresh the access token
  Future<void> refreshToken() async {
    if (_currentAuthResponse == null) {
      throw SessionExpiredException(message: 'No active session to refresh');
    }

    await _performTokenRefresh(_currentAuthResponse!.refreshToken);
  }

  /// Send password reset email
  Future<void> forgotPassword(String email) async {
    await _repository.forgotPassword(email);
  }

  /// Reset password with token
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    await _repository.resetPassword(token: token, newPassword: newPassword);
  }

  /// Update password for current user
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await _repository.updatePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  /// Get current user from server (refreshes local user data)
  Future<User> getCurrentUser() async {
    try {
      final user = await _repository.getCurrentUser();
      _userController.add(user);

      // Update stored user data
      if (_currentAuthResponse != null) {
        _currentAuthResponse = _currentAuthResponse!.copyWith(user: user);
        await _saveAuthResponse(_currentAuthResponse!);
      }

      return user;
    } on SessionExpiredException catch (_) {
      // todo(mixin27): make RefreshTokenInterceptor for `lms_auth`
      await logout();
      rethrow;
    }
  }

  /// Get the current access token
  Future<String?> getAccessToken() async {
    // Check if token needs refresh before returning
    if (await _shouldRefreshToken()) {
      if (_currentAuthResponse != null) {
        await _performTokenRefresh(_currentAuthResponse!.refreshToken);
      }
    }

    return await _repository.getAccessToken();
  }

  /// Save the access token
  Future<void> saveAccessToken(String token) async {
    return await _repository.saveAccessToken(token);
  }

  /// Get the current refresh token
  Future<String?> getRefreshToken() async {
    return await _repository.getRefreshToken();
  }

  /// Save the access token
  Future<void> saveRefreshToken(String token) async {
    return await _repository.saveRefreshToken(token);
  }

  /// Get the current token type
  Future<String?> getTokenType() async {
    return await _repository.getTokenType();
  }

  /// Save the token type
  Future<void> saveTokenType(String type) async {
    return await _repository.saveTokenType(type);
  }

  /// Clear all session data
  Future<void> clearSession() async {
    _currentAuthResponse = null;
    _userController.add(null);
    _isRefreshing = false;
    _rememberMe = false;

    await _repository.clearTokens();
  }

  /// Dispose resources
  void dispose() {
    _isRefreshing = false;
    _authStateController.close();
    _userController.close();
  }

  // Private methods

  Future<void> _handleSuccessfulAuth(AuthResponse authResponse) async {
    _currentAuthResponse = authResponse;
    _userController.add(authResponse.user);

    await _saveAuthResponse(authResponse);

    _authStateController.add(AuthState.authenticated);
  }

  Future<void> _performTokenRefresh(String refreshToken) async {
    // Prevent concurrent refresh attempts
    if (_isRefreshing) {
      return;
    }

    _isRefreshing = true;

    try {
      final authResponse = await _repository.refreshToken(refreshToken);
      await _handleSuccessfulAuth(authResponse);
    } catch (e) {
      await clearSession();
      _authStateController.add(AuthState.unauthenticated);
      rethrow;
    } finally {
      _isRefreshing = false;
    }
  }

  /// Check if token should be refreshed
  /// Returns true if token will expire within 5 minutes or is already expired
  Future<bool> _shouldRefreshToken() async {
    if (_currentAuthResponse == null) return false;

    // Refresh if expired or will expire soon
    return _currentAuthResponse!.willExpireSoon();
  }

  Future<void> _saveAuthResponse(AuthResponse authResponse) async {
    await Future.wait([
      _repository.saveAccessToken(authResponse.accessToken),
      _repository.saveRefreshToken(authResponse.refreshToken),
      _repository.saveTokenType(authResponse.tokenType),
      _secureStorage.save<String>(
        _userKey,
        jsonEncode(authResponse.user.toJson()),
      ),
      _secureStorage.save<int>(_expiresAtKey, authResponse.expiresIn),
      _secureStorage.save<String>(_rememberMeKey, _rememberMe.toString()),
    ]);
  }

  Future<AuthResponse?> _loadStoredAuthResponse() async {
    try {
      final accessToken = await _repository.getAccessToken();
      final refreshToken = await _repository.getRefreshToken();
      final tokenType = await _repository.getTokenType();
      final userJson = await _secureStorage.get<String>(_userKey);
      final expiresIn = await _secureStorage.get<int>(_expiresAtKey);

      if (accessToken == null || refreshToken == null || userJson == null) {
        return null;
      }

      final decodedJson = jsonDecode(userJson) as Map<String, dynamic>;
      final user = User.fromJson(decodedJson);

      return AuthResponse(
        user: user,
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn ?? 0,
        tokenType: tokenType ?? 'Bearer',
      );
    } catch (e) {
      // If there's any error loading stored data, clear it
      await clearSession();
      return null;
    }
  }
}
