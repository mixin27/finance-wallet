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

 double get totalBalance; double get monthIncome; double get monthExpenses; double get savings; double get incomeChange; double get expenseChange; List<CategoryBreakdown> get categoryBreakdown; int get recentTransactionsCount; int get activeBudgetsCount; String get currentMonth;
/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardOverviewCopyWith<DashboardOverview> get copyWith => _$DashboardOverviewCopyWithImpl<DashboardOverview>(this as DashboardOverview, _$identity);

  /// Serializes this DashboardOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardOverview&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&(identical(other.monthIncome, monthIncome) || other.monthIncome == monthIncome)&&(identical(other.monthExpenses, monthExpenses) || other.monthExpenses == monthExpenses)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.incomeChange, incomeChange) || other.incomeChange == incomeChange)&&(identical(other.expenseChange, expenseChange) || other.expenseChange == expenseChange)&&const DeepCollectionEquality().equals(other.categoryBreakdown, categoryBreakdown)&&(identical(other.recentTransactionsCount, recentTransactionsCount) || other.recentTransactionsCount == recentTransactionsCount)&&(identical(other.activeBudgetsCount, activeBudgetsCount) || other.activeBudgetsCount == activeBudgetsCount)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBalance,monthIncome,monthExpenses,savings,incomeChange,expenseChange,const DeepCollectionEquality().hash(categoryBreakdown),recentTransactionsCount,activeBudgetsCount,currentMonth);

@override
String toString() {
  return 'DashboardOverview(totalBalance: $totalBalance, monthIncome: $monthIncome, monthExpenses: $monthExpenses, savings: $savings, incomeChange: $incomeChange, expenseChange: $expenseChange, categoryBreakdown: $categoryBreakdown, recentTransactionsCount: $recentTransactionsCount, activeBudgetsCount: $activeBudgetsCount, currentMonth: $currentMonth)';
}


}

/// @nodoc
abstract mixin class $DashboardOverviewCopyWith<$Res>  {
  factory $DashboardOverviewCopyWith(DashboardOverview value, $Res Function(DashboardOverview) _then) = _$DashboardOverviewCopyWithImpl;
@useResult
$Res call({
 double totalBalance, double monthIncome, double monthExpenses, double savings, double incomeChange, double expenseChange, List<CategoryBreakdown> categoryBreakdown, int recentTransactionsCount, int activeBudgetsCount, String currentMonth
});




}
/// @nodoc
class _$DashboardOverviewCopyWithImpl<$Res>
    implements $DashboardOverviewCopyWith<$Res> {
  _$DashboardOverviewCopyWithImpl(this._self, this._then);

  final DashboardOverview _self;
  final $Res Function(DashboardOverview) _then;

/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBalance = null,Object? monthIncome = null,Object? monthExpenses = null,Object? savings = null,Object? incomeChange = null,Object? expenseChange = null,Object? categoryBreakdown = null,Object? recentTransactionsCount = null,Object? activeBudgetsCount = null,Object? currentMonth = null,}) {
  return _then(_self.copyWith(
totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,monthIncome: null == monthIncome ? _self.monthIncome : monthIncome // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalBalance,  double monthIncome,  double monthExpenses,  double savings,  double incomeChange,  double expenseChange,  List<CategoryBreakdown> categoryBreakdown,  int recentTransactionsCount,  int activeBudgetsCount,  String currentMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardOverview() when $default != null:
return $default(_that.totalBalance,_that.monthIncome,_that.monthExpenses,_that.savings,_that.incomeChange,_that.expenseChange,_that.categoryBreakdown,_that.recentTransactionsCount,_that.activeBudgetsCount,_that.currentMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalBalance,  double monthIncome,  double monthExpenses,  double savings,  double incomeChange,  double expenseChange,  List<CategoryBreakdown> categoryBreakdown,  int recentTransactionsCount,  int activeBudgetsCount,  String currentMonth)  $default,) {final _that = this;
switch (_that) {
case _DashboardOverview():
return $default(_that.totalBalance,_that.monthIncome,_that.monthExpenses,_that.savings,_that.incomeChange,_that.expenseChange,_that.categoryBreakdown,_that.recentTransactionsCount,_that.activeBudgetsCount,_that.currentMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalBalance,  double monthIncome,  double monthExpenses,  double savings,  double incomeChange,  double expenseChange,  List<CategoryBreakdown> categoryBreakdown,  int recentTransactionsCount,  int activeBudgetsCount,  String currentMonth)?  $default,) {final _that = this;
switch (_that) {
case _DashboardOverview() when $default != null:
return $default(_that.totalBalance,_that.monthIncome,_that.monthExpenses,_that.savings,_that.incomeChange,_that.expenseChange,_that.categoryBreakdown,_that.recentTransactionsCount,_that.activeBudgetsCount,_that.currentMonth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardOverview implements DashboardOverview {
  const _DashboardOverview({required this.totalBalance, required this.monthIncome, required this.monthExpenses, required this.savings, required this.incomeChange, required this.expenseChange, required final  List<CategoryBreakdown> categoryBreakdown, required this.recentTransactionsCount, required this.activeBudgetsCount, required this.currentMonth}): _categoryBreakdown = categoryBreakdown;
  factory _DashboardOverview.fromJson(Map<String, dynamic> json) => _$DashboardOverviewFromJson(json);

@override final  double totalBalance;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardOverview&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&(identical(other.monthIncome, monthIncome) || other.monthIncome == monthIncome)&&(identical(other.monthExpenses, monthExpenses) || other.monthExpenses == monthExpenses)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.incomeChange, incomeChange) || other.incomeChange == incomeChange)&&(identical(other.expenseChange, expenseChange) || other.expenseChange == expenseChange)&&const DeepCollectionEquality().equals(other._categoryBreakdown, _categoryBreakdown)&&(identical(other.recentTransactionsCount, recentTransactionsCount) || other.recentTransactionsCount == recentTransactionsCount)&&(identical(other.activeBudgetsCount, activeBudgetsCount) || other.activeBudgetsCount == activeBudgetsCount)&&(identical(other.currentMonth, currentMonth) || other.currentMonth == currentMonth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBalance,monthIncome,monthExpenses,savings,incomeChange,expenseChange,const DeepCollectionEquality().hash(_categoryBreakdown),recentTransactionsCount,activeBudgetsCount,currentMonth);

@override
String toString() {
  return 'DashboardOverview(totalBalance: $totalBalance, monthIncome: $monthIncome, monthExpenses: $monthExpenses, savings: $savings, incomeChange: $incomeChange, expenseChange: $expenseChange, categoryBreakdown: $categoryBreakdown, recentTransactionsCount: $recentTransactionsCount, activeBudgetsCount: $activeBudgetsCount, currentMonth: $currentMonth)';
}


}

/// @nodoc
abstract mixin class _$DashboardOverviewCopyWith<$Res> implements $DashboardOverviewCopyWith<$Res> {
  factory _$DashboardOverviewCopyWith(_DashboardOverview value, $Res Function(_DashboardOverview) _then) = __$DashboardOverviewCopyWithImpl;
@override @useResult
$Res call({
 double totalBalance, double monthIncome, double monthExpenses, double savings, double incomeChange, double expenseChange, List<CategoryBreakdown> categoryBreakdown, int recentTransactionsCount, int activeBudgetsCount, String currentMonth
});




}
/// @nodoc
class __$DashboardOverviewCopyWithImpl<$Res>
    implements _$DashboardOverviewCopyWith<$Res> {
  __$DashboardOverviewCopyWithImpl(this._self, this._then);

  final _DashboardOverview _self;
  final $Res Function(_DashboardOverview) _then;

/// Create a copy of DashboardOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBalance = null,Object? monthIncome = null,Object? monthExpenses = null,Object? savings = null,Object? incomeChange = null,Object? expenseChange = null,Object? categoryBreakdown = null,Object? recentTransactionsCount = null,Object? activeBudgetsCount = null,Object? currentMonth = null,}) {
  return _then(_DashboardOverview(
totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,monthIncome: null == monthIncome ? _self.monthIncome : monthIncome // ignore: cast_nullable_to_non_nullable
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

// dart format on
