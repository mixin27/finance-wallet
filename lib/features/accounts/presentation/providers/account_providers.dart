import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../app/presentation/providers/app_providers.dart';
import '../../data/datasources/account_local_datasource.dart';
import '../../data/datasources/account_remote_datasource.dart';
import '../../data/models/account.dart';
import '../../data/models/account_summary.dart';
import '../../data/models/account_type.dart';
import '../../data/models/account_filter.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../domain/repositories/account_repository.dart';

// Datasource Provider
final accountRemoteDatasourceProvider = Provider<AccountRemoteDatasource>((
  ref,
) {
  final apiClient = ref.read(apiClientProvider);
  return AccountRemoteDatasource(apiClient.dio);
});

final accountLocalDatasourceProvider = Provider<AccountLocalDatasource>((ref) {
  final db = ref.read(appDatabaseProvider);
  return AccountLocalDatasource(db);
});

// Repository Provider
final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final remote = ref.read(accountRemoteDatasourceProvider);
  final local = ref.read(accountLocalDatasourceProvider);
  return AccountRepositoryImpl(remote, local, ref.read(networkInfoProvider));
});

// Accounts List Provider
final accountsProvider = StateProvider<List<Account>>((ref) => []);

// Account Summary Provider
final accountSummaryProvider = StateProvider<AccountSummary?>((ref) => null);

// Account Types Provider
final accountTypesProvider = StateProvider<List<AccountType>>((ref) => []);

// Selected Account Provider (for details/edit)
final selectedAccountProvider = StateProvider<Account?>((ref) => null);

// Account Filter Provider
final accountFilterProvider = StateProvider<AccountFilter>(
  (ref) => AccountFilter(),
);
