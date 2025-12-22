// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preference_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPreferenceState {

 UserPreferenceEntity? get userPreference; bool get isLoading; bool get isUpdating; String? get errorMessage;
/// Create a copy of UserPreferenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferenceStateCopyWith<UserPreferenceState> get copyWith => _$UserPreferenceStateCopyWithImpl<UserPreferenceState>(this as UserPreferenceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferenceState&&(identical(other.userPreference, userPreference) || other.userPreference == userPreference)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,userPreference,isLoading,isUpdating,errorMessage);

@override
String toString() {
  return 'UserPreferenceState(userPreference: $userPreference, isLoading: $isLoading, isUpdating: $isUpdating, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UserPreferenceStateCopyWith<$Res>  {
  factory $UserPreferenceStateCopyWith(UserPreferenceState value, $Res Function(UserPreferenceState) _then) = _$UserPreferenceStateCopyWithImpl;
@useResult
$Res call({
 UserPreferenceEntity? userPreference, bool isLoading, bool isUpdating, String? errorMessage
});




}
/// @nodoc
class _$UserPreferenceStateCopyWithImpl<$Res>
    implements $UserPreferenceStateCopyWith<$Res> {
  _$UserPreferenceStateCopyWithImpl(this._self, this._then);

  final UserPreferenceState _self;
  final $Res Function(UserPreferenceState) _then;

/// Create a copy of UserPreferenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userPreference = freezed,Object? isLoading = null,Object? isUpdating = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
userPreference: freezed == userPreference ? _self.userPreference : userPreference // ignore: cast_nullable_to_non_nullable
as UserPreferenceEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferenceState].
extension UserPreferenceStatePatterns on UserPreferenceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferenceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferenceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferenceState value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferenceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferenceState value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferenceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserPreferenceEntity? userPreference,  bool isLoading,  bool isUpdating,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferenceState() when $default != null:
return $default(_that.userPreference,_that.isLoading,_that.isUpdating,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserPreferenceEntity? userPreference,  bool isLoading,  bool isUpdating,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _UserPreferenceState():
return $default(_that.userPreference,_that.isLoading,_that.isUpdating,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserPreferenceEntity? userPreference,  bool isLoading,  bool isUpdating,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferenceState() when $default != null:
return $default(_that.userPreference,_that.isLoading,_that.isUpdating,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _UserPreferenceState implements UserPreferenceState {
  const _UserPreferenceState({this.userPreference, this.isLoading = false, this.isUpdating = false, this.errorMessage});
  

@override final  UserPreferenceEntity? userPreference;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isUpdating;
@override final  String? errorMessage;

/// Create a copy of UserPreferenceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferenceStateCopyWith<_UserPreferenceState> get copyWith => __$UserPreferenceStateCopyWithImpl<_UserPreferenceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferenceState&&(identical(other.userPreference, userPreference) || other.userPreference == userPreference)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,userPreference,isLoading,isUpdating,errorMessage);

@override
String toString() {
  return 'UserPreferenceState(userPreference: $userPreference, isLoading: $isLoading, isUpdating: $isUpdating, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$UserPreferenceStateCopyWith<$Res> implements $UserPreferenceStateCopyWith<$Res> {
  factory _$UserPreferenceStateCopyWith(_UserPreferenceState value, $Res Function(_UserPreferenceState) _then) = __$UserPreferenceStateCopyWithImpl;
@override @useResult
$Res call({
 UserPreferenceEntity? userPreference, bool isLoading, bool isUpdating, String? errorMessage
});




}
/// @nodoc
class __$UserPreferenceStateCopyWithImpl<$Res>
    implements _$UserPreferenceStateCopyWith<$Res> {
  __$UserPreferenceStateCopyWithImpl(this._self, this._then);

  final _UserPreferenceState _self;
  final $Res Function(_UserPreferenceState) _then;

/// Create a copy of UserPreferenceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userPreference = freezed,Object? isLoading = null,Object? isUpdating = null,Object? errorMessage = freezed,}) {
  return _then(_UserPreferenceState(
userPreference: freezed == userPreference ? _self.userPreference : userPreference // ignore: cast_nullable_to_non_nullable
as UserPreferenceEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
