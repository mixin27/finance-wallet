import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_providers.dart';

part 'register_viewmodel.g.dart';

/// State for registration operations
class RegisterState {
  final bool isLoading;
  final String? errorMessage;
  final String? email;

  const RegisterState({this.isLoading = false, this.errorMessage, this.email});

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? email,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      email: email ?? this.email,
    );
  }
}

@riverpod
class RegisterViewModel extends _$RegisterViewModel {
  @override
  RegisterState build() {
    return const RegisterState();
  }

  /// Register new user
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final authService = ref.read(authServiceProvider);

      await authService.register(
        username: username,
        email: email,
        password: password,
        fullName: fullName,
      );

      state = state.copyWith(isLoading: false, email: email);
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
