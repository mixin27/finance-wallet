import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_remote_datasource.dart';
import '../models/account.dart';
import '../models/account_summary.dart';
import '../models/account_type.dart';
import '../models/create_account_request.dart';
import '../models/currency.dart';
import '../models/update_account_request.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDatasource _remoteDatasource;

  AccountRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Account>>> getAccounts({
    bool includeInactive = false,
  }) async {
    try {
      final accounts = await _remoteDatasource.getAccounts(
        includeInactive: includeInactive,
      );
      return Right(accounts);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountSummary>> getAccountSummary() async {
    try {
      final summary = await _remoteDatasource.getAccountSummary();
      return Right(summary);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Account>> getAccountById(String id) async {
    try {
      final account = await _remoteDatasource.getAccountById(id);
      return Right(account);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Account>> createAccount(
    CreateAccountRequest request,
  ) async {
    try {
      final account = await _remoteDatasource.createAccount(request);
      return Right(account);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Account>> updateAccount(
    String id,
    UpdateAccountRequest request,
  ) async {
    try {
      final account = await _remoteDatasource.updateAccount(id, request);
      return Right(account);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount(String id) async {
    try {
      await _remoteDatasource.deleteAccount(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AccountType>>> getAccountTypes() async {
    try {
      final types = await _remoteDatasource.getAccountTypes();
      return Right(types);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Currency>>> getCurrencies() async {
    try {
      final currencies = await _remoteDatasource.getCurrencies();
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
