// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detailed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryDetailed {

 String get id; String get name; String get type; String? get color; String? get icon; int get displayOrder; bool get isSystem; bool get isActive; String? get parentCategoryId; String? get parentCategoryName; List<CategoryDetailed> get subCategories; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of CategoryDetailed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDetailedCopyWith<CategoryDetailed> get copyWith => _$CategoryDetailedCopyWithImpl<CategoryDetailed>(this as CategoryDetailed, _$identity);

  /// Serializes this CategoryDetailed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDetailed&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId)&&(identical(other.parentCategoryName, parentCategoryName) || other.parentCategoryName == parentCategoryName)&&const DeepCollectionEquality().equals(other.subCategories, subCategories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,color,icon,displayOrder,isSystem,isActive,parentCategoryId,parentCategoryName,const DeepCollectionEquality().hash(subCategories),createdAt,updatedAt);

@override
String toString() {
  return 'CategoryDetailed(id: $id, name: $name, type: $type, color: $color, icon: $icon, displayOrder: $displayOrder, isSystem: $isSystem, isActive: $isActive, parentCategoryId: $parentCategoryId, parentCategoryName: $parentCategoryName, subCategories: $subCategories, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryDetailedCopyWith<$Res>  {
  factory $CategoryDetailedCopyWith(CategoryDetailed value, $Res Function(CategoryDetailed) _then) = _$CategoryDetailedCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, String? color, String? icon, int displayOrder, bool isSystem, bool isActive, String? parentCategoryId, String? parentCategoryName, List<CategoryDetailed> subCategories, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$CategoryDetailedCopyWithImpl<$Res>
    implements $CategoryDetailedCopyWith<$Res> {
  _$CategoryDetailedCopyWithImpl(this._self, this._then);

  final CategoryDetailed _self;
  final $Res Function(CategoryDetailed) _then;

/// Create a copy of CategoryDetailed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? color = freezed,Object? icon = freezed,Object? displayOrder = null,Object? isSystem = null,Object? isActive = null,Object? parentCategoryId = freezed,Object? parentCategoryName = freezed,Object? subCategories = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,parentCategoryId: freezed == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,parentCategoryName: freezed == parentCategoryName ? _self.parentCategoryName : parentCategoryName // ignore: cast_nullable_to_non_nullable
as String?,subCategories: null == subCategories ? _self.subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryDetailed>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryDetailed].
extension CategoryDetailedPatterns on CategoryDetailed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDetailed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDetailed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDetailed value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDetailed value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String? color,  String? icon,  int displayOrder,  bool isSystem,  bool isActive,  String? parentCategoryId,  String? parentCategoryName,  List<CategoryDetailed> subCategories,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDetailed() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.color,_that.icon,_that.displayOrder,_that.isSystem,_that.isActive,_that.parentCategoryId,_that.parentCategoryName,_that.subCategories,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String? color,  String? icon,  int displayOrder,  bool isSystem,  bool isActive,  String? parentCategoryId,  String? parentCategoryName,  List<CategoryDetailed> subCategories,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailed():
return $default(_that.id,_that.name,_that.type,_that.color,_that.icon,_that.displayOrder,_that.isSystem,_that.isActive,_that.parentCategoryId,_that.parentCategoryName,_that.subCategories,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  String? color,  String? icon,  int displayOrder,  bool isSystem,  bool isActive,  String? parentCategoryId,  String? parentCategoryName,  List<CategoryDetailed> subCategories,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailed() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.color,_that.icon,_that.displayOrder,_that.isSystem,_that.isActive,_that.parentCategoryId,_that.parentCategoryName,_that.subCategories,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryDetailed implements CategoryDetailed {
  const _CategoryDetailed({required this.id, required this.name, required this.type, this.color, this.icon, required this.displayOrder, required this.isSystem, required this.isActive, this.parentCategoryId, this.parentCategoryName, required final  List<CategoryDetailed> subCategories, required this.createdAt, required this.updatedAt}): _subCategories = subCategories;
  factory _CategoryDetailed.fromJson(Map<String, dynamic> json) => _$CategoryDetailedFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  String? color;
@override final  String? icon;
@override final  int displayOrder;
@override final  bool isSystem;
@override final  bool isActive;
@override final  String? parentCategoryId;
@override final  String? parentCategoryName;
 final  List<CategoryDetailed> _subCategories;
@override List<CategoryDetailed> get subCategories {
  if (_subCategories is EqualUnmodifiableListView) return _subCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subCategories);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of CategoryDetailed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDetailedCopyWith<_CategoryDetailed> get copyWith => __$CategoryDetailedCopyWithImpl<_CategoryDetailed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDetailedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDetailed&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId)&&(identical(other.parentCategoryName, parentCategoryName) || other.parentCategoryName == parentCategoryName)&&const DeepCollectionEquality().equals(other._subCategories, _subCategories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,color,icon,displayOrder,isSystem,isActive,parentCategoryId,parentCategoryName,const DeepCollectionEquality().hash(_subCategories),createdAt,updatedAt);

@override
String toString() {
  return 'CategoryDetailed(id: $id, name: $name, type: $type, color: $color, icon: $icon, displayOrder: $displayOrder, isSystem: $isSystem, isActive: $isActive, parentCategoryId: $parentCategoryId, parentCategoryName: $parentCategoryName, subCategories: $subCategories, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryDetailedCopyWith<$Res> implements $CategoryDetailedCopyWith<$Res> {
  factory _$CategoryDetailedCopyWith(_CategoryDetailed value, $Res Function(_CategoryDetailed) _then) = __$CategoryDetailedCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, String? color, String? icon, int displayOrder, bool isSystem, bool isActive, String? parentCategoryId, String? parentCategoryName, List<CategoryDetailed> subCategories, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$CategoryDetailedCopyWithImpl<$Res>
    implements _$CategoryDetailedCopyWith<$Res> {
  __$CategoryDetailedCopyWithImpl(this._self, this._then);

  final _CategoryDetailed _self;
  final $Res Function(_CategoryDetailed) _then;

/// Create a copy of CategoryDetailed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? color = freezed,Object? icon = freezed,Object? displayOrder = null,Object? isSystem = null,Object? isActive = null,Object? parentCategoryId = freezed,Object? parentCategoryName = freezed,Object? subCategories = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CategoryDetailed(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,parentCategoryId: freezed == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,parentCategoryName: freezed == parentCategoryName ? _self.parentCategoryName : parentCategoryName // ignore: cast_nullable_to_non_nullable
as String?,subCategories: null == subCategories ? _self._subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as List<CategoryDetailed>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
