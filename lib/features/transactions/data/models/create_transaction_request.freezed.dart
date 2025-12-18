// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTransactionRequest {

 String get accountId; String get type;// INCOME, EXPENSE
 double get amount; String? get categoryId; DateTime get transactionDate; String get description; String? get note; String? get payee; String? get location; double? get latitude; double? get longitude; List<String>? get tags;
/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionRequestCopyWith<CreateTransactionRequest> get copyWith => _$CreateTransactionRequestCopyWithImpl<CreateTransactionRequest>(this as CreateTransactionRequest, _$identity);

  /// Serializes this CreateTransactionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionRequest&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.payee, payee) || other.payee == payee)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,type,amount,categoryId,transactionDate,description,note,payee,location,latitude,longitude,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'CreateTransactionRequest(accountId: $accountId, type: $type, amount: $amount, categoryId: $categoryId, transactionDate: $transactionDate, description: $description, note: $note, payee: $payee, location: $location, latitude: $latitude, longitude: $longitude, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionRequestCopyWith<$Res>  {
  factory $CreateTransactionRequestCopyWith(CreateTransactionRequest value, $Res Function(CreateTransactionRequest) _then) = _$CreateTransactionRequestCopyWithImpl;
@useResult
$Res call({
 String accountId, String type, double amount, String? categoryId, DateTime transactionDate, String description, String? note, String? payee, String? location, double? latitude, double? longitude, List<String>? tags
});




}
/// @nodoc
class _$CreateTransactionRequestCopyWithImpl<$Res>
    implements $CreateTransactionRequestCopyWith<$Res> {
  _$CreateTransactionRequestCopyWithImpl(this._self, this._then);

  final CreateTransactionRequest _self;
  final $Res Function(CreateTransactionRequest) _then;

/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? type = null,Object? amount = null,Object? categoryId = freezed,Object? transactionDate = null,Object? description = null,Object? note = freezed,Object? payee = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? tags = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,payee: freezed == payee ? _self.payee : payee // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransactionRequest].
extension CreateTransactionRequestPatterns on CreateTransactionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId,  String type,  double amount,  String? categoryId,  DateTime transactionDate,  String description,  String? note,  String? payee,  String? location,  double? latitude,  double? longitude,  List<String>? tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionRequest() when $default != null:
return $default(_that.accountId,_that.type,_that.amount,_that.categoryId,_that.transactionDate,_that.description,_that.note,_that.payee,_that.location,_that.latitude,_that.longitude,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId,  String type,  double amount,  String? categoryId,  DateTime transactionDate,  String description,  String? note,  String? payee,  String? location,  double? latitude,  double? longitude,  List<String>? tags)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionRequest():
return $default(_that.accountId,_that.type,_that.amount,_that.categoryId,_that.transactionDate,_that.description,_that.note,_that.payee,_that.location,_that.latitude,_that.longitude,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId,  String type,  double amount,  String? categoryId,  DateTime transactionDate,  String description,  String? note,  String? payee,  String? location,  double? latitude,  double? longitude,  List<String>? tags)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionRequest() when $default != null:
return $default(_that.accountId,_that.type,_that.amount,_that.categoryId,_that.transactionDate,_that.description,_that.note,_that.payee,_that.location,_that.latitude,_that.longitude,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTransactionRequest implements CreateTransactionRequest {
  const _CreateTransactionRequest({required this.accountId, required this.type, required this.amount, this.categoryId, required this.transactionDate, required this.description, this.note, this.payee, this.location, this.latitude, this.longitude, final  List<String>? tags}): _tags = tags;
  factory _CreateTransactionRequest.fromJson(Map<String, dynamic> json) => _$CreateTransactionRequestFromJson(json);

@override final  String accountId;
@override final  String type;
// INCOME, EXPENSE
@override final  double amount;
@override final  String? categoryId;
@override final  DateTime transactionDate;
@override final  String description;
@override final  String? note;
@override final  String? payee;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionRequestCopyWith<_CreateTransactionRequest> get copyWith => __$CreateTransactionRequestCopyWithImpl<_CreateTransactionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTransactionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionRequest&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note)&&(identical(other.payee, payee) || other.payee == payee)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,type,amount,categoryId,transactionDate,description,note,payee,location,latitude,longitude,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'CreateTransactionRequest(accountId: $accountId, type: $type, amount: $amount, categoryId: $categoryId, transactionDate: $transactionDate, description: $description, note: $note, payee: $payee, location: $location, latitude: $latitude, longitude: $longitude, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionRequestCopyWith<$Res> implements $CreateTransactionRequestCopyWith<$Res> {
  factory _$CreateTransactionRequestCopyWith(_CreateTransactionRequest value, $Res Function(_CreateTransactionRequest) _then) = __$CreateTransactionRequestCopyWithImpl;
@override @useResult
$Res call({
 String accountId, String type, double amount, String? categoryId, DateTime transactionDate, String description, String? note, String? payee, String? location, double? latitude, double? longitude, List<String>? tags
});




}
/// @nodoc
class __$CreateTransactionRequestCopyWithImpl<$Res>
    implements _$CreateTransactionRequestCopyWith<$Res> {
  __$CreateTransactionRequestCopyWithImpl(this._self, this._then);

  final _CreateTransactionRequest _self;
  final $Res Function(_CreateTransactionRequest) _then;

/// Create a copy of CreateTransactionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? type = null,Object? amount = null,Object? categoryId = freezed,Object? transactionDate = null,Object? description = null,Object? note = freezed,Object? payee = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? tags = freezed,}) {
  return _then(_CreateTransactionRequest(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,payee: freezed == payee ? _self.payee : payee // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
