import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../data/datasources/user_preference_local_datasource.dart';
import '../../data/datasources/user_preference_remote_datasource.dart';
import '../../data/repositories/user_preference_repository_impl.dart';
import '../../domain/repositories/user_preference_repository.dart';

// Datasource Providers
final userPreferenceRemoteDatasourceProvider =
    Provider<UserPreferenceRemoteDatasource>((ref) {
      final apiClient = ref.read(apiClientProvider);
      return UserPreferenceRemoteDatasource(apiClient.dio);
    });

final userPreferenceLocalDatasourceProvider =
    Provider<UserPreferenceLocalDatasource>((ref) {
      return UserPreferenceLocalDatasource(ref.read(appDatabaseProvider));
    });

// Repository Provider
final userPreferenceRepositoryProvider = Provider<UserPreferenceRepository>((
  ref,
) {
  final remote = ref.read(userPreferenceRemoteDatasourceProvider);
  final local = ref.read(userPreferenceLocalDatasourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return UserPreferenceRepositoryImpl(remote, local, networkInfo);
});
