import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/transaction_remote_datasource.dart';
import '../../data/models/transaction.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/transaction_repository.dart';

// Datasource Provider
final transactionRemoteDatasourceProvider =
    Provider<TransactionRemoteDatasource>((ref) {
      return TransactionRemoteDatasource(ApiClient().dio);
    });

// Repository Provider
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final datasource = ref.read(transactionRemoteDatasourceProvider);
  return TransactionRepositoryImpl(datasource);
});

// Transactions List Provider
final transactionsProvider = StateProvider<List<Transaction>>((ref) => []);

// Selected Transaction Provider (for details/edit)
final selectedTransactionProvider = StateProvider<Transaction?>((ref) => null);

// Current page provider for pagination
final currentPageProvider = StateProvider<int>((ref) => 0);

// Has more pages provider
final hasMorePagesProvider = StateProvider<bool>((ref) => true);

// Transaction Type Filter Provider
final transactionTypeFilterProvider = StateProvider<String?>((ref) => null);

// Date Range Filter Provider
final dateRangeFilterProvider = StateProvider<DateTimeRange?>((ref) => null);

class DateTimeRange {
  final DateTime start;
  final DateTime end;

  DateTimeRange(this.start, this.end);
}
