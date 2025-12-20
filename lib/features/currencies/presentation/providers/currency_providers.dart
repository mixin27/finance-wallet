import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/network/api_client.dart';
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

// Repository Provider
final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  final datasource = ref.read(currencyRemoteDatasourceProvider);
  return CurrencyRepositoryImpl(datasource);
});

// Currencies Provider
final currenciesProvider = StateProvider<List<Currency>>((ref) => []);
