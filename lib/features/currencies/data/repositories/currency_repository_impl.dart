import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/currency_repository.dart';
import '../datasources/currency_local_datasource.dart';
import '../datasources/currency_remote_datasource.dart';
import '../models/currency.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDatasource _remoteDatasource;
  final CurrencyLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  CurrencyRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Currency>>> getCurrencies() async {
    try {
      final localCurrencies = await _localDatasource.getCurrencies();
      if (localCurrencies.isNotEmpty) {
        return Right(localCurrencies);
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final currencies = await _remoteDatasource.getCurrencies();
      await _localDatasource.upsertCurrencies(currencies);
      return Right(currencies);
    } on ServerException catch (e) {
      final localCurrencies = await _localDatasource.getCurrencies();
      if (localCurrencies.isNotEmpty) {
        return Right(localCurrencies);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localCurrencies = await _localDatasource.getCurrencies();
      if (localCurrencies.isNotEmpty) {
        return Right(localCurrencies);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
