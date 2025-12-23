import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../currencies/data/models/currency.dart' as curr;
import '../models/account.dart' as models;
import '../models/account_summary.dart' as acs;
import '../models/account_type.dart' as ac;
import '../models/account_type.dart' as act;

class AccountLocalDatasource {
  final AppDatabase _database;

  AccountLocalDatasource(this._database);

  // ========== ACCOUNTS ==========

  // Get all accounts
  Future<List<models.Account>> getAccounts({
    bool includeInactive = false,
  }) async {
    final query = _database.select(_database.accounts);

    if (!includeInactive) {
      query.where((t) => t.isActive.equals(true));
    }

    final results = await query.get();
    return results.map(_mapToAccountModel).toList();
  }

  // Get account by ID
  Future<models.Account?> getAccountById(String id) async {
    final query = _database.select(_database.accounts)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToAccountModel(result) : null;
  }

  // Insert or update account
  Future<void> upsertAccount(models.Account account) async {
    await _database
        .into(_database.accounts)
        .insertOnConflictUpdate(
          AccountsCompanion(
            id: Value(account.id),
            name: Value(account.name),
            accountTypeId: Value(account.accountType.id),
            accountTypeName: Value(account.accountType.name),
            accountTypeIcon: Value(account.accountType.icon),
            currencyId: Value(account.currency.id),
            currencyCode: Value(account.currency.code),
            currencySymbol: Value(account.currency.symbol),
            description: Value(account.description),
            initialBalance: Value(account.initialBalance),
            currentBalance: Value(account.currentBalance),
            balanceInDefaultCurrency: Value(account.balanceInDefaultCurrency),
            color: Value(account.color),
            icon: Value(account.icon),
            isIncludedInTotal: Value(account.isIncludedInTotal),
            displayOrder: Value(account.displayOrder),
            isActive: Value(account.isActive),
            createdAt: Value(account.createdAt),
            updatedAt: Value(account.updatedAt),
          ),
        );
  }

  // Insert or update multiple accounts
  Future<void> upsertAccounts(List<models.Account> accounts) async {
    await _database.batch((batch) {
      for (final account in accounts) {
        batch.insert(
          _database.accounts,
          AccountsCompanion(
            id: Value(account.id),
            name: Value(account.name),
            accountTypeId: Value(account.accountType.id),
            accountTypeName: Value(account.accountType.name),
            accountTypeIcon: Value(account.accountType.icon),
            currencyId: Value(account.currency.id),
            currencyCode: Value(account.currency.code),
            currencySymbol: Value(account.currency.symbol),
            description: Value(account.description),
            initialBalance: Value(account.initialBalance),
            currentBalance: Value(account.currentBalance),
            balanceInDefaultCurrency: Value(account.balanceInDefaultCurrency),
            color: Value(account.color),
            icon: Value(account.icon),
            isIncludedInTotal: Value(account.isIncludedInTotal),
            displayOrder: Value(account.displayOrder),
            isActive: Value(account.isActive),
            createdAt: Value(account.createdAt),
            updatedAt: Value(account.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  // Delete account
  Future<void> deleteAccount(String id) async {
    await (_database.delete(
      _database.accounts,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all accounts
  Future<void> clearAllAccounts() async {
    await _database.delete(_database.accounts).go();
  }

  // Helper to map database model to domain model
  models.Account _mapToAccountModel(Account account) {
    return models.Account(
      id: account.id,
      name: account.name,
      accountType: ac.AccountType(
        id: account.accountTypeId,
        name: account.accountTypeName,
        icon: account.accountTypeIcon,
      ),
      currency: curr.Currency(
        id: account.currencyId,
        code: account.currencyCode,
        name: '', // Not stored in local, will be empty
        symbol: account.currencySymbol,
      ),
      description: account.description,
      initialBalance: account.initialBalance,
      currentBalance: account.currentBalance,
      balanceInDefaultCurrency: account.balanceInDefaultCurrency,
      color: account.color,
      icon: account.icon,
      isIncludedInTotal: account.isIncludedInTotal,
      displayOrder: account.displayOrder,
      isActive: account.isActive,
      createdAt: account.createdAt,
      updatedAt: account.updatedAt,
    );
  }

  // ========== ACCOUNT TYPES ==========

  // Get all account types
  Future<List<ac.AccountType>> getAccountTypes() async {
    final query = _database.select(_database.accountTypes);
    final results = await query.get();
    return results.map(_mapToAccountTypeModel).toList();
  }

  // Get account type by ID
  Future<ac.AccountType?> getAccountTypeById(String id) async {
    final query = _database.select(_database.accountTypes)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToAccountTypeModel(result) : null;
  }

  // Insert or update account type
  Future<void> upsertAccountType(AccountType accountType) async {
    await _database
        .into(_database.accountTypes)
        .insertOnConflictUpdate(
          AccountTypesCompanion(
            id: Value(accountType.id),
            name: Value(accountType.name),
            icon: Value(accountType.icon),
          ),
        );
  }

  // Insert or update multiple account types
  Future<void> upsertAccountTypes(List<act.AccountType> accountTypes) async {
    await _database.batch((batch) {
      for (final type in accountTypes) {
        batch.insert(
          _database.accountTypes,
          AccountTypesCompanion(
            id: Value(type.id),
            name: Value(type.name),
            icon: Value(type.icon),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  // Clear all account types
  Future<void> clearAllAccountTypes() async {
    await _database.delete(_database.accountTypes).go();
  }

  // Helper to map database model to domain model
  ac.AccountType _mapToAccountTypeModel(AccountType accountType) {
    return ac.AccountType(
      id: accountType.id,
      name: accountType.name,
      icon: accountType.icon,
    );
  }

  // ========== ACCOUNT SUMMARY (CACHED) ==========

  // Cache account summary
  Future<void> cacheAccountSummary(acs.AccountSummary summary) async {
    await _database
        .into(_database.dashboardCache)
        .insertOnConflictUpdate(
          DashboardCacheCompanion(
            key: const Value('account_summary'),
            jsonData: Value(jsonEncode(summary.toJson())),
            cachedAt: Value(DateTime.now()),
          ),
        );
  }

  // Get cached account summary
  Future<acs.AccountSummary?> getCachedAccountSummary() async {
    final query = _database.select(_database.dashboardCache)
      ..where((t) => t.key.equals('account_summary'));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    try {
      final Map<String, dynamic> jsonData =
          jsonDecode(result.jsonData) as Map<String, dynamic>;
      return acs.AccountSummary.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }

  // Check if account summary cache is stale
  Future<bool> isAccountSummaryCacheStale(int maxAgeMinutes) async {
    final query = _database.select(_database.dashboardCache)
      ..where((t) => t.key.equals('account_summary'));

    final result = await query.getSingleOrNull();
    if (result == null) return true;

    final age = DateTime.now().difference(result.cachedAt);
    return age.inMinutes > maxAgeMinutes;
  }
}
