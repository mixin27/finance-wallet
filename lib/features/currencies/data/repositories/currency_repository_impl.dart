import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:finance_wallet/core/errors/failure.dart';

import 'package:finance_wallet/features/currencies/data/models/currency.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/currency_repository.dart';
import '../datasources/currency_remote_datasource.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDatasource _remoteDatasource;

  CurrencyRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Currency>>> getCurrencies() async {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey = 'currencies';

    try {
      final cached = prefs.getString(cacheKey);
      if (cached != null) {
        final List<dynamic> jsonList = jsonDecode(cached);
        final currencies = jsonList
            .map((json) => Currency.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(currencies);
      }

      final currencies = await _remoteDatasource.getCurrencies();

      await prefs.setString(
        cacheKey,
        jsonEncode(currencies.map((e) => e.toJson()).toList()),
      );
      return Right(currencies);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
