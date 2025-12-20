import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../currencies/data/models/currency.dart' as curr;
import '../models/transaction.dart' as models;
import '../models/transaction_filter.dart';

class TransactionLocalDatasource {
  final AppDatabase _database;

  TransactionLocalDatasource(this._database);

  // Get transactions with filter
  Future<List<models.Transaction>> getTransactions(
    TransactionFilter filter,
  ) async {
    final query = _database.select(_database.transactions);

    // Apply filters
    if (filter.accountId != null) {
      query.where((t) => t.accountId.equals(filter.accountId!));
    }

    if (filter.categoryId != null) {
      query.where((t) => t.categoryId.equals(filter.categoryId!));
    }

    if (filter.type != null) {
      query.where((t) => t.type.equals(filter.type!));
    }

    if (filter.startDate != null) {
      query.where(
        (t) => t.transactionDate.isBiggerOrEqualValue(filter.startDate!),
      );
    }

    if (filter.endDate != null) {
      query.where(
        (t) => t.transactionDate.isSmallerOrEqualValue(filter.endDate!),
      );
    }

    // Apply sorting
    final isDesc = filter.sortDirection.toUpperCase() == 'DESC';

    query.orderBy([
      (t) {
        Expression<Object> sortColumn;
        switch (filter.sortBy) {
          case 'amount':
            sortColumn = t.amount;
            break;
          case 'description':
            sortColumn = t.description;
            break;
          case 'transactionDate':
          default:
            sortColumn = t.transactionDate;
            break;
        }
        return isDesc
            ? OrderingTerm.desc(sortColumn)
            : OrderingTerm.asc(sortColumn);
      },
    ]);

    // Apply pagination
    query.limit(filter.size, offset: filter.page * filter.size);

    final results = await query.get();
    return results.map(_mapToTransactionModel).toList();
  }

  // Get transaction by ID
  Future<models.Transaction?> getTransactionById(String id) async {
    final query = _database.select(_database.transactions)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToTransactionModel(result) : null;
  }

  // Insert or update transaction
  Future<void> upsertTransaction(models.Transaction transaction) async {
    await _database
        .into(_database.transactions)
        .insertOnConflictUpdate(
          TransactionsCompanion(
            id: Value(transaction.id),
            accountId: Value(transaction.account.id),
            accountName: Value(transaction.account.name),
            toAccountId: Value(transaction.toAccount?.id),
            toAccountName: Value(transaction.toAccount?.name),
            categoryId: Value(transaction.category?.id),
            categoryName: Value(transaction.category?.name),
            type: Value(transaction.type),
            amount: Value(transaction.amount),
            currencyId: Value(transaction.currency.id),
            currencyCode: Value(transaction.currency.code),
            currencySymbol: Value(transaction.currency.symbol),
            exchangeRate: Value(transaction.exchangeRate),
            convertedAmount: Value(transaction.convertedAmount),
            transactionDate: Value(transaction.transactionDate),
            description: Value(transaction.description),
            note: Value(transaction.note),
            payee: Value(transaction.payee),
            location: Value(transaction.location),
            latitude: Value(transaction.latitude),
            longitude: Value(transaction.longitude),
            status: Value(transaction.status),
            createdAt: Value(transaction.createdAt),
            updatedAt: Value(transaction.updatedAt),
          ),
        );
  }

  // Insert or update multiple transactions
  Future<void> upsertTransactions(List<models.Transaction> transactions) async {
    await _database.batch((batch) {
      for (final transaction in transactions) {
        batch.insert(
          _database.transactions,
          TransactionsCompanion(
            id: Value(transaction.id),
            accountId: Value(transaction.account.id),
            accountName: Value(transaction.account.name),
            toAccountId: Value(transaction.toAccount?.id),
            toAccountName: Value(transaction.toAccount?.name),
            categoryId: Value(transaction.category?.id),
            categoryName: Value(transaction.category?.name),
            type: Value(transaction.type),
            amount: Value(transaction.amount),
            currencyId: Value(transaction.currency.id),
            currencyCode: Value(transaction.currency.code),
            currencySymbol: Value(transaction.currency.symbol),
            exchangeRate: Value(transaction.exchangeRate),
            convertedAmount: Value(transaction.convertedAmount),
            transactionDate: Value(transaction.transactionDate),
            description: Value(transaction.description),
            note: Value(transaction.note),
            payee: Value(transaction.payee),
            location: Value(transaction.location),
            latitude: Value(transaction.latitude),
            longitude: Value(transaction.longitude),
            status: Value(transaction.status),
            createdAt: Value(transaction.createdAt),
            updatedAt: Value(transaction.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  // Delete transaction
  Future<void> deleteTransaction(String id) async {
    await (_database.delete(
      _database.transactions,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all transactions
  Future<void> clearAllTransactions() async {
    await _database.delete(_database.transactions).go();
  }

  // Helper to map database model to domain model
  models.Transaction _mapToTransactionModel(Transaction transaction) {
    return models.Transaction(
      id: transaction.id,
      account: models.TransactionAccountInfo(
        id: transaction.accountId,
        name: transaction.accountName,
        accountType: const models.AccountTypeInfo(id: '', name: '', icon: null),
        currency: curr.Currency(
          id: transaction.currencyId,
          code: transaction.currencyCode,
          name: '',
          symbol: transaction.currencySymbol,
        ),
      ),
      toAccount: transaction.toAccountId != null
          ? models.TransactionAccountInfo(
              id: transaction.toAccountId!,
              name: transaction.toAccountName!,
              accountType: const models.AccountTypeInfo(
                id: '',
                name: '',
                icon: null,
              ),
              currency: curr.Currency(
                id: transaction.currencyId,
                code: transaction.currencyCode,
                name: '',
                symbol: transaction.currencySymbol,
              ),
            )
          : null,
      category: transaction.categoryId != null
          ? models.Category(
              id: transaction.categoryId!,
              name: transaction.categoryName!,
              type: transaction.type,
              color: null,
              icon: null,
            )
          : null,
      type: transaction.type,
      amount: transaction.amount,
      currency: curr.Currency(
        id: transaction.currencyId,
        code: transaction.currencyCode,
        name: '',
        symbol: transaction.currencySymbol,
      ),
      exchangeRate: transaction.exchangeRate,
      convertedAmount: transaction.convertedAmount,
      transactionDate: transaction.transactionDate,
      description: transaction.description,
      note: transaction.note,
      payee: transaction.payee,
      location: transaction.location,
      latitude: transaction.latitude,
      longitude: transaction.longitude,
      status: transaction.status,
      tags: [], // Tags stored separately if needed
      createdAt: transaction.createdAt,
      updatedAt: transaction.updatedAt,
    );
  }
}
