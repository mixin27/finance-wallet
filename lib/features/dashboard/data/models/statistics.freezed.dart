// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Statistics {

 String get startDate; String get endDate; double get totalIncome; double get totalExpenses; double get netIncome; double get avgDailyIncome; double get avgDailyExpense; List<CategorySummary> get expensesByCategory; List<CategorySummary> get incomeByCategory; List<DailyTrend> get dailyTrends;
/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsCopyWith<Statistics> get copyWith => _$StatisticsCopyWithImpl<Statistics>(this as Statistics, _$identity);

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Statistics&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.netIncome, netIncome) || other.netIncome == netIncome)&&(identical(other.avgDailyIncome, avgDailyIncome) || other.avgDailyIncome == avgDailyIncome)&&(identical(other.avgDailyExpense, avgDailyExpense) || other.avgDailyExpense == avgDailyExpense)&&const DeepCollectionEquality().equals(other.expensesByCategory, expensesByCategory)&&const DeepCollectionEquality().equals(other.incomeByCategory, incomeByCategory)&&const DeepCollectionEquality().equals(other.dailyTrends, dailyTrends));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,totalIncome,totalExpenses,netIncome,avgDailyIncome,avgDailyExpense,const DeepCollectionEquality().hash(expensesByCategory),const DeepCollectionEquality().hash(incomeByCategory),const DeepCollectionEquality().hash(dailyTrends));

@override
String toString() {
  return 'Statistics(startDate: $startDate, endDate: $endDate, totalIncome: $totalIncome, totalExpenses: $totalExpenses, netIncome: $netIncome, avgDailyIncome: $avgDailyIncome, avgDailyExpense: $avgDailyExpense, expensesByCategory: $expensesByCategory, incomeByCategory: $incomeByCategory, dailyTrends: $dailyTrends)';
}


}

/// @nodoc
abstract mixin class $StatisticsCopyWith<$Res>  {
  factory $StatisticsCopyWith(Statistics value, $Res Function(Statistics) _then) = _$StatisticsCopyWithImpl;
@useResult
$Res call({
 String startDate, String endDate, double totalIncome, double totalExpenses, double netIncome, double avgDailyIncome, double avgDailyExpense, List<CategorySummary> expensesByCategory, List<CategorySummary> incomeByCategory, List<DailyTrend> dailyTrends
});




}
/// @nodoc
class _$StatisticsCopyWithImpl<$Res>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._self, this._then);

  final Statistics _self;
  final $Res Function(Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? totalIncome = null,Object? totalExpenses = null,Object? netIncome = null,Object? avgDailyIncome = null,Object? avgDailyExpense = null,Object? expensesByCategory = null,Object? incomeByCategory = null,Object? dailyTrends = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,netIncome: null == netIncome ? _self.netIncome : netIncome // ignore: cast_nullable_to_non_nullable
as double,avgDailyIncome: null == avgDailyIncome ? _self.avgDailyIncome : avgDailyIncome // ignore: cast_nullable_to_non_nullable
as double,avgDailyExpense: null == avgDailyExpense ? _self.avgDailyExpense : avgDailyExpense // ignore: cast_nullable_to_non_nullable
as double,expensesByCategory: null == expensesByCategory ? _self.expensesByCategory : expensesByCategory // ignore: cast_nullable_to_non_nullable
as List<CategorySummary>,incomeByCategory: null == incomeByCategory ? _self.incomeByCategory : incomeByCategory // ignore: cast_nullable_to_non_nullable
as List<CategorySummary>,dailyTrends: null == dailyTrends ? _self.dailyTrends : dailyTrends // ignore: cast_nullable_to_non_nullable
as List<DailyTrend>,
  ));
}

}


/// Adds pattern-matching-related methods to [Statistics].
extension StatisticsPatterns on Statistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Statistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Statistics value)  $default,){
final _that = this;
switch (_that) {
case _Statistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Statistics value)?  $default,){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String startDate,  String endDate,  double totalIncome,  double totalExpenses,  double netIncome,  double avgDailyIncome,  double avgDailyExpense,  List<CategorySummary> expensesByCategory,  List<CategorySummary> incomeByCategory,  List<DailyTrend> dailyTrends)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.startDate,_that.endDate,_that.totalIncome,_that.totalExpenses,_that.netIncome,_that.avgDailyIncome,_that.avgDailyExpense,_that.expensesByCategory,_that.incomeByCategory,_that.dailyTrends);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String startDate,  String endDate,  double totalIncome,  double totalExpenses,  double netIncome,  double avgDailyIncome,  double avgDailyExpense,  List<CategorySummary> expensesByCategory,  List<CategorySummary> incomeByCategory,  List<DailyTrend> dailyTrends)  $default,) {final _that = this;
switch (_that) {
case _Statistics():
return $default(_that.startDate,_that.endDate,_that.totalIncome,_that.totalExpenses,_that.netIncome,_that.avgDailyIncome,_that.avgDailyExpense,_that.expensesByCategory,_that.incomeByCategory,_that.dailyTrends);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String startDate,  String endDate,  double totalIncome,  double totalExpenses,  double netIncome,  double avgDailyIncome,  double avgDailyExpense,  List<CategorySummary> expensesByCategory,  List<CategorySummary> incomeByCategory,  List<DailyTrend> dailyTrends)?  $default,) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.startDate,_that.endDate,_that.totalIncome,_that.totalExpenses,_that.netIncome,_that.avgDailyIncome,_that.avgDailyExpense,_that.expensesByCategory,_that.incomeByCategory,_that.dailyTrends);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Statistics implements Statistics {
  const _Statistics({required this.startDate, required this.endDate, required this.totalIncome, required this.totalExpenses, required this.netIncome, required this.avgDailyIncome, required this.avgDailyExpense, required final  List<CategorySummary> expensesByCategory, required final  List<CategorySummary> incomeByCategory, required final  List<DailyTrend> dailyTrends}): _expensesByCategory = expensesByCategory,_incomeByCategory = incomeByCategory,_dailyTrends = dailyTrends;
  factory _Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

@override final  String startDate;
@override final  String endDate;
@override final  double totalIncome;
@override final  double totalExpenses;
@override final  double netIncome;
@override final  double avgDailyIncome;
@override final  double avgDailyExpense;
 final  List<CategorySummary> _expensesByCategory;
@override List<CategorySummary> get expensesByCategory {
  if (_expensesByCategory is EqualUnmodifiableListView) return _expensesByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expensesByCategory);
}

 final  List<CategorySummary> _incomeByCategory;
@override List<CategorySummary> get incomeByCategory {
  if (_incomeByCategory is EqualUnmodifiableListView) return _incomeByCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomeByCategory);
}

 final  List<DailyTrend> _dailyTrends;
@override List<DailyTrend> get dailyTrends {
  if (_dailyTrends is EqualUnmodifiableListView) return _dailyTrends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyTrends);
}


/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsCopyWith<_Statistics> get copyWith => __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Statistics&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.netIncome, netIncome) || other.netIncome == netIncome)&&(identical(other.avgDailyIncome, avgDailyIncome) || other.avgDailyIncome == avgDailyIncome)&&(identical(other.avgDailyExpense, avgDailyExpense) || other.avgDailyExpense == avgDailyExpense)&&const DeepCollectionEquality().equals(other._expensesByCategory, _expensesByCategory)&&const DeepCollectionEquality().equals(other._incomeByCategory, _incomeByCategory)&&const DeepCollectionEquality().equals(other._dailyTrends, _dailyTrends));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,totalIncome,totalExpenses,netIncome,avgDailyIncome,avgDailyExpense,const DeepCollectionEquality().hash(_expensesByCategory),const DeepCollectionEquality().hash(_incomeByCategory),const DeepCollectionEquality().hash(_dailyTrends));

@override
String toString() {
  return 'Statistics(startDate: $startDate, endDate: $endDate, totalIncome: $totalIncome, totalExpenses: $totalExpenses, netIncome: $netIncome, avgDailyIncome: $avgDailyIncome, avgDailyExpense: $avgDailyExpense, expensesByCategory: $expensesByCategory, incomeByCategory: $incomeByCategory, dailyTrends: $dailyTrends)';
}


}

/// @nodoc
abstract mixin class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(_Statistics value, $Res Function(_Statistics) _then) = __$StatisticsCopyWithImpl;
@override @useResult
$Res call({
 String startDate, String endDate, double totalIncome, double totalExpenses, double netIncome, double avgDailyIncome, double avgDailyExpense, List<CategorySummary> expensesByCategory, List<CategorySummary> incomeByCategory, List<DailyTrend> dailyTrends
});




}
/// @nodoc
class __$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(this._self, this._then);

  final _Statistics _self;
  final $Res Function(_Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? totalIncome = null,Object? totalExpenses = null,Object? netIncome = null,Object? avgDailyIncome = null,Object? avgDailyExpense = null,Object? expensesByCategory = null,Object? incomeByCategory = null,Object? dailyTrends = null,}) {
  return _then(_Statistics(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalIncome: null == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,netIncome: null == netIncome ? _self.netIncome : netIncome // ignore: cast_nullable_to_non_nullable
as double,avgDailyIncome: null == avgDailyIncome ? _self.avgDailyIncome : avgDailyIncome // ignore: cast_nullable_to_non_nullable
as double,avgDailyExpense: null == avgDailyExpense ? _self.avgDailyExpense : avgDailyExpense // ignore: cast_nullable_to_non_nullable
as double,expensesByCategory: null == expensesByCategory ? _self._expensesByCategory : expensesByCategory // ignore: cast_nullable_to_non_nullable
as List<CategorySummary>,incomeByCategory: null == incomeByCategory ? _self._incomeByCategory : incomeByCategory // ignore: cast_nullable_to_non_nullable
as List<CategorySummary>,dailyTrends: null == dailyTrends ? _self._dailyTrends : dailyTrends // ignore: cast_nullable_to_non_nullable
as List<DailyTrend>,
  ));
}


}


/// @nodoc
mixin _$CategorySummary {

 String get categoryId; String get categoryName; double get amount; String? get color; String? get icon;
/// Create a copy of CategorySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySummaryCopyWith<CategorySummary> get copyWith => _$CategorySummaryCopyWithImpl<CategorySummary>(this as CategorySummary, _$identity);

  /// Serializes this CategorySummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySummary&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,amount,color,icon);

@override
String toString() {
  return 'CategorySummary(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $CategorySummaryCopyWith<$Res>  {
  factory $CategorySummaryCopyWith(CategorySummary value, $Res Function(CategorySummary) _then) = _$CategorySummaryCopyWithImpl;
@useResult
$Res call({
 String categoryId, String categoryName, double amount, String? color, String? icon
});




}
/// @nodoc
class _$CategorySummaryCopyWithImpl<$Res>
    implements $CategorySummaryCopyWith<$Res> {
  _$CategorySummaryCopyWithImpl(this._self, this._then);

  final CategorySummary _self;
  final $Res Function(CategorySummary) _then;

/// Create a copy of CategorySummary
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


/// Adds pattern-matching-related methods to [CategorySummary].
extension CategorySummaryPatterns on CategorySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategorySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategorySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategorySummary value)  $default,){
final _that = this;
switch (_that) {
case _CategorySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategorySummary value)?  $default,){
final _that = this;
switch (_that) {
case _CategorySummary() when $default != null:
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
case _CategorySummary() when $default != null:
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
case _CategorySummary():
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
case _CategorySummary() when $default != null:
return $default(_that.categoryId,_that.categoryName,_that.amount,_that.color,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategorySummary implements CategorySummary {
  const _CategorySummary({required this.categoryId, required this.categoryName, required this.amount, this.color, this.icon});
  factory _CategorySummary.fromJson(Map<String, dynamic> json) => _$CategorySummaryFromJson(json);

@override final  String categoryId;
@override final  String categoryName;
@override final  double amount;
@override final  String? color;
@override final  String? icon;

/// Create a copy of CategorySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategorySummaryCopyWith<_CategorySummary> get copyWith => __$CategorySummaryCopyWithImpl<_CategorySummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategorySummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategorySummary&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categoryName,amount,color,icon);

@override
String toString() {
  return 'CategorySummary(categoryId: $categoryId, categoryName: $categoryName, amount: $amount, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CategorySummaryCopyWith<$Res> implements $CategorySummaryCopyWith<$Res> {
  factory _$CategorySummaryCopyWith(_CategorySummary value, $Res Function(_CategorySummary) _then) = __$CategorySummaryCopyWithImpl;
@override @useResult
$Res call({
 String categoryId, String categoryName, double amount, String? color, String? icon
});




}
/// @nodoc
class __$CategorySummaryCopyWithImpl<$Res>
    implements _$CategorySummaryCopyWith<$Res> {
  __$CategorySummaryCopyWithImpl(this._self, this._then);

  final _CategorySummary _self;
  final $Res Function(_CategorySummary) _then;

/// Create a copy of CategorySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categoryName = null,Object? amount = null,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_CategorySummary(
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
mixin _$DailyTrend {

 String get date; double get income; double get expenses; double get net;
/// Create a copy of DailyTrend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTrendCopyWith<DailyTrend> get copyWith => _$DailyTrendCopyWithImpl<DailyTrend>(this as DailyTrend, _$identity);

  /// Serializes this DailyTrend to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTrend&&(identical(other.date, date) || other.date == date)&&(identical(other.income, income) || other.income == income)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.net, net) || other.net == net));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,income,expenses,net);

@override
String toString() {
  return 'DailyTrend(date: $date, income: $income, expenses: $expenses, net: $net)';
}


}

/// @nodoc
abstract mixin class $DailyTrendCopyWith<$Res>  {
  factory $DailyTrendCopyWith(DailyTrend value, $Res Function(DailyTrend) _then) = _$DailyTrendCopyWithImpl;
@useResult
$Res call({
 String date, double income, double expenses, double net
});




}
/// @nodoc
class _$DailyTrendCopyWithImpl<$Res>
    implements $DailyTrendCopyWith<$Res> {
  _$DailyTrendCopyWithImpl(this._self, this._then);

  final DailyTrend _self;
  final $Res Function(DailyTrend) _then;

/// Create a copy of DailyTrend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? income = null,Object? expenses = null,Object? net = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as double,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as double,net: null == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyTrend].
extension DailyTrendPatterns on DailyTrend {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyTrend value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyTrend() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyTrend value)  $default,){
final _that = this;
switch (_that) {
case _DailyTrend():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyTrend value)?  $default,){
final _that = this;
switch (_that) {
case _DailyTrend() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double income,  double expenses,  double net)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyTrend() when $default != null:
return $default(_that.date,_that.income,_that.expenses,_that.net);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double income,  double expenses,  double net)  $default,) {final _that = this;
switch (_that) {
case _DailyTrend():
return $default(_that.date,_that.income,_that.expenses,_that.net);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double income,  double expenses,  double net)?  $default,) {final _that = this;
switch (_that) {
case _DailyTrend() when $default != null:
return $default(_that.date,_that.income,_that.expenses,_that.net);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyTrend implements DailyTrend {
  const _DailyTrend({required this.date, required this.income, required this.expenses, required this.net});
  factory _DailyTrend.fromJson(Map<String, dynamic> json) => _$DailyTrendFromJson(json);

@override final  String date;
@override final  double income;
@override final  double expenses;
@override final  double net;

/// Create a copy of DailyTrend
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyTrendCopyWith<_DailyTrend> get copyWith => __$DailyTrendCopyWithImpl<_DailyTrend>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyTrendToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyTrend&&(identical(other.date, date) || other.date == date)&&(identical(other.income, income) || other.income == income)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.net, net) || other.net == net));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,income,expenses,net);

@override
String toString() {
  return 'DailyTrend(date: $date, income: $income, expenses: $expenses, net: $net)';
}


}

/// @nodoc
abstract mixin class _$DailyTrendCopyWith<$Res> implements $DailyTrendCopyWith<$Res> {
  factory _$DailyTrendCopyWith(_DailyTrend value, $Res Function(_DailyTrend) _then) = __$DailyTrendCopyWithImpl;
@override @useResult
$Res call({
 String date, double income, double expenses, double net
});




}
/// @nodoc
class __$DailyTrendCopyWithImpl<$Res>
    implements _$DailyTrendCopyWith<$Res> {
  __$DailyTrendCopyWithImpl(this._self, this._then);

  final _DailyTrend _self;
  final $Res Function(_DailyTrend) _then;

/// Create a copy of DailyTrend
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? income = null,Object? expenses = null,Object? net = null,}) {
  return _then(_DailyTrend(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as double,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as double,net: null == net ? _self.net : net // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
