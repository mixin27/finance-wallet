// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateAccountRequest {

 String? get name; String? get accountTypeId; String? get currencyId; String? get description; String? get color; String? get icon; bool? get isIncludedInTotal; bool? get isActive;
/// Create a copy of UpdateAccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountRequestCopyWith<UpdateAccountRequest> get copyWith => _$UpdateAccountRequestCopyWithImpl<UpdateAccountRequest>(this as UpdateAccountRequest, _$identity);

  /// Serializes this UpdateAccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.accountTypeId, accountTypeId) || other.accountTypeId == accountTypeId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isIncludedInTotal, isIncludedInTotal) || other.isIncludedInTotal == isIncludedInTotal)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,accountTypeId,currencyId,description,color,icon,isIncludedInTotal,isActive);

@override
String toString() {
  return 'UpdateAccountRequest(name: $name, accountTypeId: $accountTypeId, currencyId: $currencyId, description: $description, color: $color, icon: $icon, isIncludedInTotal: $isIncludedInTotal, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountRequestCopyWith<$Res>  {
  factory $UpdateAccountRequestCopyWith(UpdateAccountRequest value, $Res Function(UpdateAccountRequest) _then) = _$UpdateAccountRequestCopyWithImpl;
@useResult
$Res call({
 String? name, String? accountTypeId, String? currencyId, String? description, String? color, String? icon, bool? isIncludedInTotal, bool? isActive
});




}
/// @nodoc
class _$UpdateAccountRequestCopyWithImpl<$Res>
    implements $UpdateAccountRequestCopyWith<$Res> {
  _$UpdateAccountRequestCopyWithImpl(this._self, this._then);

  final UpdateAccountRequest _self;
  final $Res Function(UpdateAccountRequest) _then;

/// Create a copy of UpdateAccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? accountTypeId = freezed,Object? currencyId = freezed,Object? description = freezed,Object? color = freezed,Object? icon = freezed,Object? isIncludedInTotal = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,accountTypeId: freezed == accountTypeId ? _self.accountTypeId : accountTypeId // ignore: cast_nullable_to_non_nullable
as String?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isIncludedInTotal: freezed == isIncludedInTotal ? _self.isIncludedInTotal : isIncludedInTotal // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateAccountRequest].
extension UpdateAccountRequestPatterns on UpdateAccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAccountRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAccountRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAccountRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? accountTypeId,  String? currencyId,  String? description,  String? color,  String? icon,  bool? isIncludedInTotal,  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAccountRequest() when $default != null:
return $default(_that.name,_that.accountTypeId,_that.currencyId,_that.description,_that.color,_that.icon,_that.isIncludedInTotal,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? accountTypeId,  String? currencyId,  String? description,  String? color,  String? icon,  bool? isIncludedInTotal,  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _UpdateAccountRequest():
return $default(_that.name,_that.accountTypeId,_that.currencyId,_that.description,_that.color,_that.icon,_that.isIncludedInTotal,_that.isActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? accountTypeId,  String? currencyId,  String? description,  String? color,  String? icon,  bool? isIncludedInTotal,  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAccountRequest() when $default != null:
return $default(_that.name,_that.accountTypeId,_that.currencyId,_that.description,_that.color,_that.icon,_that.isIncludedInTotal,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAccountRequest implements UpdateAccountRequest {
  const _UpdateAccountRequest({this.name, this.accountTypeId, this.currencyId, this.description, this.color, this.icon, this.isIncludedInTotal, this.isActive});
  factory _UpdateAccountRequest.fromJson(Map<String, dynamic> json) => _$UpdateAccountRequestFromJson(json);

@override final  String? name;
@override final  String? accountTypeId;
@override final  String? currencyId;
@override final  String? description;
@override final  String? color;
@override final  String? icon;
@override final  bool? isIncludedInTotal;
@override final  bool? isActive;

/// Create a copy of UpdateAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAccountRequestCopyWith<_UpdateAccountRequest> get copyWith => __$UpdateAccountRequestCopyWithImpl<_UpdateAccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAccountRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.accountTypeId, accountTypeId) || other.accountTypeId == accountTypeId)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isIncludedInTotal, isIncludedInTotal) || other.isIncludedInTotal == isIncludedInTotal)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,accountTypeId,currencyId,description,color,icon,isIncludedInTotal,isActive);

@override
String toString() {
  return 'UpdateAccountRequest(name: $name, accountTypeId: $accountTypeId, currencyId: $currencyId, description: $description, color: $color, icon: $icon, isIncludedInTotal: $isIncludedInTotal, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UpdateAccountRequestCopyWith<$Res> implements $UpdateAccountRequestCopyWith<$Res> {
  factory _$UpdateAccountRequestCopyWith(_UpdateAccountRequest value, $Res Function(_UpdateAccountRequest) _then) = __$UpdateAccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? accountTypeId, String? currencyId, String? description, String? color, String? icon, bool? isIncludedInTotal, bool? isActive
});




}
/// @nodoc
class __$UpdateAccountRequestCopyWithImpl<$Res>
    implements _$UpdateAccountRequestCopyWith<$Res> {
  __$UpdateAccountRequestCopyWithImpl(this._self, this._then);

  final _UpdateAccountRequest _self;
  final $Res Function(_UpdateAccountRequest) _then;

/// Create a copy of UpdateAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? accountTypeId = freezed,Object? currencyId = freezed,Object? description = freezed,Object? color = freezed,Object? icon = freezed,Object? isIncludedInTotal = freezed,Object? isActive = freezed,}) {
  return _then(_UpdateAccountRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,accountTypeId: freezed == accountTypeId ? _self.accountTypeId : accountTypeId // ignore: cast_nullable_to_non_nullable
as String?,currencyId: freezed == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isIncludedInTotal: freezed == isIncludedInTotal ? _self.isIncludedInTotal : isIncludedInTotal // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
