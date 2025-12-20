import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account_local_datasource.dart';
import '../datasources/account_remote_datasource.dart';
import '../models/account.dart';
import '../models/account_summary.dart';
import '../models/account_type.dart';
import '../models/create_account_request.dart';
import '../models/update_account_request.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDatasource _remoteDatasource;
  final AccountLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  AccountRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Account>>> getAccounts({
    bool includeInactive = false,
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from local first
      if (!forceRefresh) {
        final localAccounts = await _localDatasource.getAccounts(
          includeInactive: includeInactive,
        );
        if (localAccounts.isNotEmpty) {
          return Right(localAccounts);
        }
      }

      // Check network connectivity
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final localAccounts = await _localDatasource.getAccounts(
          includeInactive: includeInactive,
        );
        if (localAccounts.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localAccounts);
      }

      // Fetch from remote
      final accounts = await _remoteDatasource.getAccounts(
        includeInactive: includeInactive,
      );

      // Save to local
      await _localDatasource.upsertAccounts(accounts);

      return Right(accounts);
    } on ServerException catch (e) {
      // Try to return local data on server error
      final localAccounts = await _localDatasource.getAccounts(
        includeInactive: includeInactive,
      );
      if (localAccounts.isNotEmpty) {
        return Right(localAccounts);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localAccounts = await _localDatasource.getAccounts(
        includeInactive: includeInactive,
      );
      if (localAccounts.isNotEmpty) {
        return Right(localAccounts);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountSummary>> getAccountSummary({
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from cache first
      if (!forceRefresh) {
        final isCacheStale = await _localDatasource.isAccountSummaryCacheStale(
          15,
        );
        if (!isCacheStale) {
          final cachedSummary = await _localDatasource
              .getCachedAccountSummary();
          if (cachedSummary != null) {
            return Right(cachedSummary);
          }
        }
      }

      // Check network connectivity
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedSummary = await _localDatasource.getCachedAccountSummary();
        if (cachedSummary == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedSummary);
      }

      // Fetch from remote
      final summary = await _remoteDatasource.getAccountSummary();

      // Cache the result
      await _localDatasource.cacheAccountSummary(summary);

      return Right(summary);
    } on ServerException catch (e) {
      // Try to return cached data on server error
      final cachedSummary = await _localDatasource.getCachedAccountSummary();
      if (cachedSummary != null) {
        return Right(cachedSummary);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedSummary = await _localDatasource.getCachedAccountSummary();
      if (cachedSummary != null) {
        return Right(cachedSummary);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Account>> getAccountById(String id) async {
    try {
      // Try local first
      final localAccount = await _localDatasource.getAccountById(id);

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        if (localAccount == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localAccount);
      }

      // Fetch from remote
      final account = await _remoteDatasource.getAccountById(id);

      // Save to local
      await _localDatasource.upsertAccount(account);

      return Right(account);
    } on ServerException catch (e) {
      final localAccount = await _localDatasource.getAccountById(id);
      if (localAccount != null) {
        return Right(localAccount);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localAccount = await _localDatasource.getAccountById(id);
      if (localAccount != null) {
        return Right(localAccount);
      }
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
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final account = await _remoteDatasource.createAccount(request);

      // Save to local
      await _localDatasource.upsertAccount(account);

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
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final account = await _remoteDatasource.updateAccount(id, request);

      // Update local
      await _localDatasource.upsertAccount(account);

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
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      await _remoteDatasource.deleteAccount(id);

      // Delete from local
      await _localDatasource.deleteAccount(id);

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
  Future<Either<Failure, List<AccountType>>> getAccountTypes({
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from local first
      if (!forceRefresh) {
        final localTypes = await _localDatasource.getAccountTypes();
        if (localTypes.isNotEmpty) {
          return Right(localTypes);
        }
      }

      // Check network connectivity
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final localTypes = await _localDatasource.getAccountTypes();
        if (localTypes.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localTypes);
      }

      // Fetch from remote
      final types = await _remoteDatasource.getAccountTypes();

      // Save to local
      await _localDatasource.upsertAccountTypes(types);

      return Right(types);
    } on ServerException catch (e) {
      // Try to return local data on server error
      final localTypes = await _localDatasource.getAccountTypes();
      if (localTypes.isNotEmpty) {
        return Right(localTypes);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localTypes = await _localDatasource.getAccountTypes();
      if (localTypes.isNotEmpty) {
        return Right(localTypes);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
