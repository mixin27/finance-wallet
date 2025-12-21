import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/database/app_database.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/interceptors/auth_interceptor.dart';
import '../../../core/network/interceptors/refresh_token_interceptor.dart';
import '../../../core/network/network_info.dart';
import '../../../features/auth/presentation/providers/auth_providers.dart';

part 'app_providers.g.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(Connectivity());
});

// API Client Provider
@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final authService = ref.watch(authServiceProvider);

  final apiClient = ApiClient();
  apiClient.addInterceptor(AuthInterceptor(authService));
  apiClient.addInterceptor(
    RefreshTokenInterceptor(authService: authService, dio: apiClient.dio),
  );
  return apiClient;
}
