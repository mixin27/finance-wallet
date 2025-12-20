import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/network/page.dart';
import '../../data/models/create_transaction_request.dart';
import '../../data/models/transaction.dart';
import '../../data/models/transaction_filter.dart';
import '../../data/models/transfer_request.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Page<Transaction>>> getTransactions(
    TransactionFilter filter,
  );

  Future<Either<Failure, Transaction>> getTransactionById(String id);

  Future<Either<Failure, Transaction>> createTransaction(
    CreateTransactionRequest request,
  );

  Future<Either<Failure, Transaction>> transfer(TransferRequest request);

  Future<Either<Failure, Transaction>> updateTransaction(
    String id,
    CreateTransactionRequest request,
  );

  Future<Either<Failure, void>> deleteTransaction(String id);
}
