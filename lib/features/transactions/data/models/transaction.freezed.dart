// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transaction {

 String get id; TransactionAccountInfo get account; TransactionAccountInfo? get toAccount;// For transfers
 Category? get category; String get type;// INCOME, EXPENSE, TRANSFER
 double get amount; Currency get currency; double? get exchangeRate; double? get convertedAmount; DateTime get transactionDate; String get description; String? get note; String? get payee; String? get location; double? get latitude; double? get longitude; String get status; List<Tag> get tags; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.account, account) || other.account == account)&&(identical(other.toAccount, toAccount) || other.toAccount == toAccount)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.convertedAmount, convertedAmount) || other.convertedAmount == convertedAmount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.payee, payee) || other.payee == payee)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,account,toAccount,category,type,amount,currency,exchangeRate,convertedAmount,transactionDate,description,note,payee,location,latitude,longitude,status,const DeepCollectionEquality().hash(tags),createdAt,updatedAt]);

@override
String toString() {
  return 'Transaction(id: $id, account: $account, toAccount: $toAccount, category: $category, type: $type, amount: $amount, currency: $currency, exchangeRate: $exchangeRate, convertedAmount: $convertedAmount, transactionDate: $transactionDate, description: $description, note: $note, payee: $payee, location: $location, latitude: $latitude, longitude: $longitude, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 String id, TransactionAccountInfo account, TransactionAccountInfo? toAccount, Category? category, String type, double amount, Currency currency, double? exchangeRate, double? convertedAmount, DateTime transactionDate, String description, String? note, String? payee, String? location, double? latitude, double? longitude, String status, List<Tag> tags, DateTime createdAt, DateTime updatedAt
});


$TransactionAccountInfoCopyWith<$Res> get account;$TransactionAccountInfoCopyWith<$Res>? get toAccount;$CategoryCopyWith<$Res>? get category;$CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? account = null,Object? toAccount = freezed,Object? category = freezed,Object? type = null,Object? amount = null,Object? currency = null,Object? exchangeRate = freezed,Object? convertedAmount = freezed,Object? transactionDate = null,Object? description = null,Object? note = freezed,Object? payee = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as TransactionAccountInfo,toAccount: freezed == toAccount ? _self.toAccount : toAccount // ignore: cast_nullable_to_non_nullable
as TransactionAccountInfo?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double?,convertedAmount: freezed == convertedAmount ? _self.convertedAmount : convertedAmount // ignore: cast_nullable_to_non_nullable
as double?,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,payee: freezed == payee ? _self.payee : payee // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionAccountInfoCopyWith<$Res> get account {
  
  return $TransactionAccountInfoCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionAccountInfoCopyWith<$Res>? get toAccount {
    if (_self.toAccount == null) {
    return null;
  }

  return $TransactionAccountInfoCopyWith<$Res>(_self.toAccount!, (value) {
    return _then(_self.copyWith(toAccount: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TransactionAccountInfo account,  TransactionAccountInfo? toAccount,  Category? category,  String type,  double amount,  Currency currency,  double? exchangeRate,  double? convertedAmount,  DateTime transactionDate,  String description,  String? note,  String? payee,  String? location,  double? latitude,  double? longitude,  String status,  List<Tag> tags,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.account,_that.toAccount,_that.category,_that.type,_that.amount,_that.currency,_that.exchangeRate,_that.convertedAmount,_that.transactionDate,_that.description,_that.note,_that.payee,_that.location,_that.latitude,_that.longitude,_that.status,_that.tags,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TransactionAccountInfo account,  TransactionAccountInfo? toAccount,  Category? category,  String type,  double amount,  Currency currency,  double? exchangeRate,  double? convertedAmount,  DateTime transactionDate,  String description,  String? note,  String? payee,  String? location,  double? latitude,  double? longitude,  String status,  List<Tag> tags,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.account,_that.toAccount,_that.category,_that.type,_that.amount,_that.currency,_that.exchangeRate,_that.convertedAmount,_that.transactionDate,_that.description,_that.note,_that.payee,_that.location,_that.latitude,_that.longitude,_that.status,_that.tags,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TransactionAccountInfo account,  TransactionAccountInfo? toAccount,  Category? category,  String type,  double amount,  Currency currency,  double? exchangeRate,  double? convertedAmount,  DateTime transactionDate,  String description,  String? note,  String? payee,  String? location,  double? latitude,  double? longitude,  String status,  List<Tag> tags,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.account,_that.toAccount,_that.category,_that.type,_that.amount,_that.currency,_that.exchangeRate,_that.convertedAmount,_that.transactionDate,_that.description,_that.note,_that.payee,_that.location,_that.latitude,_that.longitude,_that.status,_that.tags,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transaction implements Transaction {
  const _Transaction({required this.id, required this.account, this.toAccount, this.category, required this.type, required this.amount, required this.currency, this.exchangeRate, this.convertedAmount, required this.transactionDate, required this.description, this.note, this.payee, this.location, this.latitude, this.longitude, required this.status, required final  List<Tag> tags, required this.createdAt, required this.updatedAt}): _tags = tags;
  factory _Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

@override final  String id;
@override final  TransactionAccountInfo account;
@override final  TransactionAccountInfo? toAccount;
// For transfers
@override final  Category? category;
@override final  String type;
// INCOME, EXPENSE, TRANSFER
@override final  double amount;
@override final  Currency currency;
@override final  double? exchangeRate;
@override final  double? convertedAmount;
@override final  DateTime transactionDate;
@override final  String description;
@override final  String? note;
@override final  String? payee;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
@override final  String status;
 final  List<Tag> _tags;
@override List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.account, account) || other.account == account)&&(identical(other.toAccount, toAccount) || other.toAccount == toAccount)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.convertedAmount, convertedAmount) || other.convertedAmount == convertedAmount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.payee, payee) || other.payee == payee)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,account,toAccount,category,type,amount,currency,exchangeRate,convertedAmount,transactionDate,description,note,payee,location,latitude,longitude,status,const DeepCollectionEquality().hash(_tags),createdAt,updatedAt]);

@override
String toString() {
  return 'Transaction(id: $id, account: $account, toAccount: $toAccount, category: $category, type: $type, amount: $amount, currency: $currency, exchangeRate: $exchangeRate, convertedAmount: $convertedAmount, transactionDate: $transactionDate, description: $description, note: $note, payee: $payee, location: $location, latitude: $latitude, longitude: $longitude, status: $status, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, TransactionAccountInfo account, TransactionAccountInfo? toAccount, Category? category, String type, double amount, Currency currency, double? exchangeRate, double? convertedAmount, DateTime transactionDate, String description, String? note, String? payee, String? location, double? latitude, double? longitude, String status, List<Tag> tags, DateTime createdAt, DateTime updatedAt
});


@override $TransactionAccountInfoCopyWith<$Res> get account;@override $TransactionAccountInfoCopyWith<$Res>? get toAccount;@override $CategoryCopyWith<$Res>? get category;@override $CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? account = null,Object? toAccount = freezed,Object? category = freezed,Object? type = null,Object? amount = null,Object? currency = null,Object? exchangeRate = freezed,Object? convertedAmount = freezed,Object? transactionDate = null,Object? description = null,Object? note = freezed,Object? payee = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? status = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as TransactionAccountInfo,toAccount: freezed == toAccount ? _self.toAccount : toAccount // ignore: cast_nullable_to_non_nullable
as TransactionAccountInfo?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double?,convertedAmount: freezed == convertedAmount ? _self.convertedAmount : convertedAmount // ignore: cast_nullable_to_non_nullable
as double?,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,payee: freezed == payee ? _self.payee : payee // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionAccountInfoCopyWith<$Res> get account {
  
  return $TransactionAccountInfoCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionAccountInfoCopyWith<$Res>? get toAccount {
    if (_self.toAccount == null) {
    return null;
  }

  return $TransactionAccountInfoCopyWith<$Res>(_self.toAccount!, (value) {
    return _then(_self.copyWith(toAccount: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// @nodoc
mixin _$TransactionAccountInfo {

 String get id; String get name; AccountTypeInfo get accountType; Currency get currency;
/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionAccountInfoCopyWith<TransactionAccountInfo> get copyWith => _$TransactionAccountInfoCopyWithImpl<TransactionAccountInfo>(this as TransactionAccountInfo, _$identity);

  /// Serializes this TransactionAccountInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionAccountInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,accountType,currency);

@override
String toString() {
  return 'TransactionAccountInfo(id: $id, name: $name, accountType: $accountType, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $TransactionAccountInfoCopyWith<$Res>  {
  factory $TransactionAccountInfoCopyWith(TransactionAccountInfo value, $Res Function(TransactionAccountInfo) _then) = _$TransactionAccountInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, AccountTypeInfo accountType, Currency currency
});


$AccountTypeInfoCopyWith<$Res> get accountType;$CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class _$TransactionAccountInfoCopyWithImpl<$Res>
    implements $TransactionAccountInfoCopyWith<$Res> {
  _$TransactionAccountInfoCopyWithImpl(this._self, this._then);

  final TransactionAccountInfo _self;
  final $Res Function(TransactionAccountInfo) _then;

/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? accountType = null,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountTypeInfo,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,
  ));
}
/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountTypeInfoCopyWith<$Res> get accountType {
  
  return $AccountTypeInfoCopyWith<$Res>(_self.accountType, (value) {
    return _then(_self.copyWith(accountType: value));
  });
}/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionAccountInfo].
extension TransactionAccountInfoPatterns on TransactionAccountInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionAccountInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionAccountInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionAccountInfo value)  $default,){
final _that = this;
switch (_that) {
case _TransactionAccountInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionAccountInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionAccountInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  AccountTypeInfo accountType,  Currency currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionAccountInfo() when $default != null:
return $default(_that.id,_that.name,_that.accountType,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  AccountTypeInfo accountType,  Currency currency)  $default,) {final _that = this;
switch (_that) {
case _TransactionAccountInfo():
return $default(_that.id,_that.name,_that.accountType,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  AccountTypeInfo accountType,  Currency currency)?  $default,) {final _that = this;
switch (_that) {
case _TransactionAccountInfo() when $default != null:
return $default(_that.id,_that.name,_that.accountType,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionAccountInfo implements TransactionAccountInfo {
  const _TransactionAccountInfo({required this.id, required this.name, required this.accountType, required this.currency});
  factory _TransactionAccountInfo.fromJson(Map<String, dynamic> json) => _$TransactionAccountInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  AccountTypeInfo accountType;
@override final  Currency currency;

/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionAccountInfoCopyWith<_TransactionAccountInfo> get copyWith => __$TransactionAccountInfoCopyWithImpl<_TransactionAccountInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionAccountInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionAccountInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,accountType,currency);

@override
String toString() {
  return 'TransactionAccountInfo(id: $id, name: $name, accountType: $accountType, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$TransactionAccountInfoCopyWith<$Res> implements $TransactionAccountInfoCopyWith<$Res> {
  factory _$TransactionAccountInfoCopyWith(_TransactionAccountInfo value, $Res Function(_TransactionAccountInfo) _then) = __$TransactionAccountInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, AccountTypeInfo accountType, Currency currency
});


@override $AccountTypeInfoCopyWith<$Res> get accountType;@override $CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class __$TransactionAccountInfoCopyWithImpl<$Res>
    implements _$TransactionAccountInfoCopyWith<$Res> {
  __$TransactionAccountInfoCopyWithImpl(this._self, this._then);

  final _TransactionAccountInfo _self;
  final $Res Function(_TransactionAccountInfo) _then;

/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? accountType = null,Object? currency = null,}) {
  return _then(_TransactionAccountInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountTypeInfo,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,
  ));
}

/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountTypeInfoCopyWith<$Res> get accountType {
  
  return $AccountTypeInfoCopyWith<$Res>(_self.accountType, (value) {
    return _then(_self.copyWith(accountType: value));
  });
}/// Create a copy of TransactionAccountInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// @nodoc
mixin _$AccountTypeInfo {

 String get id; String get name; String? get icon;
/// Create a copy of AccountTypeInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountTypeInfoCopyWith<AccountTypeInfo> get copyWith => _$AccountTypeInfoCopyWithImpl<AccountTypeInfo>(this as AccountTypeInfo, _$identity);

  /// Serializes this AccountTypeInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountTypeInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'AccountTypeInfo(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $AccountTypeInfoCopyWith<$Res>  {
  factory $AccountTypeInfoCopyWith(AccountTypeInfo value, $Res Function(AccountTypeInfo) _then) = _$AccountTypeInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? icon
});




}
/// @nodoc
class _$AccountTypeInfoCopyWithImpl<$Res>
    implements $AccountTypeInfoCopyWith<$Res> {
  _$AccountTypeInfoCopyWithImpl(this._self, this._then);

  final AccountTypeInfo _self;
  final $Res Function(AccountTypeInfo) _then;

/// Create a copy of AccountTypeInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountTypeInfo].
extension AccountTypeInfoPatterns on AccountTypeInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountTypeInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountTypeInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountTypeInfo value)  $default,){
final _that = this;
switch (_that) {
case _AccountTypeInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountTypeInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AccountTypeInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountTypeInfo() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _AccountTypeInfo():
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _AccountTypeInfo() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountTypeInfo implements AccountTypeInfo {
  const _AccountTypeInfo({required this.id, required this.name, this.icon});
  factory _AccountTypeInfo.fromJson(Map<String, dynamic> json) => _$AccountTypeInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? icon;

/// Create a copy of AccountTypeInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountTypeInfoCopyWith<_AccountTypeInfo> get copyWith => __$AccountTypeInfoCopyWithImpl<_AccountTypeInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountTypeInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountTypeInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'AccountTypeInfo(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$AccountTypeInfoCopyWith<$Res> implements $AccountTypeInfoCopyWith<$Res> {
  factory _$AccountTypeInfoCopyWith(_AccountTypeInfo value, $Res Function(_AccountTypeInfo) _then) = __$AccountTypeInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? icon
});




}
/// @nodoc
class __$AccountTypeInfoCopyWithImpl<$Res>
    implements _$AccountTypeInfoCopyWith<$Res> {
  __$AccountTypeInfoCopyWithImpl(this._self, this._then);

  final _AccountTypeInfo _self;
  final $Res Function(_AccountTypeInfo) _then;

/// Create a copy of AccountTypeInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_AccountTypeInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
