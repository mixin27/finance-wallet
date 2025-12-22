import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_preference_entity.dart';
import '../../domain/repositories/user_preference_repository.dart';
import '../datasources/user_preference_local_datasource.dart';
import '../datasources/user_preference_remote_datasource.dart';
import '../models/update_user_preference_request.dart';

class UserPreferenceRepositoryImpl implements UserPreferenceRepository {
  final UserPreferenceRemoteDatasource _remoteDatasource;
  final UserPreferenceLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  UserPreferenceRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, UserPreferenceEntity>> getUserPreferences() async {
    try {
      // Try local cache first
      final localPreference = await _localDatasource.getCachedUserPreference();
      if (localPreference != null) {
        return Right(localPreference.toEntity());
      }

      // If no cache, fetch from remote
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final remotePreference = await _remoteDatasource.getUserPreferences();
      await _localDatasource.cacheUserPreference(remotePreference);
      return Right(remotePreference.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserPreferenceEntity>> updateUserPreferences(
    UpdateUserPreferenceRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final remotePreference = await _remoteDatasource.updateUserPreferences(
        request,
      );
      await _localDatasource.cacheUserPreference(remotePreference);
      return Right(remotePreference.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserPreferenceEntity>> resetUserPreferences() async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final remotePreference = await _remoteDatasource.resetUserPreferences();
      await _localDatasource.cacheUserPreference(remotePreference);
      return Right(remotePreference.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
