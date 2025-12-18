import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/register_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/auth_providers.dart';

class RegisterState {
  final bool isLoading;
  final String? errorMessage;

  RegisterState({this.isLoading = false, this.errorMessage});

  RegisterState copyWith({bool? isLoading, String? errorMessage}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class RegisterViewModel extends StateNotifier<RegisterState> {
  final AuthRepository _authRepository;
  final Ref _ref;

  RegisterViewModel(this._authRepository, this._ref) : super(RegisterState());

  Future<bool> register({
    required String email,
    required String username,
    required String password,
    required String fullName,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final request = RegisterRequest(
      email: email,
      username: username,
      password: password,
      fullName: fullName,
    );

    final result = await _authRepository.register(request);

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
    );
  }
}

final registerViewModelProvider =
    StateNotifierProvider.autoDispose<RegisterViewModel, RegisterState>((ref) {
      final repository = ref.read(authRepositoryProvider);
      return RegisterViewModel(repository, ref);
    });
