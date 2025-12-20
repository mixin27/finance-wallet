import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../models/currency.dart' as models;

class CurrencyLocalDatasource {
  final AppDatabase _database;

  CurrencyLocalDatasource(this._database);

  // Get all currencies
  Future<List<models.Currency>> getCurrencies() async {
    final query = _database.select(_database.currencies)
      ..where((t) => t.isActive.equals(true));

    final results = await query.get();
    return results.map(_mapToCurrencyModel).toList();
  }

  // Get currency by ID
  Future<models.Currency?> getCurrencyById(String id) async {
    final query = _database.select(_database.currencies)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToCurrencyModel(result) : null;
  }

  // Get currency by code
  Future<models.Currency?> getCurrencyByCode(String code) async {
    final query = _database.select(_database.currencies)
      ..where((t) => t.code.equals(code));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToCurrencyModel(result) : null;
  }

  // Insert or update currency
  Future<void> upsertCurrency(models.Currency currency) async {
    await _database
        .into(_database.currencies)
        .insertOnConflictUpdate(
          CurrenciesCompanion(
            id: Value(currency.id),
            code: Value(currency.code),
            name: Value(currency.name),
            symbol: Value(currency.symbol),
            decimalPlaces: Value(currency.decimalPlaces),
            isActive: Value(currency.isActive),
          ),
        );
  }

  // Insert or update multiple currencies
  Future<void> upsertCurrencies(List<models.Currency> currencies) async {
    await _database.batch((batch) {
      for (final currency in currencies) {
        batch.insert(
          _database.currencies,
          CurrenciesCompanion(
            id: Value(currency.id),
            code: Value(currency.code),
            name: Value(currency.name),
            symbol: Value(currency.symbol),
            decimalPlaces: Value(currency.decimalPlaces),
            isActive: Value(currency.isActive),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  // Delete currency
  Future<void> deleteCurrency(String id) async {
    await (_database.delete(
      _database.currencies,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all currencies
  Future<void> clearAllCurrencies() async {
    await _database.delete(_database.currencies).go();
  }

  // Helper to map database model to domain model
  models.Currency _mapToCurrencyModel(Currency currency) {
    return models.Currency(
      id: currency.id,
      code: currency.code,
      name: currency.name,
      symbol: currency.symbol,
      decimalPlaces: currency.decimalPlaces,
      isActive: currency.isActive,
    );
  }
}
