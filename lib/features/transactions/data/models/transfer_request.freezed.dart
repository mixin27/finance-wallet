// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransferRequest {

 String get fromAccountId; String get toAccountId; double get amount; double? get exchangeRate; DateTime get transactionDate; String get description; String? get note;
/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferRequestCopyWith<TransferRequest> get copyWith => _$TransferRequestCopyWithImpl<TransferRequest>(this as TransferRequest, _$identity);

  /// Serializes this TransferRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferRequest&&(identical(other.fromAccountId, fromAccountId) || other.fromAccountId == fromAccountId)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromAccountId,toAccountId,amount,exchangeRate,transactionDate,description,note);

@override
String toString() {
  return 'TransferRequest(fromAccountId: $fromAccountId, toAccountId: $toAccountId, amount: $amount, exchangeRate: $exchangeRate, transactionDate: $transactionDate, description: $description, note: $note)';
}


}

/// @nodoc
abstract mixin class $TransferRequestCopyWith<$Res>  {
  factory $TransferRequestCopyWith(TransferRequest value, $Res Function(TransferRequest) _then) = _$TransferRequestCopyWithImpl;
@useResult
$Res call({
 String fromAccountId, String toAccountId, double amount, double? exchangeRate, DateTime transactionDate, String description, String? note
});




}
/// @nodoc
class _$TransferRequestCopyWithImpl<$Res>
    implements $TransferRequestCopyWith<$Res> {
  _$TransferRequestCopyWithImpl(this._self, this._then);

  final TransferRequest _self;
  final $Res Function(TransferRequest) _then;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromAccountId = null,Object? toAccountId = null,Object? amount = null,Object? exchangeRate = freezed,Object? transactionDate = null,Object? description = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
fromAccountId: null == fromAccountId ? _self.fromAccountId : fromAccountId // ignore: cast_nullable_to_non_nullable
as String,toAccountId: null == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double?,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferRequest].
extension TransferRequestPatterns on TransferRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferRequest value)  $default,){
final _that = this;
switch (_that) {
case _TransferRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromAccountId,  String toAccountId,  double amount,  double? exchangeRate,  DateTime transactionDate,  String description,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
return $default(_that.fromAccountId,_that.toAccountId,_that.amount,_that.exchangeRate,_that.transactionDate,_that.description,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromAccountId,  String toAccountId,  double amount,  double? exchangeRate,  DateTime transactionDate,  String description,  String? note)  $default,) {final _that = this;
switch (_that) {
case _TransferRequest():
return $default(_that.fromAccountId,_that.toAccountId,_that.amount,_that.exchangeRate,_that.transactionDate,_that.description,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromAccountId,  String toAccountId,  double amount,  double? exchangeRate,  DateTime transactionDate,  String description,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _TransferRequest() when $default != null:
return $default(_that.fromAccountId,_that.toAccountId,_that.amount,_that.exchangeRate,_that.transactionDate,_that.description,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferRequest implements TransferRequest {
  const _TransferRequest({required this.fromAccountId, required this.toAccountId, required this.amount, this.exchangeRate, required this.transactionDate, required this.description, this.note});
  factory _TransferRequest.fromJson(Map<String, dynamic> json) => _$TransferRequestFromJson(json);

@override final  String fromAccountId;
@override final  String toAccountId;
@override final  double amount;
@override final  double? exchangeRate;
@override final  DateTime transactionDate;
@override final  String description;
@override final  String? note;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferRequestCopyWith<_TransferRequest> get copyWith => __$TransferRequestCopyWithImpl<_TransferRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferRequest&&(identical(other.fromAccountId, fromAccountId) || other.fromAccountId == fromAccountId)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.exchangeRate, exchangeRate) || other.exchangeRate == exchangeRate)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromAccountId,toAccountId,amount,exchangeRate,transactionDate,description,note);

@override
String toString() {
  return 'TransferRequest(fromAccountId: $fromAccountId, toAccountId: $toAccountId, amount: $amount, exchangeRate: $exchangeRate, transactionDate: $transactionDate, description: $description, note: $note)';
}


}

/// @nodoc
abstract mixin class _$TransferRequestCopyWith<$Res> implements $TransferRequestCopyWith<$Res> {
  factory _$TransferRequestCopyWith(_TransferRequest value, $Res Function(_TransferRequest) _then) = __$TransferRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromAccountId, String toAccountId, double amount, double? exchangeRate, DateTime transactionDate, String description, String? note
});




}
/// @nodoc
class __$TransferRequestCopyWithImpl<$Res>
    implements _$TransferRequestCopyWith<$Res> {
  __$TransferRequestCopyWithImpl(this._self, this._then);

  final _TransferRequest _self;
  final $Res Function(_TransferRequest) _then;

/// Create a copy of TransferRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromAccountId = null,Object? toAccountId = null,Object? amount = null,Object? exchangeRate = freezed,Object? transactionDate = null,Object? description = null,Object? note = freezed,}) {
  return _then(_TransferRequest(
fromAccountId: null == fromAccountId ? _self.fromAccountId : fromAccountId // ignore: cast_nullable_to_non_nullable
as String,toAccountId: null == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,exchangeRate: freezed == exchangeRate ? _self.exchangeRate : exchangeRate // ignore: cast_nullable_to_non_nullable
as double?,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
