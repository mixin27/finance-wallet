// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardOverview {

 double get totalBalance; DefaultCurrency get defaultCurrency; List<AccountBalance> get accountBalances; double get monthIncome; double get monthExpenses; double get savings; double get incomeChange; double get expenseChange; List<CategoryBreakdown> get categoryBreakdown; int get recentTransactionsCount; int get activeBudgetsCount; String get currentMonth;
/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardOverviewCopyWith<DashboardOverview> get copyWith => _$DashboardOverviewCopyWithImpl<DashboardOverview>(this as DashboardOverview, _$identity);

  /// Serializes this DashboardOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardOverview&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&(identical(other.defaultCurrency, defaultCurrency) || other.defaultCurrency == defaultCurrency)&&const DeepCollectionEquality().equals(other.accountBalances, accountBalances)&&(identical(other.monthIncome, monthIncome) || other.monthIncome == monthIncome)&&(identical(other.monthExpenses, monthExpenses) || other.monthExpenses == monthExpenses)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.incomeChange, incomeChange) || other.incomeChange == incomeChange)&&(identical(other.expenseChange, expenseChange) || other.expenseChange == expenseChange)&&const DeepCollectionEquality().equals(other.categoryBreakdown, categoryBreakdown)&&(identical(other.recentTransactionsCount, recentTransactionsCount) || other.recentTransactionsCount == recentTransactionsCount)&&(identical(other.activeBudgetsCount, activeBudgetsCount) || other.activeBudgetsCount == activeBudgetsCount)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBalance,defaultCurrency,const DeepCollectionEquality().hash(accountBalances),monthIncome,monthExpenses,savings,incomeChange,expenseChange,const DeepCollectionEquality().hash(categoryBreakdown),recentTransactionsCount,activeBudgetsCount,currentMonth);

@override
String toString() {
  return 'DashboardOverview(totalBalance: $totalBalance, defaultCurrency: $defaultCurrency, accountBalances: $accountBalances, monthIncome: $monthIncome, monthExpenses: $monthExpenses, savings: $savings, incomeChange: $incomeChange, expenseChange: $expenseChange, categoryBreakdown: $categoryBreakdown, recentTransactionsCount: $recentTransactionsCount, activeBudgetsCount: $activeBudgetsCount, currentMonth: $currentMonth)';
}


}

/// @nodoc
abstract mixin class $DashboardOverviewCopyWith<$Res>  {
  factory $DashboardOverviewCopyWith(DashboardOverview value, $Res Function(DashboardOverview) _then) = _$DashboardOverviewCopyWithImpl;
@useResult
$Res call({
 double totalBalance, DefaultCurrency defaultCurrency, List<AccountBalance> accountBalances, double monthIncome, double monthExpenses, double savings, double incomeChange, double expenseChange, List<CategoryBreakdown> categoryBreakdown, int recentTransactionsCount, int activeBudgetsCount, String currentMonth
});


$DefaultCurrencyCopyWith<$Res> get defaultCurrency;

}
/// @nodoc
class _$DashboardOverviewCopyWithImpl<$Res>
    implements $DashboardOverviewCopyWith<$Res> {
  _$DashboardOverviewCopyWithImpl(this._self, this._then);

  final DashboardOverview _self;
  final $Res Function(DashboardOverview) _then;

/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBalance = null,Object? defaultCurrency = null,Object? accountBalances = null,Object? monthIncome = null,Object? monthExpenses = null,Object? savings = null,Object? incomeChange = null,Object? expenseChange = null,Object? categoryBreakdown = null,Object? recentTransactionsCount = null,Object? activeBudgetsCount = null,Object? currentMonth = null,}) {
  return _then(_self.copyWith(
totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,defaultCurrency: null == defaultCurrency ? _self.defaultCurrency : defaultCurrency // ignore: cast_nullable_to_non_nullable
as DefaultCurrency,accountBalances: null == accountBalances ? _self.accountBalances : accountBalances // ignore: cast_nullable_to_non_nullable
as List<AccountBalance>,monthIncome: null == monthIncome ? _self.monthIncome : monthIncome // ignore: cast_nullable_to_non_nullable
as double,monthExpenses: null == monthExpenses ? _self.monthExpenses : monthExpenses // ignore: cast_nullable_to_non_nullable
as double,savings: null == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as double,incomeChange: null == incomeChange ? _self.incomeChange : incomeChange // ignore: cast_nullable_to_non_nullable
as double,expenseChange: null == expenseChange ? _self.expenseChange : expenseChange // ignore: cast_nullable_to_non_nullable
as double,categoryBreakdown: null == categoryBreakdown ? _self.categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as List<CategoryBreakdown>,recentTransactionsCount: null == recentTransactionsCount ? _self.recentTransactionsCount : recentTransactionsCount // ignore: cast_nullable_to_non_nullable
as int,activeBudgetsCount: null == activeBudgetsCount ? _self.activeBudgetsCount : activeBudgetsCount // ignore: cast_nullable_to_non_nullable
as int,currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultCurrencyCopyWith<$Res> get defaultCurrency {
  
  return $DefaultCurrencyCopyWith<$Res>(_self.defaultCurrency, (value) {
    return _then(_self.copyWith(defaultCurrency: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardOverview].
extension DashboardOverviewPatterns on DashboardOverview {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardOverview() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardOverview value)  $default,){
final _that = this;
switch (_that) {
case _DashboardOverview():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardOverview value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardOverview() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalBalance,  DefaultCurrency defaultCurrency,  List<AccountBalance> accountBalances,  double monthIncome,  double monthExpenses,  double savings,  double incomeChange,  double expenseChange,  List<CategoryBreakdown> categoryBreakdown,  int recentTransactionsCount,  int activeBudgetsCount,  String currentMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardOverview() when $default != null:
return $default(_that.totalBalance,_that.defaultCurrency,_that.accountBalances,_that.monthIncome,_that.monthExpenses,_that.savings,_that.incomeChange,_that.expenseChange,_that.categoryBreakdown,_that.recentTransactionsCount,_that.activeBudgetsCount,_that.currentMonth);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalBalance,  DefaultCurrency defaultCurrency,  List<AccountBalance> accountBalances,  double monthIncome,  double monthExpenses,  double savings,  double incomeChange,  double expenseChange,  List<CategoryBreakdown> categoryBreakdown,  int recentTransactionsCount,  int activeBudgetsCount,  String currentMonth)  $default,) {final _that = this;
switch (_that) {
case _DashboardOverview():
return $default(_that.totalBalance,_that.defaultCurrency,_that.accountBalances,_that.monthIncome,_that.monthExpenses,_that.savings,_that.incomeChange,_that.expenseChange,_that.categoryBreakdown,_that.recentTransactionsCount,_that.activeBudgetsCount,_that.currentMonth);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalBalance,  DefaultCurrency defaultCurrency,  List<AccountBalance> accountBalances,  double monthIncome,  double monthExpenses,  double savings,  double incomeChange,  double expenseChange,  List<CategoryBreakdown> categoryBreakdown,  int recentTransactionsCount,  int activeBudgetsCount,  String currentMonth)?  $default,) {final _that = this;
switch (_that) {
case _DashboardOverview() when $default != null:
return $default(_that.totalBalance,_that.defaultCurrency,_that.accountBalances,_that.monthIncome,_that.monthExpenses,_that.savings,_that.incomeChange,_that.expenseChange,_that.categoryBreakdown,_that.recentTransactionsCount,_that.activeBudgetsCount,_that.currentMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardOverview implements DashboardOverview {
  const _DashboardOverview({required this.totalBalance, required this.defaultCurrency, required final  List<AccountBalance> accountBalances, required this.monthIncome, required this.monthExpenses, required this.savings, required this.incomeChange, required this.expenseChange, required final  List<CategoryBreakdown> categoryBreakdown, required this.recentTransactionsCount, required this.activeBudgetsCount, required this.currentMonth}): _accountBalances = accountBalances,_categoryBreakdown = categoryBreakdown;
  factory _DashboardOverview.fromJson(Map<String, dynamic> json) => _$DashboardOverviewFromJson(json);

@override final  double totalBalance;
@override final  DefaultCurrency defaultCurrency;
 final  List<AccountBalance> _accountBalances;
@override List<AccountBalance> get accountBalances {
  if (_accountBalances is EqualUnmodifiableListView) return _accountBalances;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accountBalances);
}

@override final  double monthIncome;
@override final  double monthExpenses;
@override final  double savings;
@override final  double incomeChange;
@override final  double expenseChange;
 final  List<CategoryBreakdown> _categoryBreakdown;
@override List<CategoryBreakdown> get categoryBreakdown {
  if (_categoryBreakdown is EqualUnmodifiableListView) return _categoryBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryBreakdown);
}

@override final  int recentTransactionsCount;
@override final  int activeBudgetsCount;
@override final  String currentMonth;

/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardOverviewCopyWith<_DashboardOverview> get copyWith => __$DashboardOverviewCopyWithImpl<_DashboardOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardOverview&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&(identical(other.defaultCurrency, defaultCurrency) || other.defaultCurrency == defaultCurrency)&&const DeepCollectionEquality().equals(other._accountBalances, _accountBalances)&&(identical(other.monthIncome, monthIncome) || other.monthIncome == monthIncome)&&(identical(other.monthExpenses, monthExpenses) || other.monthExpenses == monthExpenses)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.incomeChange, incomeChange) || other.incomeChange == incomeChange)&&(identical(other.expenseChange, expenseChange) || other.expenseChange == expenseChange)&&const DeepCollectionEquality().equals(other._categoryBreakdown, _categoryBreakdown)&&(identical(other.recentTransactionsCount, recentTransactionsCount) || other.recentTransactionsCount == recentTransactionsCount)&&(identical(other.activeBudgetsCount, activeBudgetsCount) || other.activeBudgetsCount == activeBudgetsCount)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBalance,defaultCurrency,const DeepCollectionEquality().hash(_accountBalances),monthIncome,monthExpenses,savings,incomeChange,expenseChange,const DeepCollectionEquality().hash(_categoryBreakdown),recentTransactionsCount,activeBudgetsCount,currentMonth);

@override
String toString() {
  return 'DashboardOverview(totalBalance: $totalBalance, defaultCurrency: $defaultCurrency, accountBalances: $accountBalances, monthIncome: $monthIncome, monthExpenses: $monthExpenses, savings: $savings, incomeChange: $incomeChange, expenseChange: $expenseChange, categoryBreakdown: $categoryBreakdown, recentTransactionsCount: $recentTransactionsCount, activeBudgetsCount: $activeBudgetsCount, currentMonth: $currentMonth)';
}


}

/// @nodoc
abstract mixin class _$DashboardOverviewCopyWith<$Res> implements $DashboardOverviewCopyWith<$Res> {
  factory _$DashboardOverviewCopyWith(_DashboardOverview value, $Res Function(_DashboardOverview) _then) = __$DashboardOverviewCopyWithImpl;
@override @useResult
$Res call({
 double totalBalance, DefaultCurrency defaultCurrency, List<AccountBalance> accountBalances, double monthIncome, double monthExpenses, double savings, double incomeChange, double expenseChange, List<CategoryBreakdown> categoryBreakdown, int recentTransactionsCount, int activeBudgetsCount, String currentMonth
});


@override $DefaultCurrencyCopyWith<$Res> get defaultCurrency;

}
/// @nodoc
class __$DashboardOverviewCopyWithImpl<$Res>
    implements _$DashboardOverviewCopyWith<$Res> {
  __$DashboardOverviewCopyWithImpl(this._self, this._then);

  final _DashboardOverview _self;
  final $Res Function(_DashboardOverview) _then;

/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBalance = null,Object? defaultCurrency = null,Object? accountBalances = null,Object? monthIncome = null,Object? monthExpenses = null,Object? savings = null,Object? incomeChange = null,Object? expenseChange = null,Object? categoryBreakdown = null,Object? recentTransactionsCount = null,Object? activeBudgetsCount = null,Object? currentMonth = null,}) {
  return _then(_DashboardOverview(
totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,defaultCurrency: null == defaultCurrency ? _self.defaultCurrency : defaultCurrency // ignore: cast_nullable_to_non_nullable
as DefaultCurrency,accountBalances: null == accountBalances ? _self._accountBalances : accountBalances // ignore: cast_nullable_to_non_nullable
as List<AccountBalance>,monthIncome: null == monthIncome ? _self.monthIncome : monthIncome // ignore: cast_nullable_to_non_nullable
as double,monthExpenses: null == monthExpenses ? _self.monthExpenses : monthExpenses // ignore: cast_nullable_to_non_nullable
as double,savings: null == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as double,incomeChange: null == incomeChange ? _self.incomeChange : incomeChange // ignore: cast_nullable_to_non_nullable
as double,expenseChange: null == expenseChange ? _self.expenseChange : expenseChange // ignore: cast_nullable_to_non_nullable
as double,categoryBreakdown: null == categoryBreakdown ? _self._categoryBreakdown : categoryBreakdown // ignore: cast_nullable_to_non_nullable
as List<CategoryBreakdown>,recentTransactionsCount: null == recentTransactionsCount ? _self.recentTransactionsCount : recentTransactionsCount // ignore: cast_nullable_to_non_nullable
as int,activeBudgetsCount: null == activeBudgetsCount ? _self.activeBudgetsCount : activeBudgetsCount // ignore: cast_nullable_to_non_nullable
as int,currentMonth: null == currentMonth ? _self.currentMonth : currentMonth // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultCurrencyCopyWith<$Res> get defaultCurrency {
  
  return $DefaultCurrencyCopyWith<$Res>(_self.defaultCurrency, (value) {
    return _then(_self.copyWith(defaultCurrency: value));
  });
}
}


/// @nodoc
mixin _$CategoryBreakdown {

 String get categoryId; String get categoryName; double get amount; String? get color; String? get icon;
/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryBreakdownCopyWith<CategoryBreakdown> get copyWith => _$CategoryBreakdownCopyWithImpl<CategoryBreakdown>(this as CategoryBreakdown, _$identity);

  /// Serializes this CategoryBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryBreakdown&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,amount,color,icon);

@override
String toString() {
  return 'CategoryBreakdown(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $CategoryBreakdownCopyWith<$Res>  {
  factory $CategoryBreakdownCopyWith(CategoryBreakdown value, $Res Function(CategoryBreakdown) _then) = _$CategoryBreakdownCopyWithImpl;
@useResult
$Res call({
 String categoryId, String categoryName, double amount, String? color, String? icon
});




}
/// @nodoc
class _$CategoryBreakdownCopyWithImpl<$Res>
    implements $CategoryBreakdownCopyWith<$Res> {
  _$CategoryBreakdownCopyWithImpl(this._self, this._then);

  final CategoryBreakdown _self;
  final $Res Function(CategoryBreakdown) _then;

/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categoryName = null,Object? amount = null,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryBreakdown].
extension CategoryBreakdownPatterns on CategoryBreakdown {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _CategoryBreakdown():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String categoryId,  String categoryName,  double amount,  String? color,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.amount,_that.color,_that.icon);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String categoryId,  String categoryName,  double amount,  String? color,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _CategoryBreakdown():
return $default(_that.categoryId,_that.categoryName,_that.amount,_that.color,_that.icon);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String categoryId,  String categoryName,  double amount,  String? color,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _CategoryBreakdown() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.amount,_that.color,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryBreakdown implements CategoryBreakdown {
  const _CategoryBreakdown({required this.categoryId, required this.categoryName, required this.amount, this.color, this.icon});
  factory _CategoryBreakdown.fromJson(Map<String, dynamic> json) => _$CategoryBreakdownFromJson(json);

@override final  String categoryId;
@override final  String categoryName;
@override final  double amount;
@override final  String? color;
@override final  String? icon;

/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryBreakdownCopyWith<_CategoryBreakdown> get copyWith => __$CategoryBreakdownCopyWithImpl<_CategoryBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryBreakdown&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,amount,color,icon);

@override
String toString() {
  return 'CategoryBreakdown(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CategoryBreakdownCopyWith<$Res> implements $CategoryBreakdownCopyWith<$Res> {
  factory _$CategoryBreakdownCopyWith(_CategoryBreakdown value, $Res Function(_CategoryBreakdown) _then) = __$CategoryBreakdownCopyWithImpl;
@override @useResult
$Res call({
 String categoryId, String categoryName, double amount, String? color, String? icon
});




}
/// @nodoc
class __$CategoryBreakdownCopyWithImpl<$Res>
    implements _$CategoryBreakdownCopyWith<$Res> {
  __$CategoryBreakdownCopyWithImpl(this._self, this._then);

  final _CategoryBreakdown _self;
  final $Res Function(_CategoryBreakdown) _then;

/// Create a copy of CategoryBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryName = null,Object? amount = null,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_CategoryBreakdown(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DefaultCurrency {

 String get id; String get code; String get symbol; String get name;
/// Create a copy of DefaultCurrency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultCurrencyCopyWith<DefaultCurrency> get copyWith => _$DefaultCurrencyCopyWithImpl<DefaultCurrency>(this as DefaultCurrency, _$identity);

  /// Serializes this DefaultCurrency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultCurrency&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,symbol,name);

@override
String toString() {
  return 'DefaultCurrency(id: $id, code: $code, symbol: $symbol, name: $name)';
}


}

/// @nodoc
abstract mixin class $DefaultCurrencyCopyWith<$Res>  {
  factory $DefaultCurrencyCopyWith(DefaultCurrency value, $Res Function(DefaultCurrency) _then) = _$DefaultCurrencyCopyWithImpl;
@useResult
$Res call({
 String id, String code, String symbol, String name
});




}
/// @nodoc
class _$DefaultCurrencyCopyWithImpl<$Res>
    implements $DefaultCurrencyCopyWith<$Res> {
  _$DefaultCurrencyCopyWithImpl(this._self, this._then);

  final DefaultCurrency _self;
  final $Res Function(DefaultCurrency) _then;

/// Create a copy of DefaultCurrency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? symbol = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DefaultCurrency].
extension DefaultCurrencyPatterns on DefaultCurrency {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefaultCurrency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefaultCurrency() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefaultCurrency value)  $default,){
final _that = this;
switch (_that) {
case _DefaultCurrency():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefaultCurrency value)?  $default,){
final _that = this;
switch (_that) {
case _DefaultCurrency() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String symbol,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefaultCurrency() when $default != null:
return $default(_that.id,_that.code,_that.symbol,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String symbol,  String name)  $default,) {final _that = this;
switch (_that) {
case _DefaultCurrency():
return $default(_that.id,_that.code,_that.symbol,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String symbol,  String name)?  $default,) {final _that = this;
switch (_that) {
case _DefaultCurrency() when $default != null:
return $default(_that.id,_that.code,_that.symbol,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DefaultCurrency implements DefaultCurrency {
  const _DefaultCurrency({required this.id, required this.code, required this.symbol, required this.name});
  factory _DefaultCurrency.fromJson(Map<String, dynamic> json) => _$DefaultCurrencyFromJson(json);

@override final  String id;
@override final  String code;
@override final  String symbol;
@override final  String name;

/// Create a copy of DefaultCurrency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultCurrencyCopyWith<_DefaultCurrency> get copyWith => __$DefaultCurrencyCopyWithImpl<_DefaultCurrency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefaultCurrencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultCurrency&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,symbol,name);

@override
String toString() {
  return 'DefaultCurrency(id: $id, code: $code, symbol: $symbol, name: $name)';
}


}

/// @nodoc
abstract mixin class _$DefaultCurrencyCopyWith<$Res> implements $DefaultCurrencyCopyWith<$Res> {
  factory _$DefaultCurrencyCopyWith(_DefaultCurrency value, $Res Function(_DefaultCurrency) _then) = __$DefaultCurrencyCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String symbol, String name
});




}
/// @nodoc
class __$DefaultCurrencyCopyWithImpl<$Res>
    implements _$DefaultCurrencyCopyWith<$Res> {
  __$DefaultCurrencyCopyWithImpl(this._self, this._then);

  final _DefaultCurrency _self;
  final $Res Function(_DefaultCurrency) _then;

/// Create a copy of DefaultCurrency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? symbol = null,Object? name = null,}) {
  return _then(_DefaultCurrency(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccountBalance {

 String get accountId; String get accountName; double get balance; DefaultCurrency get currency; double get balanceInDefaultCurrency;
/// Create a copy of AccountBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBalanceCopyWith<AccountBalance> get copyWith => _$AccountBalanceCopyWithImpl<AccountBalance>(this as AccountBalance, _$identity);

  /// Serializes this AccountBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBalance&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.balanceInDefaultCurrency, balanceInDefaultCurrency) || other.balanceInDefaultCurrency == balanceInDefaultCurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,balance,currency,balanceInDefaultCurrency);

@override
String toString() {
  return 'AccountBalance(accountId: $accountId, accountName: $accountName, balance: $balance, currency: $currency, balanceInDefaultCurrency: $balanceInDefaultCurrency)';
}


}

/// @nodoc
abstract mixin class $AccountBalanceCopyWith<$Res>  {
  factory $AccountBalanceCopyWith(AccountBalance value, $Res Function(AccountBalance) _then) = _$AccountBalanceCopyWithImpl;
@useResult
$Res call({
 String accountId, String accountName, double balance, DefaultCurrency currency, double balanceInDefaultCurrency
});


$DefaultCurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class _$AccountBalanceCopyWithImpl<$Res>
    implements $AccountBalanceCopyWith<$Res> {
  _$AccountBalanceCopyWithImpl(this._self, this._then);

  final AccountBalance _self;
  final $Res Function(AccountBalance) _then;

/// Create a copy of AccountBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? accountName = null,Object? balance = null,Object? currency = null,Object? balanceInDefaultCurrency = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as DefaultCurrency,balanceInDefaultCurrency: null == balanceInDefaultCurrency ? _self.balanceInDefaultCurrency : balanceInDefaultCurrency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of AccountBalance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultCurrencyCopyWith<$Res> get currency {
  
  return $DefaultCurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountBalance].
extension AccountBalancePatterns on AccountBalance {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountBalance() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountBalance value)  $default,){
final _that = this;
switch (_that) {
case _AccountBalance():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountBalance value)?  $default,){
final _that = this;
switch (_that) {
case _AccountBalance() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId,  String accountName,  double balance,  DefaultCurrency currency,  double balanceInDefaultCurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountBalance() when $default != null:
return $default(_that.accountId,_that.accountName,_that.balance,_that.currency,_that.balanceInDefaultCurrency);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId,  String accountName,  double balance,  DefaultCurrency currency,  double balanceInDefaultCurrency)  $default,) {final _that = this;
switch (_that) {
case _AccountBalance():
return $default(_that.accountId,_that.accountName,_that.balance,_that.currency,_that.balanceInDefaultCurrency);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId,  String accountName,  double balance,  DefaultCurrency currency,  double balanceInDefaultCurrency)?  $default,) {final _that = this;
switch (_that) {
case _AccountBalance() when $default != null:
return $default(_that.accountId,_that.accountName,_that.balance,_that.currency,_that.balanceInDefaultCurrency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountBalance implements AccountBalance {
  const _AccountBalance({required this.accountId, required this.accountName, required this.balance, required this.currency, required this.balanceInDefaultCurrency});
  factory _AccountBalance.fromJson(Map<String, dynamic> json) => _$AccountBalanceFromJson(json);

@override final  String accountId;
@override final  String accountName;
@override final  double balance;
@override final  DefaultCurrency currency;
@override final  double balanceInDefaultCurrency;

/// Create a copy of AccountBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBalanceCopyWith<_AccountBalance> get copyWith => __$AccountBalanceCopyWithImpl<_AccountBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBalance&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.balanceInDefaultCurrency, balanceInDefaultCurrency) || other.balanceInDefaultCurrency == balanceInDefaultCurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,balance,currency,balanceInDefaultCurrency);

@override
String toString() {
  return 'AccountBalance(accountId: $accountId, accountName: $accountName, balance: $balance, currency: $currency, balanceInDefaultCurrency: $balanceInDefaultCurrency)';
}


}

/// @nodoc
abstract mixin class _$AccountBalanceCopyWith<$Res> implements $AccountBalanceCopyWith<$Res> {
  factory _$AccountBalanceCopyWith(_AccountBalance value, $Res Function(_AccountBalance) _then) = __$AccountBalanceCopyWithImpl;
@override @useResult
$Res call({
 String accountId, String accountName, double balance, DefaultCurrency currency, double balanceInDefaultCurrency
});


@override $DefaultCurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class __$AccountBalanceCopyWithImpl<$Res>
    implements _$AccountBalanceCopyWith<$Res> {
  __$AccountBalanceCopyWithImpl(this._self, this._then);

  final _AccountBalance _self;
  final $Res Function(_AccountBalance) _then;

/// Create a copy of AccountBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? accountName = null,Object? balance = null,Object? currency = null,Object? balanceInDefaultCurrency = null,}) {
  return _then(_AccountBalance(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as DefaultCurrency,balanceInDefaultCurrency: null == balanceInDefaultCurrency ? _self.balanceInDefaultCurrency : balanceInDefaultCurrency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of AccountBalance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefaultCurrencyCopyWith<$Res> get currency {
  
  return $DefaultCurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}

// dart format on
