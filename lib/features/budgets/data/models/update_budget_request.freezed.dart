// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_budget_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBudgetRequest {

 String? get name; double? get amount; double? get alertThreshold;
/// Create a copy of UpdateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBudgetRequestCopyWith<UpdateBudgetRequest> get copyWith => _$UpdateBudgetRequestCopyWithImpl<UpdateBudgetRequest>(this as UpdateBudgetRequest, _$identity);

  /// Serializes this UpdateBudgetRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBudgetRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.alertThreshold, alertThreshold) || other.alertThreshold == alertThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,alertThreshold);

@override
String toString() {
  return 'UpdateBudgetRequest(name: $name, amount: $amount, alertThreshold: $alertThreshold)';
}


}

/// @nodoc
abstract mixin class $UpdateBudgetRequestCopyWith<$Res>  {
  factory $UpdateBudgetRequestCopyWith(UpdateBudgetRequest value, $Res Function(UpdateBudgetRequest) _then) = _$UpdateBudgetRequestCopyWithImpl;
@useResult
$Res call({
 String? name, double? amount, double? alertThreshold
});




}
/// @nodoc
class _$UpdateBudgetRequestCopyWithImpl<$Res>
    implements $UpdateBudgetRequestCopyWith<$Res> {
  _$UpdateBudgetRequestCopyWithImpl(this._self, this._then);

  final UpdateBudgetRequest _self;
  final $Res Function(UpdateBudgetRequest) _then;

/// Create a copy of UpdateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? amount = freezed,Object? alertThreshold = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,alertThreshold: freezed == alertThreshold ? _self.alertThreshold : alertThreshold // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateBudgetRequest].
extension UpdateBudgetRequestPatterns on UpdateBudgetRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateBudgetRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateBudgetRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateBudgetRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateBudgetRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateBudgetRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateBudgetRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  double? amount,  double? alertThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateBudgetRequest() when $default != null:
return $default(_that.name,_that.amount,_that.alertThreshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  double? amount,  double? alertThreshold)  $default,) {final _that = this;
switch (_that) {
case _UpdateBudgetRequest():
return $default(_that.name,_that.amount,_that.alertThreshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  double? amount,  double? alertThreshold)?  $default,) {final _that = this;
switch (_that) {
case _UpdateBudgetRequest() when $default != null:
return $default(_that.name,_that.amount,_that.alertThreshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateBudgetRequest implements UpdateBudgetRequest {
  const _UpdateBudgetRequest({this.name, this.amount, this.alertThreshold});
  factory _UpdateBudgetRequest.fromJson(Map<String, dynamic> json) => _$UpdateBudgetRequestFromJson(json);

@override final  String? name;
@override final  double? amount;
@override final  double? alertThreshold;

/// Create a copy of UpdateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBudgetRequestCopyWith<_UpdateBudgetRequest> get copyWith => __$UpdateBudgetRequestCopyWithImpl<_UpdateBudgetRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBudgetRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBudgetRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.alertThreshold, alertThreshold) || other.alertThreshold == alertThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,alertThreshold);

@override
String toString() {
  return 'UpdateBudgetRequest(name: $name, amount: $amount, alertThreshold: $alertThreshold)';
}


}

/// @nodoc
abstract mixin class _$UpdateBudgetRequestCopyWith<$Res> implements $UpdateBudgetRequestCopyWith<$Res> {
  factory _$UpdateBudgetRequestCopyWith(_UpdateBudgetRequest value, $Res Function(_UpdateBudgetRequest) _then) = __$UpdateBudgetRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, double? amount, double? alertThreshold
});




}
/// @nodoc
class __$UpdateBudgetRequestCopyWithImpl<$Res>
    implements _$UpdateBudgetRequestCopyWith<$Res> {
  __$UpdateBudgetRequestCopyWithImpl(this._self, this._then);

  final _UpdateBudgetRequest _self;
  final $Res Function(_UpdateBudgetRequest) _then;

/// Create a copy of UpdateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? amount = freezed,Object? alertThreshold = freezed,}) {
  return _then(_UpdateBudgetRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,alertThreshold: freezed == alertThreshold ? _self.alertThreshold : alertThreshold // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
