import 'package:finance_wallet/app/presentation/providers/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/currency_local_datasource.dart';
import '../../data/datasources/currency_remote_datasource.dart';
import '../../data/models/currency.dart';
import '../../data/repositories/currency_repository_impl.dart';
import '../../domain/repositories/currency_repository.dart';

// Datasource Provider
final currencyRemoteDatasourceProvider = Provider<CurrencyRemoteDatasource>((
  ref,
) {
  return CurrencyRemoteDatasource(ApiClient().dio);
});
final currencyLocalDatasourceProvider = Provider<CurrencyLocalDatasource>((
  ref,
) {
  return CurrencyLocalDatasource(ref.read(appDatabaseProvider));
});

// Repository Provider
final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  final remote = ref.read(currencyRemoteDatasourceProvider);
  final local = ref.read(currencyLocalDatasourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return CurrencyRepositoryImpl(remote, local, networkInfo);
});

// Currencies Provider
final currenciesProvider = StateProvider<List<Currency>>((ref) => []);
