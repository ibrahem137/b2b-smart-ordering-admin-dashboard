// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_trend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesTrendItem {

 String get month; String get total; String get profit;
/// Create a copy of SalesTrendItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesTrendItemCopyWith<SalesTrendItem> get copyWith => _$SalesTrendItemCopyWithImpl<SalesTrendItem>(this as SalesTrendItem, _$identity);

  /// Serializes this SalesTrendItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesTrendItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesTrendItem&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.profit, _this.profit) || other.profit == _this.profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesTrendItem;
  return Object.hash(runtimeType,_this.month,_this.total,_this.profit);
}

@override
String toString() {
  final _this = this as SalesTrendItem;
  return 'SalesTrendItem(month: ${_this.month}, total: ${_this.total}, profit: ${_this.profit})';
}


}

/// @nodoc
abstract mixin class $SalesTrendItemCopyWith<$Res>  {
  factory $SalesTrendItemCopyWith(SalesTrendItem value, $Res Function(SalesTrendItem) _then) = _$SalesTrendItemCopyWithImpl;
@useResult
$Res call({
 String month, String total, String profit
});




}
/// @nodoc
class _$SalesTrendItemCopyWithImpl<$Res>
    implements $SalesTrendItemCopyWith<$Res> {
  _$SalesTrendItemCopyWithImpl(this._self, this._then);

  final SalesTrendItem _self;
  final $Res Function(SalesTrendItem) _then;

/// Create a copy of SalesTrendItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? total = null,Object? profit = null,}) {
  return _then(SalesTrendItem(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesTrendItem].
extension SalesTrendItemPatterns on SalesTrendItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesTrendItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesTrendItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesTrendItem value)  $default,){
final _that = this;
switch (_that) {
case _SalesTrendItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesTrendItem value)?  $default,){
final _that = this;
switch (_that) {
case _SalesTrendItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String month,  String total,  String profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesTrendItem() when $default != null:
return $default(_that.month,_that.total,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String month,  String total,  String profit)  $default,) {final _that = this;
switch (_that) {
case _SalesTrendItem():
return $default(_that.month,_that.total,_that.profit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String month,  String total,  String profit)?  $default,) {final _that = this;
switch (_that) {
case _SalesTrendItem() when $default != null:
return $default(_that.month,_that.total,_that.profit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesTrendItem implements SalesTrendItem {
  const _SalesTrendItem({required this.month, required this.total, required this.profit});
  factory _SalesTrendItem.fromJson(Map<String, dynamic> json) => _$SalesTrendItemFromJson(json);

@override final  String month;
@override final  String total;
@override final  String profit;

/// Create a copy of SalesTrendItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesTrendItemCopyWith<_SalesTrendItem> get copyWith => __$SalesTrendItemCopyWithImpl<_SalesTrendItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesTrendItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesTrendItem&&(identical(other.month, month) || other.month == month)&&(identical(other.total, total) || other.total == total)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,month,total,profit);
}

@override
String toString() {
    return 'SalesTrendItem(month: $month, total: $total, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$SalesTrendItemCopyWith<$Res> implements $SalesTrendItemCopyWith<$Res> {
  factory _$SalesTrendItemCopyWith(_SalesTrendItem value, $Res Function(_SalesTrendItem) _then) = __$SalesTrendItemCopyWithImpl;
@override @useResult
$Res call({
 String month, String total, String profit
});




}
/// @nodoc
class __$SalesTrendItemCopyWithImpl<$Res>
    implements _$SalesTrendItemCopyWith<$Res> {
  __$SalesTrendItemCopyWithImpl(this._self, this._then);

  final _SalesTrendItem _self;
  final $Res Function(_SalesTrendItem) _then;

/// Create a copy of SalesTrendItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? total = null,Object? profit = null,}) {
  return _then(_SalesTrendItem(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SalesTrendResponse {

 List<SalesTrendItem> get data; String? get message; dynamic get errors;
/// Create a copy of SalesTrendResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesTrendResponseCopyWith<SalesTrendResponse> get copyWith => _$SalesTrendResponseCopyWithImpl<SalesTrendResponse>(this as SalesTrendResponse, _$identity);

  /// Serializes this SalesTrendResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesTrendResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesTrendResponse&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesTrendResponse;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as SalesTrendResponse;
  return 'SalesTrendResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $SalesTrendResponseCopyWith<$Res>  {
  factory $SalesTrendResponseCopyWith(SalesTrendResponse value, $Res Function(SalesTrendResponse) _then) = _$SalesTrendResponseCopyWithImpl;
@useResult
$Res call({
 List<SalesTrendItem> data, String? message, dynamic errors
});




}
/// @nodoc
class _$SalesTrendResponseCopyWithImpl<$Res>
    implements $SalesTrendResponseCopyWith<$Res> {
  _$SalesTrendResponseCopyWithImpl(this._self, this._then);

  final SalesTrendResponse _self;
  final $Res Function(SalesTrendResponse) _then;

/// Create a copy of SalesTrendResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? message = freezed,Object? errors = freezed,}) {
  return _then(SalesTrendResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SalesTrendItem>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesTrendResponse].
extension SalesTrendResponsePatterns on SalesTrendResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesTrendResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesTrendResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesTrendResponse value)  $default,){
final _that = this;
switch (_that) {
case _SalesTrendResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesTrendResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SalesTrendResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SalesTrendItem> data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesTrendResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SalesTrendItem> data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _SalesTrendResponse():
return $default(_that.data,_that.message,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SalesTrendItem> data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _SalesTrendResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesTrendResponse implements SalesTrendResponse {
  const _SalesTrendResponse({ List<SalesTrendItem> data = const [], this.message, this.errors}): _data = data;
  factory _SalesTrendResponse.fromJson(Map<String, dynamic> json) => _$SalesTrendResponseFromJson(json);

 final  List<SalesTrendItem> _data;
@override@JsonKey() List<SalesTrendItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  String? message;
@override final  dynamic errors;

/// Create a copy of SalesTrendResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesTrendResponseCopyWith<_SalesTrendResponse> get copyWith => __$SalesTrendResponseCopyWithImpl<_SalesTrendResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesTrendResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesTrendResponse&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'SalesTrendResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SalesTrendResponseCopyWith<$Res> implements $SalesTrendResponseCopyWith<$Res> {
  factory _$SalesTrendResponseCopyWith(_SalesTrendResponse value, $Res Function(_SalesTrendResponse) _then) = __$SalesTrendResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SalesTrendItem> data, String? message, dynamic errors
});




}
/// @nodoc
class __$SalesTrendResponseCopyWithImpl<$Res>
    implements _$SalesTrendResponseCopyWith<$Res> {
  __$SalesTrendResponseCopyWithImpl(this._self, this._then);

  final _SalesTrendResponse _self;
  final $Res Function(_SalesTrendResponse) _then;

/// Create a copy of SalesTrendResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_SalesTrendResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SalesTrendItem>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
