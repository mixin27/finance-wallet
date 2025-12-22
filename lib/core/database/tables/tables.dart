import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get email => text()();
  TextColumn get username => text()();
  TextColumn get fullName => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get profileImageUrl => text().nullable()();
  BoolColumn get isEmailVerified => boolean()();
  TextColumn get authProvider => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastLoginAt => dateTime().nullable()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get accountTypeId => text()();
  TextColumn get accountTypeName => text()();
  TextColumn get accountTypeIcon => text().nullable()();
  TextColumn get currencyId => text()();
  TextColumn get currencyCode => text()();
  TextColumn get currencySymbol => text()();
  TextColumn get description => text().nullable()();
  RealColumn get initialBalance => real()();
  RealColumn get currentBalance => real()();
  TextColumn get color => text().nullable()();
  TextColumn get icon => text().nullable()();
  BoolColumn get isIncludedInTotal => boolean()();
  BoolColumn get isActive => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class AccountTypes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get icon => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Budgets extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get amount => real()();
  TextColumn get period => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  RealColumn get alertThreshold => real()();
  BoolColumn get isActive => boolean()();
  TextColumn get categoryId => text().nullable()();
  TextColumn get categoryName => text().nullable()();
  TextColumn get currencyId => text()();
  TextColumn get currencyCode => text()();
  TextColumn get currencySymbol => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  TextColumn get color => text().nullable()();
  TextColumn get icon => text().nullable()();
  IntColumn get displayOrder => integer()();
  BoolColumn get isSystem => boolean()();
  BoolColumn get isActive => boolean()();
  TextColumn get parentCategoryId => text().nullable()();
  TextColumn get parentCategoryName => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Currencies extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get symbol => text()();
  IntColumn get decimalPlaces => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  RealColumn get targetAmount => real()();
  RealColumn get currentAmount => real()();
  RealColumn get remaining => real()();
  RealColumn get percentageComplete => real()();
  DateTimeColumn get targetDate => dateTime()();
  TextColumn get color => text().nullable()();
  TextColumn get icon => text().nullable()();
  BoolColumn get isCompleted => boolean()();
  TextColumn get accountId => text().nullable()();
  TextColumn get accountName => text().nullable()();
  TextColumn get currencyId => text()();
  TextColumn get currencyCode => text()();
  TextColumn get currencySymbol => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text()();
  TextColumn get accountName => text()();
  TextColumn get toAccountId => text().nullable()();
  TextColumn get toAccountName => text().nullable()();
  TextColumn get categoryId => text().nullable()();
  TextColumn get categoryName => text().nullable()();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  TextColumn get currencyId => text()();
  TextColumn get currencyCode => text()();
  TextColumn get currencySymbol => text()();
  RealColumn get exchangeRate => real().nullable()();
  RealColumn get convertedAmount => real().nullable()();
  DateTimeColumn get transactionDate => dateTime()();
  TextColumn get description => text()();
  TextColumn get note => text().nullable()();
  TextColumn get payee => text().nullable()();
  TextColumn get location => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class DashboardCache extends Table {
  TextColumn get key => text()();
  TextColumn get jsonData => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

class UserPreferences extends Table {
  TextColumn get userId => text()();
  TextColumn get defaultCurrencyId => text()();
  TextColumn get defaultCurrencyCode => text()();
  TextColumn get defaultCurrencySymbol => text()();
  TextColumn get language => text()();
  TextColumn get dateFormat => text()();
  IntColumn get firstDayOfWeek => integer()();
  TextColumn get timezone => text()();
  TextColumn get theme => text()();
  BoolColumn get enableNotifications => boolean()();
  BoolColumn get enableBiometric => boolean()();
  BoolColumn get autoBackup => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {userId};
}
