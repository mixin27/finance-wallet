// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateCategoryRequest {

 String get name; String get type; String? get color; String? get icon; String? get parentCategoryId;
/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCategoryRequestCopyWith<CreateCategoryRequest> get copyWith => _$CreateCategoryRequestCopyWithImpl<CreateCategoryRequest>(this as CreateCategoryRequest, _$identity);

  /// Serializes this CreateCategoryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCategoryRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,color,icon,parentCategoryId);

@override
String toString() {
  return 'CreateCategoryRequest(name: $name, type: $type, color: $color, icon: $icon, parentCategoryId: $parentCategoryId)';
}


}

/// @nodoc
abstract mixin class $CreateCategoryRequestCopyWith<$Res>  {
  factory $CreateCategoryRequestCopyWith(CreateCategoryRequest value, $Res Function(CreateCategoryRequest) _then) = _$CreateCategoryRequestCopyWithImpl;
@useResult
$Res call({
 String name, String type, String? color, String? icon, String? parentCategoryId
});




}
/// @nodoc
class _$CreateCategoryRequestCopyWithImpl<$Res>
    implements $CreateCategoryRequestCopyWith<$Res> {
  _$CreateCategoryRequestCopyWithImpl(this._self, this._then);

  final CreateCategoryRequest _self;
  final $Res Function(CreateCategoryRequest) _then;

/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? color = freezed,Object? icon = freezed,Object? parentCategoryId = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,parentCategoryId: freezed == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCategoryRequest].
extension CreateCategoryRequestPatterns on CreateCategoryRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCategoryRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCategoryRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCategoryRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCategoryRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCategoryRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCategoryRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String type,  String? color,  String? icon,  String? parentCategoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCategoryRequest() when $default != null:
return $default(_that.name,_that.type,_that.color,_that.icon,_that.parentCategoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String type,  String? color,  String? icon,  String? parentCategoryId)  $default,) {final _that = this;
switch (_that) {
case _CreateCategoryRequest():
return $default(_that.name,_that.type,_that.color,_that.icon,_that.parentCategoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String type,  String? color,  String? icon,  String? parentCategoryId)?  $default,) {final _that = this;
switch (_that) {
case _CreateCategoryRequest() when $default != null:
return $default(_that.name,_that.type,_that.color,_that.icon,_that.parentCategoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCategoryRequest implements CreateCategoryRequest {
  const _CreateCategoryRequest({required this.name, required this.type, this.color, this.icon, this.parentCategoryId});
  factory _CreateCategoryRequest.fromJson(Map<String, dynamic> json) => _$CreateCategoryRequestFromJson(json);

@override final  String name;
@override final  String type;
@override final  String? color;
@override final  String? icon;
@override final  String? parentCategoryId;

/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCategoryRequestCopyWith<_CreateCategoryRequest> get copyWith => __$CreateCategoryRequestCopyWithImpl<_CreateCategoryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCategoryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCategoryRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,color,icon,parentCategoryId);

@override
String toString() {
  return 'CreateCategoryRequest(name: $name, type: $type, color: $color, icon: $icon, parentCategoryId: $parentCategoryId)';
}


}

/// @nodoc
abstract mixin class _$CreateCategoryRequestCopyWith<$Res> implements $CreateCategoryRequestCopyWith<$Res> {
  factory _$CreateCategoryRequestCopyWith(_CreateCategoryRequest value, $Res Function(_CreateCategoryRequest) _then) = __$CreateCategoryRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String type, String? color, String? icon, String? parentCategoryId
});




}
/// @nodoc
class __$CreateCategoryRequestCopyWithImpl<$Res>
    implements _$CreateCategoryRequestCopyWith<$Res> {
  __$CreateCategoryRequestCopyWithImpl(this._self, this._then);

  final _CreateCategoryRequest _self;
  final $Res Function(_CreateCategoryRequest) _then;

/// Create a copy of CreateCategoryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? color = freezed,Object? icon = freezed,Object? parentCategoryId = freezed,}) {
  return _then(_CreateCategoryRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,parentCategoryId: freezed == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
