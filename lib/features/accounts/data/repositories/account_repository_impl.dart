import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_remote_datasource.dart';
import '../models/account.dart';
import '../models/account_summary.dart';
import '../models/account_type.dart';
import '../models/create_account_request.dart';
import '../models/update_account_request.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDatasource _remoteDatasource;

  AccountRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<Account>>> getAccounts({
    bool includeInactive = false,
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedAccountsKey = 'cached_accounts';

    try {
      final cachedData = prefs.getString(cachedAccountsKey);
      if (cachedData != null && !forceRefresh) {
        final List<dynamic> decodedJson = jsonDecode(cachedData);
        final accounts = decodedJson
            .map((json) => Account.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(accounts);
      }

      final accounts = await _remoteDatasource.getAccounts(
        includeInactive: includeInactive,
      );

      await prefs.setString(
        cachedAccountsKey,
        jsonEncode(accounts.map((e) => e.toJson()).toList()),
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
  Future<Either<Failure, AccountSummary>> getAccountSummary({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedAccountSummaryKey = 'cached_account_summary';
    try {
      final cachedData = prefs.getString(cachedAccountSummaryKey);
      if (cachedData != null && !forceRefresh) {
        final Map<String, dynamic> decodedJson =
            jsonDecode(cachedData) as Map<String, dynamic>;
        final summary = AccountSummary.fromJson(decodedJson);
        return Right(summary);
      }

      final summary = await _remoteDatasource.getAccountSummary();

      await prefs.setString(
        cachedAccountSummaryKey,
        jsonEncode(summary.toJson()),
      );
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
}
