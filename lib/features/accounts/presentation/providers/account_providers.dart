import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/account_remote_datasource.dart';
import '../../data/models/account.dart';
import '../../data/models/account_summary.dart';
import '../../data/models/account_type.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../domain/repositories/account_repository.dart';

// Datasource Provider
final accountRemoteDatasourceProvider = Provider<AccountRemoteDatasource>((
  ref,
) {
  return AccountRemoteDatasource(ApiClient().dio);
});

// Repository Provider
final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final datasource = ref.read(accountRemoteDatasourceProvider);
  return AccountRepositoryImpl(datasource);
});

// Accounts List Provider
final accountsProvider = StateProvider<List<Account>>((ref) => []);

// Account Summary Provider
final accountSummaryProvider = StateProvider<AccountSummary?>((ref) => null);

// Account Types Provider
final accountTypesProvider = StateProvider<List<AccountType>>((ref) => []);

// Selected Account Provider (for details/edit)
final selectedAccountProvider = StateProvider<Account?>((ref) => null);
