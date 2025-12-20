import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/page.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_datasource.dart';
import '../datasources/transaction_remote_datasource.dart';
import '../models/create_transaction_request.dart';
import '../models/transaction.dart';
import '../models/transaction_filter.dart';
import '../models/transfer_request.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource _remoteDatasource;
  final TransactionLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  TransactionRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, Page<Transaction>>> getTransactions(
    TransactionFilter filter, {
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final localTransactions = await _localDatasource.getTransactions(
          filter,
        );
        if (localTransactions.isNotEmpty) {
          // Create page from local data
          return Right(
            Page(
              content: localTransactions,
              totalElements: localTransactions.length,
              totalPages: 1,
              number: 0,
              size: localTransactions.length,
              pageable: Pageable.empty(),
              last: true,
              first: true,
              numberOfElements: localTransactions.length,
              empty: false,
            ),
          );
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final localTransactions = await _localDatasource.getTransactions(
          filter,
        );
        if (localTransactions.isEmpty) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(
          Page(
            content: localTransactions,
            totalElements: localTransactions.length,
            totalPages: 1,
            number: 0,
            size: localTransactions.length,
            pageable: Pageable.empty(),
            last: true,
            first: true,
            numberOfElements: localTransactions.length,
            empty: false,
          ),
        );
      }

      final page = await _remoteDatasource.getTransactions(filter);
      await _localDatasource.upsertTransactions(page.content);
      return Right(page);
    } on ServerException catch (e) {
      final localTransactions = await _localDatasource.getTransactions(filter);
      if (localTransactions.isNotEmpty) {
        return Right(
          Page(
            content: localTransactions,
            totalElements: localTransactions.length,
            totalPages: 1,
            number: 0,
            size: localTransactions.length,
            pageable: Pageable.empty(),
            last: true,
            first: true,
            numberOfElements: localTransactions.length,
            empty: false,
          ),
        );
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localTransactions = await _localDatasource.getTransactions(filter);
      if (localTransactions.isNotEmpty) {
        return Right(
          Page(
            content: localTransactions,
            totalElements: localTransactions.length,
            totalPages: 1,
            number: 0,
            size: localTransactions.length,
            pageable: Pageable.empty(),
            last: true,
            first: true,
            numberOfElements: localTransactions.length,
            empty: false,
          ),
        );
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(String id) async {
    try {
      // Try local first
      final localTransaction = await _localDatasource.getTransactionById(id);

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        if (localTransaction == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(localTransaction);
      }

      final transaction = await _remoteDatasource.getTransactionById(id);

      // Save to local
      await _localDatasource.upsertTransaction(transaction);

      return Right(transaction);
    } on ServerException catch (e) {
      final localTransaction = await _localDatasource.getTransactionById(id);
      if (localTransaction != null) {
        return Right(localTransaction);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final localTransaction = await _localDatasource.getTransactionById(id);
      if (localTransaction != null) {
        return Right(localTransaction);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> createTransaction(
    CreateTransactionRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final transaction = await _remoteDatasource.createTransaction(request);

      // Save to local
      await _localDatasource.upsertTransaction(transaction);

      return Right(transaction);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> transfer(TransferRequest request) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final transaction = await _remoteDatasource.transfer(request);

      // Update local
      await _localDatasource.upsertTransaction(transaction);

      return Right(transaction);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> updateTransaction(
    String id,
    CreateTransactionRequest request,
  ) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      final transaction = await _remoteDatasource.updateTransaction(
        id,
        request,
      );

      // Update local
      await _localDatasource.upsertTransaction(transaction);

      return Right(transaction);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(String id) async {
    try {
      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        return Left(Failure.network('No internet connection'));
      }

      await _remoteDatasource.deleteTransaction(id);

      // Delete from local
      await _localDatasource.deleteTransaction(id);

      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
