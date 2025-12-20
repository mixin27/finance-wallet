// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_goal_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateGoalRequest {

 String get name; String? get description; double get targetAmount; double? get initialAmount; DateTime get targetDate; String get currencyId; String? get accountId; String? get color; String? get icon;
/// Create a copy of CreateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateGoalRequestCopyWith<CreateGoalRequest> get copyWith => _$CreateGoalRequestCopyWithImpl<CreateGoalRequest>(this as CreateGoalRequest, _$identity);

  /// Serializes this CreateGoalRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateGoalRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.initialAmount, initialAmount) || other.initialAmount == initialAmount)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,targetAmount,initialAmount,targetDate,currencyId,accountId,color,icon);

@override
String toString() {
  return 'CreateGoalRequest(name: $name, description: $description, targetAmount: $targetAmount, initialAmount: $initialAmount, targetDate: $targetDate, currencyId: $currencyId, accountId: $accountId, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $CreateGoalRequestCopyWith<$Res>  {
  factory $CreateGoalRequestCopyWith(CreateGoalRequest value, $Res Function(CreateGoalRequest) _then) = _$CreateGoalRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? description, double targetAmount, double? initialAmount, DateTime targetDate, String currencyId, String? accountId, String? color, String? icon
});




}
/// @nodoc
class _$CreateGoalRequestCopyWithImpl<$Res>
    implements $CreateGoalRequestCopyWith<$Res> {
  _$CreateGoalRequestCopyWithImpl(this._self, this._then);

  final CreateGoalRequest _self;
  final $Res Function(CreateGoalRequest) _then;

/// Create a copy of CreateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? targetAmount = null,Object? initialAmount = freezed,Object? targetDate = null,Object? currencyId = null,Object? accountId = freezed,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double,initialAmount: freezed == initialAmount ? _self.initialAmount : initialAmount // ignore: cast_nullable_to_non_nullable
as double?,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateGoalRequest].
extension CreateGoalRequestPatterns on CreateGoalRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateGoalRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateGoalRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateGoalRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateGoalRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateGoalRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateGoalRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  double targetAmount,  double? initialAmount,  DateTime targetDate,  String currencyId,  String? accountId,  String? color,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateGoalRequest() when $default != null:
return $default(_that.name,_that.description,_that.targetAmount,_that.initialAmount,_that.targetDate,_that.currencyId,_that.accountId,_that.color,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  double targetAmount,  double? initialAmount,  DateTime targetDate,  String currencyId,  String? accountId,  String? color,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _CreateGoalRequest():
return $default(_that.name,_that.description,_that.targetAmount,_that.initialAmount,_that.targetDate,_that.currencyId,_that.accountId,_that.color,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  double targetAmount,  double? initialAmount,  DateTime targetDate,  String currencyId,  String? accountId,  String? color,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _CreateGoalRequest() when $default != null:
return $default(_that.name,_that.description,_that.targetAmount,_that.initialAmount,_that.targetDate,_that.currencyId,_that.accountId,_that.color,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateGoalRequest implements CreateGoalRequest {
  const _CreateGoalRequest({required this.name, this.description, required this.targetAmount, this.initialAmount, required this.targetDate, required this.currencyId, this.accountId, this.color, this.icon});
  factory _CreateGoalRequest.fromJson(Map<String, dynamic> json) => _$CreateGoalRequestFromJson(json);

@override final  String name;
@override final  String? description;
@override final  double targetAmount;
@override final  double? initialAmount;
@override final  DateTime targetDate;
@override final  String currencyId;
@override final  String? accountId;
@override final  String? color;
@override final  String? icon;

/// Create a copy of CreateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateGoalRequestCopyWith<_CreateGoalRequest> get copyWith => __$CreateGoalRequestCopyWithImpl<_CreateGoalRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateGoalRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateGoalRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.initialAmount, initialAmount) || other.initialAmount == initialAmount)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,targetAmount,initialAmount,targetDate,currencyId,accountId,color,icon);

@override
String toString() {
  return 'CreateGoalRequest(name: $name, description: $description, targetAmount: $targetAmount, initialAmount: $initialAmount, targetDate: $targetDate, currencyId: $currencyId, accountId: $accountId, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CreateGoalRequestCopyWith<$Res> implements $CreateGoalRequestCopyWith<$Res> {
  factory _$CreateGoalRequestCopyWith(_CreateGoalRequest value, $Res Function(_CreateGoalRequest) _then) = __$CreateGoalRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, double targetAmount, double? initialAmount, DateTime targetDate, String currencyId, String? accountId, String? color, String? icon
});




}
/// @nodoc
class __$CreateGoalRequestCopyWithImpl<$Res>
    implements _$CreateGoalRequestCopyWith<$Res> {
  __$CreateGoalRequestCopyWithImpl(this._self, this._then);

  final _CreateGoalRequest _self;
  final $Res Function(_CreateGoalRequest) _then;

/// Create a copy of CreateGoalRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? targetAmount = null,Object? initialAmount = freezed,Object? targetDate = null,Object? currencyId = null,Object? accountId = freezed,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_CreateGoalRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double,initialAmount: freezed == initialAmount ? _self.initialAmount : initialAmount // ignore: cast_nullable_to_non_nullable
as double?,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
