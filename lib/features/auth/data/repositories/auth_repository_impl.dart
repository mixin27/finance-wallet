import 'package:dartz/dartz.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorage _storage;

  AuthRepositoryImpl(this._remoteDatasource, this._storage);

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await _remoteDatasource.login(request);

      // Save tokens
      await _storage.write(StorageKeys.accessToken, response.accessToken);
      await _storage.write(StorageKeys.refreshToken, response.refreshToken);
      await _storage.write(StorageKeys.userId, response.user.id);
      await _storage.write(StorageKeys.userEmail, response.user.email);

      return Right(response);
    } on UnauthorizedException catch (e) {
      return Left(Failure.unauthorized(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await _remoteDatasource.register(request);

      // Save tokens
      await _storage.write(StorageKeys.accessToken, response.accessToken);
      await _storage.write(StorageKeys.refreshToken, response.refreshToken);
      await _storage.write(StorageKeys.userId, response.user.id);
      await _storage.write(StorageKeys.userEmail, response.user.email);

      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await _remoteDatasource.getCurrentUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _storage.read(StorageKeys.accessToken);
    return token != null && token.isNotEmpty;
  }
}
