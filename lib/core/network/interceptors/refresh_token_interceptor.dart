import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:finance_auth/finance_auth.dart';

/// Interceptor that automatically refreshes token on 401 and retries the request
class RefreshTokenInterceptor extends Interceptor {
  final FinanceAuthService authService;
  final Dio dio;
  final String refreshEndpoint;
  bool _isRefreshing = false;
  final List<_PendingRequest> _pendingRequests = [];

  RefreshTokenInterceptor({
    required this.authService,
    required this.dio,
    this.refreshEndpoint = '/auth/refresh',
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log(
      '[RefreshTokenInterceptor]: onError called with status code ${err.response?.statusCode}',
    );
    // Only handle 401 Unauthorized errors
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Check if this request was already retried
    final isRetry = err.requestOptions.extra['retry_after_refresh'] ?? false;
    log('[RefreshTokenInterceptor]: isRetry = $isRetry');
    if (isRetry) {
      return handler.next(err);
    }

    // Check if this is the refresh token request itself
    log('[RefreshTokenInterceptor]: Request path: ${err.requestOptions.path}');
    if (err.requestOptions.path.contains(refreshEndpoint)) {
      log('[RefreshTokenInterceptor]: Refresh token request failed');
      await authService.logout();
      return handler.next(err);
    }

    try {
      // If already refreshing, queue this request
      if (_isRefreshing) {
        _addToQueue(err.requestOptions, handler);
        return;
      }

      _isRefreshing = true;

      // Attempt to refresh the token using both body and header-based refresh
      final newToken = await _refreshTokenRequest();

      if (newToken == null || newToken.isEmpty) {
        // Refresh failed, clear tokens and reject all pending requests
        await authService.logout();
        _rejectPendingRequests(err);
        return handler.next(err);
      }

      // Save the new token
      await authService.saveAccessToken(newToken);

      // Retry the original request with new token
      err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
      err.requestOptions.extra['retry_after_refresh'] = true;

      final response = await dio.fetch(err.requestOptions);

      // Resolve all pending requests with new token
      await _resolvePendingRequests(newToken);

      return handler.resolve(response);
    } catch (e) {
      // Refresh failed, reject all pending requests
      _rejectPendingRequests(err);
      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  /// Refresh access token by sending refresh token in Authorization header
  Future<String?> _refreshTokenRequest() async {
    try {
      final refreshToken = await authService.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        return null;
      }

      // Create a new Dio instance to avoid interceptor loops
      final refreshDio = Dio(dio.options.copyWith());

      final response = await refreshDio.post(
        refreshEndpoint,
        data: {"refreshToken": refreshToken},
        options: Options(
          headers: {
            'Authorization': 'Bearer $refreshToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        // Try different common response formats
        String? newAccessToken;
        String? newRefreshToken;

        if (data is Map<String, dynamic>) {
          // Check for nested data object
          final responseData = data['data'] as Map<String, dynamic>? ?? data;

          newAccessToken =
              responseData['access_token'] as String? ??
              responseData['accessToken'] as String? ??
              responseData['token'] as String?;

          newRefreshToken =
              responseData['refresh_token'] as String? ??
              responseData['refreshToken'] as String?;
        }

        // Save new refresh token if provided
        if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
          await authService.saveRefreshToken(newRefreshToken);
        }

        return newAccessToken;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  void _addToQueue(RequestOptions options, ErrorInterceptorHandler handler) {
    _pendingRequests.add(_PendingRequest(options, handler));
  }

  Future<void> _resolvePendingRequests(String newToken) async {
    for (final pending in _pendingRequests) {
      try {
        // Update authorization header with new token
        pending.options.headers['Authorization'] = 'Bearer $newToken';
        pending.options.extra['retry_after_refresh'] = true;

        final response = await dio.fetch(pending.options);
        pending.handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          pending.handler.next(e);
        } else {
          pending.handler.next(
            DioException(requestOptions: pending.options, error: e),
          );
        }
      }
    }
    _pendingRequests.clear();
  }

  void _rejectPendingRequests(DioException err) {
    for (final pending in _pendingRequests) {
      pending.handler.next(err);
    }
    _pendingRequests.clear();
  }
}

/// Helper class to store pending requests
class _PendingRequest {
  final RequestOptions options;
  final ErrorInterceptorHandler handler;

  _PendingRequest(this.options, this.handler);
}
