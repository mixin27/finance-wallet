import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/page.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_remote_datasource.dart';
import '../models/category.dart';
import '../models/create_transaction_request.dart';
import '../models/transaction.dart';
import '../models/transaction_filter.dart';
import '../models/transfer_request.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource _remoteDatasource;

  TransactionRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, Page<Transaction>>> getTransactions(
    TransactionFilter filter,
  ) async {
    try {
      final page = await _remoteDatasource.getTransactions(filter);
      return Right(page);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(String id) async {
    try {
      final transaction = await _remoteDatasource.getTransactionById(id);
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
  Future<Either<Failure, Transaction>> createTransaction(
    CreateTransactionRequest request,
  ) async {
    try {
      final transaction = await _remoteDatasource.createTransaction(request);
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
      final transaction = await _remoteDatasource.transfer(request);
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
      final transaction = await _remoteDatasource.updateTransaction(
        id,
        request,
      );
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
      await _remoteDatasource.deleteTransaction(id);
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
  Future<Either<Failure, List<Category>>> getCategories({String? type}) async {
    try {
      final categories = await _remoteDatasource.getCategories(type: type);
      return Right(categories);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
