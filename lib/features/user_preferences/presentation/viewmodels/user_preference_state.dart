import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_preference_entity.dart';

part 'user_preference_state.freezed.dart';

@freezed
abstract class UserPreferenceState with _$UserPreferenceState {
  const UserPreferenceState._();

  const factory UserPreferenceState({
    UserPreferenceEntity? userPreference,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    String? errorMessage,
  }) = _UserPreferenceState;

  ThemeMode get themeMode {
    switch (userPreference?.theme) {
      case 'LIGHT':
        return ThemeMode.light;
      case 'DARK':
        return ThemeMode.dark;
      case 'SYSTEM':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
