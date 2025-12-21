import 'package:finance_auth/finance_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../providers/profile_providers.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  @override
  FutureOr<User> build() async {
    return _fetchCurrentUser();
  }

  /// Fetch current user data from API
  Future<User> _fetchCurrentUser({bool forceRefresh = false}) async {
    final repository = ref.read(profileRepositoryProvider);
    return await repository.getCurrentUser(forceRefresh: forceRefresh);
  }

  /// Refresh user data
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchCurrentUser(forceRefresh: true));
  }

  /// Logout user
  Future<void> logout() async {
    final repository = ref.read(profileRepositoryProvider);
    final authService = ref.read(authServiceProvider);
    await authService.logout();
    await repository.clearAllUserData();
  }
}
