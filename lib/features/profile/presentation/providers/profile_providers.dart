import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../data/datasources/user_local_datasource.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/profile_repository.dart';

part 'profile_providers.g.dart';

@riverpod
UserLocalDatasource profileLocalDatasource(Ref ref) {
  return UserLocalDatasource(ref.read(appDatabaseProvider));
}

@riverpod
UserRemoteDatasource profileRemoteDatasource(Ref ref) {
  final apiClient = ref.read(apiClientProvider);
  return UserRemoteDatasource(apiClient.dio);
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(
    ref.read(profileRemoteDatasourceProvider),
    ref.read(profileLocalDatasourceProvider),
    ref.read(networkInfoProvider),
  );
}
