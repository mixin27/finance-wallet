import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/account.dart';
import '../../data/models/account_summary.dart';
import '../../data/models/account_type.dart';
import '../../data/models/create_account_request.dart';
import '../../data/models/currency.dart';
import '../../data/models/update_account_request.dart';

abstract class AccountRepository {
  Future<Either<Failure, List<Account>>> getAccounts({bool includeInactive});
  Future<Either<Failure, AccountSummary>> getAccountSummary();
  Future<Either<Failure, Account>> getAccountById(String id);
  Future<Either<Failure, Account>> createAccount(CreateAccountRequest request);
  Future<Either<Failure, Account>> updateAccount(
    String id,
    UpdateAccountRequest request,
  );
  Future<Either<Failure, void>> deleteAccount(String id);
  Future<Either<Failure, List<AccountType>>> getAccountTypes();
  Future<Either<Failure, List<Currency>>> getCurrencies();
}
