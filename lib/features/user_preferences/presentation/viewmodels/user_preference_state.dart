import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_preference_entity.dart';

part 'user_preference_state.freezed.dart';

@freezed
abstract class UserPreferenceState with _$UserPreferenceState {
  const factory UserPreferenceState({
    UserPreferenceEntity? userPreference,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    String? errorMessage,
  }) = _UserPreferenceState;
}
