import 'package:finance_auth/finance_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_providers.dart';

part 'login_viewmodel.g.dart';

/// State for login operations
class LoginState {
  final bool isLoading;
  final String? errorMessage;

  const LoginState({this.isLoading = false, this.errorMessage});

  LoginState copyWith({bool? isLoading, String? errorMessage}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return const LoginState();
  }

  /// Login user
  Future<void> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final authService = ref.read(authServiceProvider);

      await authService.login(
        Credentials(email: email, password: password, rememberMe: rememberMe),
      );

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow; // Rethrow to allow caller to handle navigation
    }
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
