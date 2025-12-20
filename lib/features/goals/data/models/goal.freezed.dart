// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Goal {

 String get id; String get name; String? get description; double get targetAmount; double get currentAmount; double get remaining; double get percentageComplete; DateTime get targetDate; String? get color; String? get icon; bool get isCompleted; String? get accountId; String? get accountName; String get currencyId; String get currencyCode; String get currencySymbol; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalCopyWith<Goal> get copyWith => _$GoalCopyWithImpl<Goal>(this as Goal, _$identity);

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.percentageComplete, percentageComplete) || other.percentageComplete == percentageComplete)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,targetAmount,currentAmount,remaining,percentageComplete,targetDate,color,icon,isCompleted,accountId,accountName,currencyId,currencyCode,currencySymbol,createdAt,updatedAt);

@override
String toString() {
  return 'Goal(id: $id, name: $name, description: $description, targetAmount: $targetAmount, currentAmount: $currentAmount, remaining: $remaining, percentageComplete: $percentageComplete, targetDate: $targetDate, color: $color, icon: $icon, isCompleted: $isCompleted, accountId: $accountId, accountName: $accountName, currencyId: $currencyId, currencyCode: $currencyCode, currencySymbol: $currencySymbol, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GoalCopyWith<$Res>  {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) _then) = _$GoalCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, double targetAmount, double currentAmount, double remaining, double percentageComplete, DateTime targetDate, String? color, String? icon, bool isCompleted, String? accountId, String? accountName, String currencyId, String currencyCode, String currencySymbol, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$GoalCopyWithImpl<$Res>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._self, this._then);

  final Goal _self;
  final $Res Function(Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? targetAmount = null,Object? currentAmount = null,Object? remaining = null,Object? percentageComplete = null,Object? targetDate = null,Object? color = freezed,Object? icon = freezed,Object? isCompleted = null,Object? accountId = freezed,Object? accountName = freezed,Object? currencyId = null,Object? currencyCode = null,Object? currencySymbol = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,percentageComplete: null == percentageComplete ? _self.percentageComplete : percentageComplete // ignore: cast_nullable_to_non_nullable
as double,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Goal].
extension GoalPatterns on Goal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Goal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Goal value)  $default,){
final _that = this;
switch (_that) {
case _Goal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Goal value)?  $default,){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double targetAmount,  double currentAmount,  double remaining,  double percentageComplete,  DateTime targetDate,  String? color,  String? icon,  bool isCompleted,  String? accountId,  String? accountName,  String currencyId,  String currencyCode,  String currencySymbol,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.targetAmount,_that.currentAmount,_that.remaining,_that.percentageComplete,_that.targetDate,_that.color,_that.icon,_that.isCompleted,_that.accountId,_that.accountName,_that.currencyId,_that.currencyCode,_that.currencySymbol,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  double targetAmount,  double currentAmount,  double remaining,  double percentageComplete,  DateTime targetDate,  String? color,  String? icon,  bool isCompleted,  String? accountId,  String? accountName,  String currencyId,  String currencyCode,  String currencySymbol,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Goal():
return $default(_that.id,_that.name,_that.description,_that.targetAmount,_that.currentAmount,_that.remaining,_that.percentageComplete,_that.targetDate,_that.color,_that.icon,_that.isCompleted,_that.accountId,_that.accountName,_that.currencyId,_that.currencyCode,_that.currencySymbol,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  double targetAmount,  double currentAmount,  double remaining,  double percentageComplete,  DateTime targetDate,  String? color,  String? icon,  bool isCompleted,  String? accountId,  String? accountName,  String currencyId,  String currencyCode,  String currencySymbol,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.targetAmount,_that.currentAmount,_that.remaining,_that.percentageComplete,_that.targetDate,_that.color,_that.icon,_that.isCompleted,_that.accountId,_that.accountName,_that.currencyId,_that.currencyCode,_that.currencySymbol,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Goal implements Goal {
  const _Goal({required this.id, required this.name, this.description, required this.targetAmount, required this.currentAmount, required this.remaining, required this.percentageComplete, required this.targetDate, this.color, this.icon, required this.isCompleted, this.accountId, this.accountName, required this.currencyId, required this.currencyCode, required this.currencySymbol, required this.createdAt, required this.updatedAt});
  factory _Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  double targetAmount;
@override final  double currentAmount;
@override final  double remaining;
@override final  double percentageComplete;
@override final  DateTime targetDate;
@override final  String? color;
@override final  String? icon;
@override final  bool isCompleted;
@override final  String? accountId;
@override final  String? accountName;
@override final  String currencyId;
@override final  String currencyCode;
@override final  String currencySymbol;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalCopyWith<_Goal> get copyWith => __$GoalCopyWithImpl<_Goal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.percentageComplete, percentageComplete) || other.percentageComplete == percentageComplete)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,targetAmount,currentAmount,remaining,percentageComplete,targetDate,color,icon,isCompleted,accountId,accountName,currencyId,currencyCode,currencySymbol,createdAt,updatedAt);

@override
String toString() {
  return 'Goal(id: $id, name: $name, description: $description, targetAmount: $targetAmount, currentAmount: $currentAmount, remaining: $remaining, percentageComplete: $percentageComplete, targetDate: $targetDate, color: $color, icon: $icon, isCompleted: $isCompleted, accountId: $accountId, accountName: $accountName, currencyId: $currencyId, currencyCode: $currencyCode, currencySymbol: $currencySymbol, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) _then) = __$GoalCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, double targetAmount, double currentAmount, double remaining, double percentageComplete, DateTime targetDate, String? color, String? icon, bool isCompleted, String? accountId, String? accountName, String currencyId, String currencyCode, String currencySymbol, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(this._self, this._then);

  final _Goal _self;
  final $Res Function(_Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? targetAmount = null,Object? currentAmount = null,Object? remaining = null,Object? percentageComplete = null,Object? targetDate = null,Object? color = freezed,Object? icon = freezed,Object? isCompleted = null,Object? accountId = freezed,Object? accountName = freezed,Object? currencyId = null,Object? currencyCode = null,Object? currencySymbol = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Goal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as double,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double,percentageComplete: null == percentageComplete ? _self.percentageComplete : percentageComplete // ignore: cast_nullable_to_non_nullable
as double,targetDate: null == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
