import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/login_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/auth_providers.dart';

class LoginState {
  final bool isLoading;
  final String? errorMessage;

  LoginState({this.isLoading = false, this.errorMessage});

  LoginState copyWith({bool? isLoading, String? errorMessage}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final Ref _ref;

  LoginViewModel(this._authRepository, this._ref) : super(LoginState());

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final request = LoginRequest(email: email, password: password);
    final result = await _authRepository.login(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (authResponse) {
        state = state.copyWith(isLoading: false);
        _ref.read(currentUserProvider.notifier).state = authResponse.user;
        _ref.read(authStateProvider.notifier).state = true;
        return true;
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.when(
      server: (message, statusCode) => message,
      network: (message) => message,
      cache: (message) => message,
      unauthorized: (message) => message,
      validation: (message) => message,
      unknown: (message) => message,
    );
  }
}

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>((ref) {
      final repository = ref.read(authRepositoryProvider);
      return LoginViewModel(repository, ref);
    });
