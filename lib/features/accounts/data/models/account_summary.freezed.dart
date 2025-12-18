// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountSummary {

 int get totalAccounts; int get activeAccounts; double get totalBalance; List<CurrencyBalance> get balanceByCurrency; List<Account> get accounts;
/// Create a copy of AccountSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountSummaryCopyWith<AccountSummary> get copyWith => _$AccountSummaryCopyWithImpl<AccountSummary>(this as AccountSummary, _$identity);

  /// Serializes this AccountSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountSummary&&(identical(other.totalAccounts, totalAccounts) || other.totalAccounts == totalAccounts)&&(identical(other.activeAccounts, activeAccounts) || other.activeAccounts == activeAccounts)&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&const DeepCollectionEquality().equals(other.balanceByCurrency, balanceByCurrency)&&const DeepCollectionEquality().equals(other.accounts, accounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAccounts,activeAccounts,totalBalance,const DeepCollectionEquality().hash(balanceByCurrency),const DeepCollectionEquality().hash(accounts));

@override
String toString() {
  return 'AccountSummary(totalAccounts: $totalAccounts, activeAccounts: $activeAccounts, totalBalance: $totalBalance, balanceByCurrency: $balanceByCurrency, accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class $AccountSummaryCopyWith<$Res>  {
  factory $AccountSummaryCopyWith(AccountSummary value, $Res Function(AccountSummary) _then) = _$AccountSummaryCopyWithImpl;
@useResult
$Res call({
 int totalAccounts, int activeAccounts, double totalBalance, List<CurrencyBalance> balanceByCurrency, List<Account> accounts
});




}
/// @nodoc
class _$AccountSummaryCopyWithImpl<$Res>
    implements $AccountSummaryCopyWith<$Res> {
  _$AccountSummaryCopyWithImpl(this._self, this._then);

  final AccountSummary _self;
  final $Res Function(AccountSummary) _then;

/// Create a copy of AccountSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAccounts = null,Object? activeAccounts = null,Object? totalBalance = null,Object? balanceByCurrency = null,Object? accounts = null,}) {
  return _then(_self.copyWith(
totalAccounts: null == totalAccounts ? _self.totalAccounts : totalAccounts // ignore: cast_nullable_to_non_nullable
as int,activeAccounts: null == activeAccounts ? _self.activeAccounts : activeAccounts // ignore: cast_nullable_to_non_nullable
as int,totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,balanceByCurrency: null == balanceByCurrency ? _self.balanceByCurrency : balanceByCurrency // ignore: cast_nullable_to_non_nullable
as List<CurrencyBalance>,accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountSummary].
extension AccountSummaryPatterns on AccountSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountSummary value)  $default,){
final _that = this;
switch (_that) {
case _AccountSummary():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AccountSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalAccounts,  int activeAccounts,  double totalBalance,  List<CurrencyBalance> balanceByCurrency,  List<Account> accounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountSummary() when $default != null:
return $default(_that.totalAccounts,_that.activeAccounts,_that.totalBalance,_that.balanceByCurrency,_that.accounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalAccounts,  int activeAccounts,  double totalBalance,  List<CurrencyBalance> balanceByCurrency,  List<Account> accounts)  $default,) {final _that = this;
switch (_that) {
case _AccountSummary():
return $default(_that.totalAccounts,_that.activeAccounts,_that.totalBalance,_that.balanceByCurrency,_that.accounts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalAccounts,  int activeAccounts,  double totalBalance,  List<CurrencyBalance> balanceByCurrency,  List<Account> accounts)?  $default,) {final _that = this;
switch (_that) {
case _AccountSummary() when $default != null:
return $default(_that.totalAccounts,_that.activeAccounts,_that.totalBalance,_that.balanceByCurrency,_that.accounts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountSummary implements AccountSummary {
  const _AccountSummary({required this.totalAccounts, required this.activeAccounts, required this.totalBalance, required final  List<CurrencyBalance> balanceByCurrency, required final  List<Account> accounts}): _balanceByCurrency = balanceByCurrency,_accounts = accounts;
  factory _AccountSummary.fromJson(Map<String, dynamic> json) => _$AccountSummaryFromJson(json);

@override final  int totalAccounts;
@override final  int activeAccounts;
@override final  double totalBalance;
 final  List<CurrencyBalance> _balanceByCurrency;
@override List<CurrencyBalance> get balanceByCurrency {
  if (_balanceByCurrency is EqualUnmodifiableListView) return _balanceByCurrency;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_balanceByCurrency);
}

 final  List<Account> _accounts;
@override List<Account> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}


/// Create a copy of AccountSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountSummaryCopyWith<_AccountSummary> get copyWith => __$AccountSummaryCopyWithImpl<_AccountSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountSummary&&(identical(other.totalAccounts, totalAccounts) || other.totalAccounts == totalAccounts)&&(identical(other.activeAccounts, activeAccounts) || other.activeAccounts == activeAccounts)&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance)&&const DeepCollectionEquality().equals(other._balanceByCurrency, _balanceByCurrency)&&const DeepCollectionEquality().equals(other._accounts, _accounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAccounts,activeAccounts,totalBalance,const DeepCollectionEquality().hash(_balanceByCurrency),const DeepCollectionEquality().hash(_accounts));

@override
String toString() {
  return 'AccountSummary(totalAccounts: $totalAccounts, activeAccounts: $activeAccounts, totalBalance: $totalBalance, balanceByCurrency: $balanceByCurrency, accounts: $accounts)';
}


}

/// @nodoc
abstract mixin class _$AccountSummaryCopyWith<$Res> implements $AccountSummaryCopyWith<$Res> {
  factory _$AccountSummaryCopyWith(_AccountSummary value, $Res Function(_AccountSummary) _then) = __$AccountSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalAccounts, int activeAccounts, double totalBalance, List<CurrencyBalance> balanceByCurrency, List<Account> accounts
});




}
/// @nodoc
class __$AccountSummaryCopyWithImpl<$Res>
    implements _$AccountSummaryCopyWith<$Res> {
  __$AccountSummaryCopyWithImpl(this._self, this._then);

  final _AccountSummary _self;
  final $Res Function(_AccountSummary) _then;

/// Create a copy of AccountSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAccounts = null,Object? activeAccounts = null,Object? totalBalance = null,Object? balanceByCurrency = null,Object? accounts = null,}) {
  return _then(_AccountSummary(
totalAccounts: null == totalAccounts ? _self.totalAccounts : totalAccounts // ignore: cast_nullable_to_non_nullable
as int,activeAccounts: null == activeAccounts ? _self.activeAccounts : activeAccounts // ignore: cast_nullable_to_non_nullable
as int,totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,balanceByCurrency: null == balanceByCurrency ? _self._balanceByCurrency : balanceByCurrency // ignore: cast_nullable_to_non_nullable
as List<CurrencyBalance>,accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<Account>,
  ));
}


}


/// @nodoc
mixin _$CurrencyBalance {

 String get currencyCode; String get currencySymbol; double get balance; int get accountCount;
/// Create a copy of CurrencyBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrencyBalanceCopyWith<CurrencyBalance> get copyWith => _$CurrencyBalanceCopyWithImpl<CurrencyBalance>(this as CurrencyBalance, _$identity);

  /// Serializes this CurrencyBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrencyBalance&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.accountCount, accountCount) || other.accountCount == accountCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyCode,currencySymbol,balance,accountCount);

@override
String toString() {
  return 'CurrencyBalance(currencyCode: $currencyCode, currencySymbol: $currencySymbol, balance: $balance, accountCount: $accountCount)';
}


}

/// @nodoc
abstract mixin class $CurrencyBalanceCopyWith<$Res>  {
  factory $CurrencyBalanceCopyWith(CurrencyBalance value, $Res Function(CurrencyBalance) _then) = _$CurrencyBalanceCopyWithImpl;
@useResult
$Res call({
 String currencyCode, String currencySymbol, double balance, int accountCount
});




}
/// @nodoc
class _$CurrencyBalanceCopyWithImpl<$Res>
    implements $CurrencyBalanceCopyWith<$Res> {
  _$CurrencyBalanceCopyWithImpl(this._self, this._then);

  final CurrencyBalance _self;
  final $Res Function(CurrencyBalance) _then;

/// Create a copy of CurrencyBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currencyCode = null,Object? currencySymbol = null,Object? balance = null,Object? accountCount = null,}) {
  return _then(_self.copyWith(
currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,accountCount: null == accountCount ? _self.accountCount : accountCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrencyBalance].
extension CurrencyBalancePatterns on CurrencyBalance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrencyBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrencyBalance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrencyBalance value)  $default,){
final _that = this;
switch (_that) {
case _CurrencyBalance():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrencyBalance value)?  $default,){
final _that = this;
switch (_that) {
case _CurrencyBalance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currencyCode,  String currencySymbol,  double balance,  int accountCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrencyBalance() when $default != null:
return $default(_that.currencyCode,_that.currencySymbol,_that.balance,_that.accountCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currencyCode,  String currencySymbol,  double balance,  int accountCount)  $default,) {final _that = this;
switch (_that) {
case _CurrencyBalance():
return $default(_that.currencyCode,_that.currencySymbol,_that.balance,_that.accountCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currencyCode,  String currencySymbol,  double balance,  int accountCount)?  $default,) {final _that = this;
switch (_that) {
case _CurrencyBalance() when $default != null:
return $default(_that.currencyCode,_that.currencySymbol,_that.balance,_that.accountCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrencyBalance implements CurrencyBalance {
  const _CurrencyBalance({required this.currencyCode, required this.currencySymbol, required this.balance, required this.accountCount});
  factory _CurrencyBalance.fromJson(Map<String, dynamic> json) => _$CurrencyBalanceFromJson(json);

@override final  String currencyCode;
@override final  String currencySymbol;
@override final  double balance;
@override final  int accountCount;

/// Create a copy of CurrencyBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrencyBalanceCopyWith<_CurrencyBalance> get copyWith => __$CurrencyBalanceCopyWithImpl<_CurrencyBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrencyBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrencyBalance&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.accountCount, accountCount) || other.accountCount == accountCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currencyCode,currencySymbol,balance,accountCount);

@override
String toString() {
  return 'CurrencyBalance(currencyCode: $currencyCode, currencySymbol: $currencySymbol, balance: $balance, accountCount: $accountCount)';
}


}

/// @nodoc
abstract mixin class _$CurrencyBalanceCopyWith<$Res> implements $CurrencyBalanceCopyWith<$Res> {
  factory _$CurrencyBalanceCopyWith(_CurrencyBalance value, $Res Function(_CurrencyBalance) _then) = __$CurrencyBalanceCopyWithImpl;
@override @useResult
$Res call({
 String currencyCode, String currencySymbol, double balance, int accountCount
});




}
/// @nodoc
class __$CurrencyBalanceCopyWithImpl<$Res>
    implements _$CurrencyBalanceCopyWith<$Res> {
  __$CurrencyBalanceCopyWithImpl(this._self, this._then);

  final _CurrencyBalance _self;
  final $Res Function(_CurrencyBalance) _then;

/// Create a copy of CurrencyBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyCode = null,Object? currencySymbol = null,Object? balance = null,Object? accountCount = null,}) {
  return _then(_CurrencyBalance(
currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,accountCount: null == accountCount ? _self.accountCount : accountCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
