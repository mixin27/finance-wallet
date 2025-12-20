// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_progress_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProgressRequest {

 double get amount;
/// Create a copy of UpdateProgressRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProgressRequestCopyWith<UpdateProgressRequest> get copyWith => _$UpdateProgressRequestCopyWithImpl<UpdateProgressRequest>(this as UpdateProgressRequest, _$identity);

  /// Serializes this UpdateProgressRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProgressRequest&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'UpdateProgressRequest(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $UpdateProgressRequestCopyWith<$Res>  {
  factory $UpdateProgressRequestCopyWith(UpdateProgressRequest value, $Res Function(UpdateProgressRequest) _then) = _$UpdateProgressRequestCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class _$UpdateProgressRequestCopyWithImpl<$Res>
    implements $UpdateProgressRequestCopyWith<$Res> {
  _$UpdateProgressRequestCopyWithImpl(this._self, this._then);

  final UpdateProgressRequest _self;
  final $Res Function(UpdateProgressRequest) _then;

/// Create a copy of UpdateProgressRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProgressRequest].
extension UpdateProgressRequestPatterns on UpdateProgressRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProgressRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProgressRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProgressRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProgressRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProgressRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProgressRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProgressRequest() when $default != null:
return $default(_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount)  $default,) {final _that = this;
switch (_that) {
case _UpdateProgressRequest():
return $default(_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProgressRequest() when $default != null:
return $default(_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProgressRequest implements UpdateProgressRequest {
  const _UpdateProgressRequest({required this.amount});
  factory _UpdateProgressRequest.fromJson(Map<String, dynamic> json) => _$UpdateProgressRequestFromJson(json);

@override final  double amount;

/// Create a copy of UpdateProgressRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProgressRequestCopyWith<_UpdateProgressRequest> get copyWith => __$UpdateProgressRequestCopyWithImpl<_UpdateProgressRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProgressRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProgressRequest&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'UpdateProgressRequest(amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$UpdateProgressRequestCopyWith<$Res> implements $UpdateProgressRequestCopyWith<$Res> {
  factory _$UpdateProgressRequestCopyWith(_UpdateProgressRequest value, $Res Function(_UpdateProgressRequest) _then) = __$UpdateProgressRequestCopyWithImpl;
@override @useResult
$Res call({
 double amount
});




}
/// @nodoc
class __$UpdateProgressRequestCopyWithImpl<$Res>
    implements _$UpdateProgressRequestCopyWith<$Res> {
  __$UpdateProgressRequestCopyWithImpl(this._self, this._then);

  final _UpdateProgressRequest _self;
  final $Res Function(_UpdateProgressRequest) _then;

/// Create a copy of UpdateProgressRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(_UpdateProgressRequest(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
