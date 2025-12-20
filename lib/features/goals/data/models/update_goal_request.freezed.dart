// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_goal_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateGoalRequest {

 String? get name; String? get description; double? get targetAmount; DateTime? get targetDate; String? get color; String? get icon;
/// Create a copy of UpdateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateGoalRequestCopyWith<UpdateGoalRequest> get copyWith => _$UpdateGoalRequestCopyWithImpl<UpdateGoalRequest>(this as UpdateGoalRequest, _$identity);

  /// Serializes this UpdateGoalRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateGoalRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,targetAmount,targetDate,color,icon);

@override
String toString() {
  return 'UpdateGoalRequest(name: $name, description: $description, targetAmount: $targetAmount, targetDate: $targetDate, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $UpdateGoalRequestCopyWith<$Res>  {
  factory $UpdateGoalRequestCopyWith(UpdateGoalRequest value, $Res Function(UpdateGoalRequest) _then) = _$UpdateGoalRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? description, double? targetAmount, DateTime? targetDate, String? color, String? icon
});




}
/// @nodoc
class _$UpdateGoalRequestCopyWithImpl<$Res>
    implements $UpdateGoalRequestCopyWith<$Res> {
  _$UpdateGoalRequestCopyWithImpl(this._self, this._then);

  final UpdateGoalRequest _self;
  final $Res Function(UpdateGoalRequest) _then;

/// Create a copy of UpdateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? description = freezed,Object? targetAmount = freezed,Object? targetDate = freezed,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetAmount: freezed == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateGoalRequest].
extension UpdateGoalRequestPatterns on UpdateGoalRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateGoalRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateGoalRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateGoalRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateGoalRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateGoalRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateGoalRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? description,  double? targetAmount,  DateTime? targetDate,  String? color,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateGoalRequest() when $default != null:
return $default(_that.name,_that.description,_that.targetAmount,_that.targetDate,_that.color,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? description,  double? targetAmount,  DateTime? targetDate,  String? color,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _UpdateGoalRequest():
return $default(_that.name,_that.description,_that.targetAmount,_that.targetDate,_that.color,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? description,  double? targetAmount,  DateTime? targetDate,  String? color,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _UpdateGoalRequest() when $default != null:
return $default(_that.name,_that.description,_that.targetAmount,_that.targetDate,_that.color,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateGoalRequest implements UpdateGoalRequest {
  const _UpdateGoalRequest({this.name, this.description, this.targetAmount, this.targetDate, this.color, this.icon});
  factory _UpdateGoalRequest.fromJson(Map<String, dynamic> json) => _$UpdateGoalRequestFromJson(json);

@override final  String? name;
@override final  String? description;
@override final  double? targetAmount;
@override final  DateTime? targetDate;
@override final  String? color;
@override final  String? icon;

/// Create a copy of UpdateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateGoalRequestCopyWith<_UpdateGoalRequest> get copyWith => __$UpdateGoalRequestCopyWithImpl<_UpdateGoalRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateGoalRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateGoalRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,targetAmount,targetDate,color,icon);

@override
String toString() {
  return 'UpdateGoalRequest(name: $name, description: $description, targetAmount: $targetAmount, targetDate: $targetDate, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$UpdateGoalRequestCopyWith<$Res> implements $UpdateGoalRequestCopyWith<$Res> {
  factory _$UpdateGoalRequestCopyWith(_UpdateGoalRequest value, $Res Function(_UpdateGoalRequest) _then) = __$UpdateGoalRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? description, double? targetAmount, DateTime? targetDate, String? color, String? icon
});




}
/// @nodoc
class __$UpdateGoalRequestCopyWithImpl<$Res>
    implements _$UpdateGoalRequestCopyWith<$Res> {
  __$UpdateGoalRequestCopyWithImpl(this._self, this._then);

  final _UpdateGoalRequest _self;
  final $Res Function(_UpdateGoalRequest) _then;

/// Create a copy of UpdateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? description = freezed,Object? targetAmount = freezed,Object? targetDate = freezed,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_UpdateGoalRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetAmount: freezed == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
