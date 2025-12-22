import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/update_user_preference_request.dart';
import '../../domain/repositories/user_preference_repository.dart';
import '../providers/user_preference_providers.dart';
import 'user_preference_state.dart';

class UserPreferenceViewModel extends StateNotifier<UserPreferenceState> {
  final UserPreferenceRepository _repository;

  UserPreferenceViewModel(this._repository)
    : super(const UserPreferenceState());

  Future<void> loadUserPreferences() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.getUserPreferences();

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: _mapFailureToMessage(failure),
      ),
      (preference) =>
          state = state.copyWith(isLoading: false, userPreference: preference),
    );
  }

  Future<bool> updateUserPreference(UpdateUserPreferenceRequest request) async {
    state = state.copyWith(isUpdating: true, errorMessage: null);

    final result = await _repository.updateUserPreferences(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isUpdating: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (preference) {
        state = state.copyWith(isUpdating: false, userPreference: preference);
        return true;
      },
    );
  }

  Future<void> resetToDefaults() async {
    state = state.copyWith(isUpdating: true, errorMessage: null);

    final result = await _repository.resetUserPreferences();

    result.fold(
      (failure) => state = state.copyWith(
        isUpdating: false,
        errorMessage: _mapFailureToMessage(failure),
      ),
      (preference) =>
          state = state.copyWith(isUpdating: false, userPreference: preference),
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

final userPreferenceViewModelProvider =
    StateNotifierProvider<UserPreferenceViewModel, UserPreferenceState>((ref) {
      final repository = ref.read(userPreferenceRepositoryProvider);
      return UserPreferenceViewModel(repository);
    });
