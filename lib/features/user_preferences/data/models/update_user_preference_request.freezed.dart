// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_preference_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateUserPreferenceRequest {

 String? get defaultCurrencyId; String? get language; String? get dateFormat; int? get firstDayOfWeek; String? get timezone; String? get theme; bool? get enableNotifications; bool? get enableBiometric; bool? get autoBackup;
/// Create a copy of UpdateUserPreferenceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserPreferenceRequestCopyWith<UpdateUserPreferenceRequest> get copyWith => _$UpdateUserPreferenceRequestCopyWithImpl<UpdateUserPreferenceRequest>(this as UpdateUserPreferenceRequest, _$identity);

  /// Serializes this UpdateUserPreferenceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserPreferenceRequest&&(identical(other.defaultCurrencyId, defaultCurrencyId) || other.defaultCurrencyId == defaultCurrencyId)&&(identical(other.language, language) || other.language == language)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.firstDayOfWeek, firstDayOfWeek) || other.firstDayOfWeek == firstDayOfWeek)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.enableNotifications, enableNotifications) || other.enableNotifications == enableNotifications)&&(identical(other.enableBiometric, enableBiometric) || other.enableBiometric == enableBiometric)&&(identical(other.autoBackup, autoBackup) || other.autoBackup == autoBackup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultCurrencyId,language,dateFormat,firstDayOfWeek,timezone,theme,enableNotifications,enableBiometric,autoBackup);

@override
String toString() {
  return 'UpdateUserPreferenceRequest(defaultCurrencyId: $defaultCurrencyId, language: $language, dateFormat: $dateFormat, firstDayOfWeek: $firstDayOfWeek, timezone: $timezone, theme: $theme, enableNotifications: $enableNotifications, enableBiometric: $enableBiometric, autoBackup: $autoBackup)';
}


}

/// @nodoc
abstract mixin class $UpdateUserPreferenceRequestCopyWith<$Res>  {
  factory $UpdateUserPreferenceRequestCopyWith(UpdateUserPreferenceRequest value, $Res Function(UpdateUserPreferenceRequest) _then) = _$UpdateUserPreferenceRequestCopyWithImpl;
@useResult
$Res call({
 String? defaultCurrencyId, String? language, String? dateFormat, int? firstDayOfWeek, String? timezone, String? theme, bool? enableNotifications, bool? enableBiometric, bool? autoBackup
});




}
/// @nodoc
class _$UpdateUserPreferenceRequestCopyWithImpl<$Res>
    implements $UpdateUserPreferenceRequestCopyWith<$Res> {
  _$UpdateUserPreferenceRequestCopyWithImpl(this._self, this._then);

  final UpdateUserPreferenceRequest _self;
  final $Res Function(UpdateUserPreferenceRequest) _then;

/// Create a copy of UpdateUserPreferenceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultCurrencyId = freezed,Object? language = freezed,Object? dateFormat = freezed,Object? firstDayOfWeek = freezed,Object? timezone = freezed,Object? theme = freezed,Object? enableNotifications = freezed,Object? enableBiometric = freezed,Object? autoBackup = freezed,}) {
  return _then(_self.copyWith(
defaultCurrencyId: freezed == defaultCurrencyId ? _self.defaultCurrencyId : defaultCurrencyId // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,dateFormat: freezed == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String?,firstDayOfWeek: freezed == firstDayOfWeek ? _self.firstDayOfWeek : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,enableNotifications: freezed == enableNotifications ? _self.enableNotifications : enableNotifications // ignore: cast_nullable_to_non_nullable
as bool?,enableBiometric: freezed == enableBiometric ? _self.enableBiometric : enableBiometric // ignore: cast_nullable_to_non_nullable
as bool?,autoBackup: freezed == autoBackup ? _self.autoBackup : autoBackup // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserPreferenceRequest].
extension UpdateUserPreferenceRequestPatterns on UpdateUserPreferenceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserPreferenceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserPreferenceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserPreferenceRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserPreferenceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserPreferenceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserPreferenceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? defaultCurrencyId,  String? language,  String? dateFormat,  int? firstDayOfWeek,  String? timezone,  String? theme,  bool? enableNotifications,  bool? enableBiometric,  bool? autoBackup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserPreferenceRequest() when $default != null:
return $default(_that.defaultCurrencyId,_that.language,_that.dateFormat,_that.firstDayOfWeek,_that.timezone,_that.theme,_that.enableNotifications,_that.enableBiometric,_that.autoBackup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? defaultCurrencyId,  String? language,  String? dateFormat,  int? firstDayOfWeek,  String? timezone,  String? theme,  bool? enableNotifications,  bool? enableBiometric,  bool? autoBackup)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserPreferenceRequest():
return $default(_that.defaultCurrencyId,_that.language,_that.dateFormat,_that.firstDayOfWeek,_that.timezone,_that.theme,_that.enableNotifications,_that.enableBiometric,_that.autoBackup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? defaultCurrencyId,  String? language,  String? dateFormat,  int? firstDayOfWeek,  String? timezone,  String? theme,  bool? enableNotifications,  bool? enableBiometric,  bool? autoBackup)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserPreferenceRequest() when $default != null:
return $default(_that.defaultCurrencyId,_that.language,_that.dateFormat,_that.firstDayOfWeek,_that.timezone,_that.theme,_that.enableNotifications,_that.enableBiometric,_that.autoBackup);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserPreferenceRequest implements UpdateUserPreferenceRequest {
  const _UpdateUserPreferenceRequest({this.defaultCurrencyId, this.language, this.dateFormat, this.firstDayOfWeek, this.timezone, this.theme, this.enableNotifications, this.enableBiometric, this.autoBackup});
  factory _UpdateUserPreferenceRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserPreferenceRequestFromJson(json);

@override final  String? defaultCurrencyId;
@override final  String? language;
@override final  String? dateFormat;
@override final  int? firstDayOfWeek;
@override final  String? timezone;
@override final  String? theme;
@override final  bool? enableNotifications;
@override final  bool? enableBiometric;
@override final  bool? autoBackup;

/// Create a copy of UpdateUserPreferenceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserPreferenceRequestCopyWith<_UpdateUserPreferenceRequest> get copyWith => __$UpdateUserPreferenceRequestCopyWithImpl<_UpdateUserPreferenceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserPreferenceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserPreferenceRequest&&(identical(other.defaultCurrencyId, defaultCurrencyId) || other.defaultCurrencyId == defaultCurrencyId)&&(identical(other.language, language) || other.language == language)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.firstDayOfWeek, firstDayOfWeek) || other.firstDayOfWeek == firstDayOfWeek)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.enableNotifications, enableNotifications) || other.enableNotifications == enableNotifications)&&(identical(other.enableBiometric, enableBiometric) || other.enableBiometric == enableBiometric)&&(identical(other.autoBackup, autoBackup) || other.autoBackup == autoBackup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultCurrencyId,language,dateFormat,firstDayOfWeek,timezone,theme,enableNotifications,enableBiometric,autoBackup);

@override
String toString() {
  return 'UpdateUserPreferenceRequest(defaultCurrencyId: $defaultCurrencyId, language: $language, dateFormat: $dateFormat, firstDayOfWeek: $firstDayOfWeek, timezone: $timezone, theme: $theme, enableNotifications: $enableNotifications, enableBiometric: $enableBiometric, autoBackup: $autoBackup)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserPreferenceRequestCopyWith<$Res> implements $UpdateUserPreferenceRequestCopyWith<$Res> {
  factory _$UpdateUserPreferenceRequestCopyWith(_UpdateUserPreferenceRequest value, $Res Function(_UpdateUserPreferenceRequest) _then) = __$UpdateUserPreferenceRequestCopyWithImpl;
@override @useResult
$Res call({
 String? defaultCurrencyId, String? language, String? dateFormat, int? firstDayOfWeek, String? timezone, String? theme, bool? enableNotifications, bool? enableBiometric, bool? autoBackup
});




}
/// @nodoc
class __$UpdateUserPreferenceRequestCopyWithImpl<$Res>
    implements _$UpdateUserPreferenceRequestCopyWith<$Res> {
  __$UpdateUserPreferenceRequestCopyWithImpl(this._self, this._then);

  final _UpdateUserPreferenceRequest _self;
  final $Res Function(_UpdateUserPreferenceRequest) _then;

/// Create a copy of UpdateUserPreferenceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultCurrencyId = freezed,Object? language = freezed,Object? dateFormat = freezed,Object? firstDayOfWeek = freezed,Object? timezone = freezed,Object? theme = freezed,Object? enableNotifications = freezed,Object? enableBiometric = freezed,Object? autoBackup = freezed,}) {
  return _then(_UpdateUserPreferenceRequest(
defaultCurrencyId: freezed == defaultCurrencyId ? _self.defaultCurrencyId : defaultCurrencyId // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,dateFormat: freezed == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String?,firstDayOfWeek: freezed == firstDayOfWeek ? _self.firstDayOfWeek : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
as int?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,enableNotifications: freezed == enableNotifications ? _self.enableNotifications : enableNotifications // ignore: cast_nullable_to_non_nullable
as bool?,enableBiometric: freezed == enableBiometric ? _self.enableBiometric : enableBiometric // ignore: cast_nullable_to_non_nullable
as bool?,autoBackup: freezed == autoBackup ? _self.autoBackup : autoBackup // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
