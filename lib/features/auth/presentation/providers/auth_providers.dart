import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/models/user.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

// Datasource Provider
final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource(ApiClient().dio);
});

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.read(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(datasource, SecureStorage());
});

// Current User Provider
final currentUserProvider = StateProvider<User?>((ref) => null);

// Auth State Provider
final authStateProvider = StateProvider<bool>((ref) => false);
