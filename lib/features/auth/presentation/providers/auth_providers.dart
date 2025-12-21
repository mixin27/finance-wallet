import 'package:finance_auth/finance_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/repositories/finance_auth_repository.dart';

part 'auth_providers.g.dart';

@riverpod
AuthLocalDatasource authLocalDatasource(Ref ref) {
  return AuthLocalDatasource(ref.read(appDatabaseProvider));
}

@Riverpod(keepAlive: true)
AuthRepository financeAuthRepository(Ref ref) {
  final localDatasource = ref.read(authLocalDatasourceProvider);
  return FinanceAuthRepository(
    dio: ApiClient().dio,
    localDatasource: localDatasource,
  );
}

@Riverpod(keepAlive: true)
FinanceAuthService authService(Ref ref) {
  final repository = ref.watch(financeAuthRepositoryProvider);
  final service = FinanceAuthService(repository: repository);

  ref.onDispose(service.dispose);

  return service;
}

// Datasource Provider
// final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
//   return AuthRemoteDatasource(ApiClient().dio);
// });

// final authLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref) {
//   return AuthLocalDatasource(ref.read(appDatabaseProvider));
// });

// Repository Provider
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final remote = ref.read(authRemoteDatasourceProvider);
//   final local = ref.read(authLocalDatasourceProvider);
//   final networkInfo = ref.read(networkInfoProvider);
//   return AuthRepositoryImpl(remote, local, SecureStorage(), networkInfo);
// });

// // Current User Provider
// final currentUserProvider = StateProvider<User?>((ref) => null);

// // Auth State Provider
// final authStateProvider = StateProvider<bool>((ref) => false);
