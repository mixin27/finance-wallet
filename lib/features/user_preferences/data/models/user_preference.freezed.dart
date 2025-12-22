// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreference {

 String get userId; String get defaultCurrencyId; String get defaultCurrencyCode; String get defaultCurrencySymbol; String get language; String get dateFormat; int get firstDayOfWeek; String get timezone; String get theme; bool get enableNotifications; bool get enableBiometric; bool get autoBackup;@TimestampConverter() DateTime get createdAt;@TimestampConverter() DateTime get updatedAt;
/// Create a copy of UserPreference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferenceCopyWith<UserPreference> get copyWith => _$UserPreferenceCopyWithImpl<UserPreference>(this as UserPreference, _$identity);

  /// Serializes this UserPreference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreference&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.defaultCurrencyId, defaultCurrencyId) || other.defaultCurrencyId == defaultCurrencyId)&&(identical(other.defaultCurrencyCode, defaultCurrencyCode) || other.defaultCurrencyCode == defaultCurrencyCode)&&(identical(other.defaultCurrencySymbol, defaultCurrencySymbol) || other.defaultCurrencySymbol == defaultCurrencySymbol)&&(identical(other.language, language) || other.language == language)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.firstDayOfWeek, firstDayOfWeek) || other.firstDayOfWeek == firstDayOfWeek)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.enableNotifications, enableNotifications) || other.enableNotifications == enableNotifications)&&(identical(other.enableBiometric, enableBiometric) || other.enableBiometric == enableBiometric)&&(identical(other.autoBackup, autoBackup) || other.autoBackup == autoBackup)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,defaultCurrencyId,defaultCurrencyCode,defaultCurrencySymbol,language,dateFormat,firstDayOfWeek,timezone,theme,enableNotifications,enableBiometric,autoBackup,createdAt,updatedAt);

@override
String toString() {
  return 'UserPreference(userId: $userId, defaultCurrencyId: $defaultCurrencyId, defaultCurrencyCode: $defaultCurrencyCode, defaultCurrencySymbol: $defaultCurrencySymbol, language: $language, dateFormat: $dateFormat, firstDayOfWeek: $firstDayOfWeek, timezone: $timezone, theme: $theme, enableNotifications: $enableNotifications, enableBiometric: $enableBiometric, autoBackup: $autoBackup, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserPreferenceCopyWith<$Res>  {
  factory $UserPreferenceCopyWith(UserPreference value, $Res Function(UserPreference) _then) = _$UserPreferenceCopyWithImpl;
@useResult
$Res call({
 String userId, String defaultCurrencyId, String defaultCurrencyCode, String defaultCurrencySymbol, String language, String dateFormat, int firstDayOfWeek, String timezone, String theme, bool enableNotifications, bool enableBiometric, bool autoBackup,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class _$UserPreferenceCopyWithImpl<$Res>
    implements $UserPreferenceCopyWith<$Res> {
  _$UserPreferenceCopyWithImpl(this._self, this._then);

  final UserPreference _self;
  final $Res Function(UserPreference) _then;

/// Create a copy of UserPreference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? defaultCurrencyId = null,Object? defaultCurrencyCode = null,Object? defaultCurrencySymbol = null,Object? language = null,Object? dateFormat = null,Object? firstDayOfWeek = null,Object? timezone = null,Object? theme = null,Object? enableNotifications = null,Object? enableBiometric = null,Object? autoBackup = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,defaultCurrencyId: null == defaultCurrencyId ? _self.defaultCurrencyId : defaultCurrencyId // ignore: cast_nullable_to_non_nullable
as String,defaultCurrencyCode: null == defaultCurrencyCode ? _self.defaultCurrencyCode : defaultCurrencyCode // ignore: cast_nullable_to_non_nullable
as String,defaultCurrencySymbol: null == defaultCurrencySymbol ? _self.defaultCurrencySymbol : defaultCurrencySymbol // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,dateFormat: null == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String,firstDayOfWeek: null == firstDayOfWeek ? _self.firstDayOfWeek : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,enableNotifications: null == enableNotifications ? _self.enableNotifications : enableNotifications // ignore: cast_nullable_to_non_nullable
as bool,enableBiometric: null == enableBiometric ? _self.enableBiometric : enableBiometric // ignore: cast_nullable_to_non_nullable
as bool,autoBackup: null == autoBackup ? _self.autoBackup : autoBackup // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreference].
extension UserPreferencePatterns on UserPreference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreference value)  $default,){
final _that = this;
switch (_that) {
case _UserPreference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreference value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String defaultCurrencyId,  String defaultCurrencyCode,  String defaultCurrencySymbol,  String language,  String dateFormat,  int firstDayOfWeek,  String timezone,  String theme,  bool enableNotifications,  bool enableBiometric,  bool autoBackup, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreference() when $default != null:
return $default(_that.userId,_that.defaultCurrencyId,_that.defaultCurrencyCode,_that.defaultCurrencySymbol,_that.language,_that.dateFormat,_that.firstDayOfWeek,_that.timezone,_that.theme,_that.enableNotifications,_that.enableBiometric,_that.autoBackup,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String defaultCurrencyId,  String defaultCurrencyCode,  String defaultCurrencySymbol,  String language,  String dateFormat,  int firstDayOfWeek,  String timezone,  String theme,  bool enableNotifications,  bool enableBiometric,  bool autoBackup, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserPreference():
return $default(_that.userId,_that.defaultCurrencyId,_that.defaultCurrencyCode,_that.defaultCurrencySymbol,_that.language,_that.dateFormat,_that.firstDayOfWeek,_that.timezone,_that.theme,_that.enableNotifications,_that.enableBiometric,_that.autoBackup,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String defaultCurrencyId,  String defaultCurrencyCode,  String defaultCurrencySymbol,  String language,  String dateFormat,  int firstDayOfWeek,  String timezone,  String theme,  bool enableNotifications,  bool enableBiometric,  bool autoBackup, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserPreference() when $default != null:
return $default(_that.userId,_that.defaultCurrencyId,_that.defaultCurrencyCode,_that.defaultCurrencySymbol,_that.language,_that.dateFormat,_that.firstDayOfWeek,_that.timezone,_that.theme,_that.enableNotifications,_that.enableBiometric,_that.autoBackup,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPreference extends UserPreference {
  const _UserPreference({required this.userId, required this.defaultCurrencyId, required this.defaultCurrencyCode, required this.defaultCurrencySymbol, required this.language, required this.dateFormat, required this.firstDayOfWeek, required this.timezone, required this.theme, required this.enableNotifications, required this.enableBiometric, required this.autoBackup, @TimestampConverter() required this.createdAt, @TimestampConverter() required this.updatedAt}): super._();
  factory _UserPreference.fromJson(Map<String, dynamic> json) => _$UserPreferenceFromJson(json);

@override final  String userId;
@override final  String defaultCurrencyId;
@override final  String defaultCurrencyCode;
@override final  String defaultCurrencySymbol;
@override final  String language;
@override final  String dateFormat;
@override final  int firstDayOfWeek;
@override final  String timezone;
@override final  String theme;
@override final  bool enableNotifications;
@override final  bool enableBiometric;
@override final  bool autoBackup;
@override@TimestampConverter() final  DateTime createdAt;
@override@TimestampConverter() final  DateTime updatedAt;

/// Create a copy of UserPreference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferenceCopyWith<_UserPreference> get copyWith => __$UserPreferenceCopyWithImpl<_UserPreference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPreferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreference&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.defaultCurrencyId, defaultCurrencyId) || other.defaultCurrencyId == defaultCurrencyId)&&(identical(other.defaultCurrencyCode, defaultCurrencyCode) || other.defaultCurrencyCode == defaultCurrencyCode)&&(identical(other.defaultCurrencySymbol, defaultCurrencySymbol) || other.defaultCurrencySymbol == defaultCurrencySymbol)&&(identical(other.language, language) || other.language == language)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.firstDayOfWeek, firstDayOfWeek) || other.firstDayOfWeek == firstDayOfWeek)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.enableNotifications, enableNotifications) || other.enableNotifications == enableNotifications)&&(identical(other.enableBiometric, enableBiometric) || other.enableBiometric == enableBiometric)&&(identical(other.autoBackup, autoBackup) || other.autoBackup == autoBackup)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,defaultCurrencyId,defaultCurrencyCode,defaultCurrencySymbol,language,dateFormat,firstDayOfWeek,timezone,theme,enableNotifications,enableBiometric,autoBackup,createdAt,updatedAt);

@override
String toString() {
  return 'UserPreference(userId: $userId, defaultCurrencyId: $defaultCurrencyId, defaultCurrencyCode: $defaultCurrencyCode, defaultCurrencySymbol: $defaultCurrencySymbol, language: $language, dateFormat: $dateFormat, firstDayOfWeek: $firstDayOfWeek, timezone: $timezone, theme: $theme, enableNotifications: $enableNotifications, enableBiometric: $enableBiometric, autoBackup: $autoBackup, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserPreferenceCopyWith<$Res> implements $UserPreferenceCopyWith<$Res> {
  factory _$UserPreferenceCopyWith(_UserPreference value, $Res Function(_UserPreference) _then) = __$UserPreferenceCopyWithImpl;
@override @useResult
$Res call({
 String userId, String defaultCurrencyId, String defaultCurrencyCode, String defaultCurrencySymbol, String language, String dateFormat, int firstDayOfWeek, String timezone, String theme, bool enableNotifications, bool enableBiometric, bool autoBackup,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class __$UserPreferenceCopyWithImpl<$Res>
    implements _$UserPreferenceCopyWith<$Res> {
  __$UserPreferenceCopyWithImpl(this._self, this._then);

  final _UserPreference _self;
  final $Res Function(_UserPreference) _then;

/// Create a copy of UserPreference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? defaultCurrencyId = null,Object? defaultCurrencyCode = null,Object? defaultCurrencySymbol = null,Object? language = null,Object? dateFormat = null,Object? firstDayOfWeek = null,Object? timezone = null,Object? theme = null,Object? enableNotifications = null,Object? enableBiometric = null,Object? autoBackup = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserPreference(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,defaultCurrencyId: null == defaultCurrencyId ? _self.defaultCurrencyId : defaultCurrencyId // ignore: cast_nullable_to_non_nullable
as String,defaultCurrencyCode: null == defaultCurrencyCode ? _self.defaultCurrencyCode : defaultCurrencyCode // ignore: cast_nullable_to_non_nullable
as String,defaultCurrencySymbol: null == defaultCurrencySymbol ? _self.defaultCurrencySymbol : defaultCurrencySymbol // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,dateFormat: null == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String,firstDayOfWeek: null == firstDayOfWeek ? _self.firstDayOfWeek : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,enableNotifications: null == enableNotifications ? _self.enableNotifications : enableNotifications // ignore: cast_nullable_to_non_nullable
as bool,enableBiometric: null == enableBiometric ? _self.enableBiometric : enableBiometric // ignore: cast_nullable_to_non_nullable
as bool,autoBackup: null == autoBackup ? _self.autoBackup : autoBackup // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
