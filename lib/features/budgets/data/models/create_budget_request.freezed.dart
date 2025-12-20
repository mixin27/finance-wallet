// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_budget_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateBudgetRequest {

 String get name; double get amount; String get period; DateTime get startDate; DateTime? get endDate; String get currencyId; String? get categoryId; double? get alertThreshold;
/// Create a copy of CreateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateBudgetRequestCopyWith<CreateBudgetRequest> get copyWith => _$CreateBudgetRequestCopyWithImpl<CreateBudgetRequest>(this as CreateBudgetRequest, _$identity);

  /// Serializes this CreateBudgetRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBudgetRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.period, period) || other.period == period)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.alertThreshold, alertThreshold) || other.alertThreshold == alertThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,period,startDate,endDate,currencyId,categoryId,alertThreshold);

@override
String toString() {
  return 'CreateBudgetRequest(name: $name, amount: $amount, period: $period, startDate: $startDate, endDate: $endDate, currencyId: $currencyId, categoryId: $categoryId, alertThreshold: $alertThreshold)';
}


}

/// @nodoc
abstract mixin class $CreateBudgetRequestCopyWith<$Res>  {
  factory $CreateBudgetRequestCopyWith(CreateBudgetRequest value, $Res Function(CreateBudgetRequest) _then) = _$CreateBudgetRequestCopyWithImpl;
@useResult
$Res call({
 String name, double amount, String period, DateTime startDate, DateTime? endDate, String currencyId, String? categoryId, double? alertThreshold
});




}
/// @nodoc
class _$CreateBudgetRequestCopyWithImpl<$Res>
    implements $CreateBudgetRequestCopyWith<$Res> {
  _$CreateBudgetRequestCopyWithImpl(this._self, this._then);

  final CreateBudgetRequest _self;
  final $Res Function(CreateBudgetRequest) _then;

/// Create a copy of CreateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? amount = null,Object? period = null,Object? startDate = null,Object? endDate = freezed,Object? currencyId = null,Object? categoryId = freezed,Object? alertThreshold = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,alertThreshold: freezed == alertThreshold ? _self.alertThreshold : alertThreshold // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateBudgetRequest].
extension CreateBudgetRequestPatterns on CreateBudgetRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateBudgetRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateBudgetRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateBudgetRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateBudgetRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateBudgetRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateBudgetRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double amount,  String period,  DateTime startDate,  DateTime? endDate,  String currencyId,  String? categoryId,  double? alertThreshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateBudgetRequest() when $default != null:
return $default(_that.name,_that.amount,_that.period,_that.startDate,_that.endDate,_that.currencyId,_that.categoryId,_that.alertThreshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double amount,  String period,  DateTime startDate,  DateTime? endDate,  String currencyId,  String? categoryId,  double? alertThreshold)  $default,) {final _that = this;
switch (_that) {
case _CreateBudgetRequest():
return $default(_that.name,_that.amount,_that.period,_that.startDate,_that.endDate,_that.currencyId,_that.categoryId,_that.alertThreshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double amount,  String period,  DateTime startDate,  DateTime? endDate,  String currencyId,  String? categoryId,  double? alertThreshold)?  $default,) {final _that = this;
switch (_that) {
case _CreateBudgetRequest() when $default != null:
return $default(_that.name,_that.amount,_that.period,_that.startDate,_that.endDate,_that.currencyId,_that.categoryId,_that.alertThreshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateBudgetRequest implements CreateBudgetRequest {
  const _CreateBudgetRequest({required this.name, required this.amount, required this.period, required this.startDate, this.endDate, required this.currencyId, this.categoryId, this.alertThreshold});
  factory _CreateBudgetRequest.fromJson(Map<String, dynamic> json) => _$CreateBudgetRequestFromJson(json);

@override final  String name;
@override final  double amount;
@override final  String period;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  String currencyId;
@override final  String? categoryId;
@override final  double? alertThreshold;

/// Create a copy of CreateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateBudgetRequestCopyWith<_CreateBudgetRequest> get copyWith => __$CreateBudgetRequestCopyWithImpl<_CreateBudgetRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateBudgetRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateBudgetRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.period, period) || other.period == period)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.currencyId, currencyId) || other.currencyId == currencyId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.alertThreshold, alertThreshold) || other.alertThreshold == alertThreshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,period,startDate,endDate,currencyId,categoryId,alertThreshold);

@override
String toString() {
  return 'CreateBudgetRequest(name: $name, amount: $amount, period: $period, startDate: $startDate, endDate: $endDate, currencyId: $currencyId, categoryId: $categoryId, alertThreshold: $alertThreshold)';
}


}

/// @nodoc
abstract mixin class _$CreateBudgetRequestCopyWith<$Res> implements $CreateBudgetRequestCopyWith<$Res> {
  factory _$CreateBudgetRequestCopyWith(_CreateBudgetRequest value, $Res Function(_CreateBudgetRequest) _then) = __$CreateBudgetRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, double amount, String period, DateTime startDate, DateTime? endDate, String currencyId, String? categoryId, double? alertThreshold
});




}
/// @nodoc
class __$CreateBudgetRequestCopyWithImpl<$Res>
    implements _$CreateBudgetRequestCopyWith<$Res> {
  __$CreateBudgetRequestCopyWithImpl(this._self, this._then);

  final _CreateBudgetRequest _self;
  final $Res Function(_CreateBudgetRequest) _then;

/// Create a copy of CreateBudgetRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? amount = null,Object? period = null,Object? startDate = null,Object? endDate = freezed,Object? currencyId = null,Object? categoryId = freezed,Object? alertThreshold = freezed,}) {
  return _then(_CreateBudgetRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,currencyId: null == currencyId ? _self.currencyId : currencyId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,alertThreshold: freezed == alertThreshold ? _self.alertThreshold : alertThreshold // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
