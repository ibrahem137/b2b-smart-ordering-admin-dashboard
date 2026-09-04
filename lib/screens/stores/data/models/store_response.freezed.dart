// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreResponse {

 StoreModel get data; String? get message;
/// Create a copy of StoreResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreResponseCopyWith<StoreResponse> get copyWith => _$StoreResponseCopyWithImpl<StoreResponse>(this as StoreResponse, _$identity);

  /// Serializes this StoreResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoreResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoreResponse;
  return Object.hash(runtimeType,_this.data,_this.message);
}

@override
String toString() {
  final _this = this as StoreResponse;
  return 'StoreResponse(data: ${_this.data}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $StoreResponseCopyWith<$Res>  {
  factory $StoreResponseCopyWith(StoreResponse value, $Res Function(StoreResponse) _then) = _$StoreResponseCopyWithImpl;
@useResult
$Res call({
 StoreModel data, String? message
});


$StoreModelCopyWith<$Res> get data;

}
/// @nodoc
class _$StoreResponseCopyWithImpl<$Res>
    implements $StoreResponseCopyWith<$Res> {
  _$StoreResponseCopyWithImpl(this._self, this._then);

  final StoreResponse _self;
  final $Res Function(StoreResponse) _then;

/// Create a copy of StoreResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? message = freezed,}) {
  return _then(StoreResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StoreModel,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StoreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreModelCopyWith<$Res> get data {
  
  return $StoreModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreResponse].
extension StoreResponsePatterns on StoreResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreResponse value)  $default,){
final _that = this;
switch (_that) {
case _StoreResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StoreResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreModel data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreResponse() when $default != null:
return $default(_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreModel data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _StoreResponse():
return $default(_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreModel data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _StoreResponse() when $default != null:
return $default(_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreResponse implements StoreResponse {
  const _StoreResponse({required this.data, this.message});
  factory _StoreResponse.fromJson(Map<String, dynamic> json) => _$StoreResponseFromJson(json);

@override final  StoreModel data;
@override final  String? message;

/// Create a copy of StoreResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreResponseCopyWith<_StoreResponse> get copyWith => __$StoreResponseCopyWithImpl<_StoreResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message);
}

@override
String toString() {
    return 'StoreResponse(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$StoreResponseCopyWith<$Res> implements $StoreResponseCopyWith<$Res> {
  factory _$StoreResponseCopyWith(_StoreResponse value, $Res Function(_StoreResponse) _then) = __$StoreResponseCopyWithImpl;
@override @useResult
$Res call({
 StoreModel data, String? message
});


@override $StoreModelCopyWith<$Res> get data;

}
/// @nodoc
class __$StoreResponseCopyWithImpl<$Res>
    implements _$StoreResponseCopyWith<$Res> {
  __$StoreResponseCopyWithImpl(this._self, this._then);

  final _StoreResponse _self;
  final $Res Function(_StoreResponse) _then;

/// Create a copy of StoreResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? message = freezed,}) {
  return _then(_StoreResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StoreModel,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StoreResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreModelCopyWith<$Res> get data {
  
  return $StoreModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
