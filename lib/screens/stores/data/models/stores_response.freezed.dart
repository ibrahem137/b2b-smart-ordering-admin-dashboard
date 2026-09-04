// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stores_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoresPagination {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'data') List<StoreModel> get stores;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'per_page') int get perPage; int get total;
/// Create a copy of StoresPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoresPaginationCopyWith<StoresPagination> get copyWith => _$StoresPaginationCopyWithImpl<StoresPagination>(this as StoresPagination, _$identity);

  /// Serializes this StoresPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoresPagination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresPagination&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.stores, _this.stores)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoresPagination;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.stores),_this.lastPage,_this.perPage,_this.total);
}

@override
String toString() {
  final _this = this as StoresPagination;
  return 'StoresPagination(currentPage: ${_this.currentPage}, stores: ${_this.stores}, lastPage: ${_this.lastPage}, perPage: ${_this.perPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $StoresPaginationCopyWith<$Res>  {
  factory $StoresPaginationCopyWith(StoresPagination value, $Res Function(StoresPagination) _then) = _$StoresPaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<StoreModel> stores,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class _$StoresPaginationCopyWithImpl<$Res>
    implements $StoresPaginationCopyWith<$Res> {
  _$StoresPaginationCopyWithImpl(this._self, this._then);

  final StoresPagination _self;
  final $Res Function(StoresPagination) _then;

/// Create a copy of StoresPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? stores = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(StoresPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StoresPagination].
extension StoresPaginationPatterns on StoresPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoresPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoresPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoresPagination value)  $default,){
final _that = this;
switch (_that) {
case _StoresPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoresPagination value)?  $default,){
final _that = this;
switch (_that) {
case _StoresPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<StoreModel> stores, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoresPagination() when $default != null:
return $default(_that.currentPage,_that.stores,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<StoreModel> stores, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _StoresPagination():
return $default(_that.currentPage,_that.stores,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<StoreModel> stores, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _StoresPagination() when $default != null:
return $default(_that.currentPage,_that.stores,_that.lastPage,_that.perPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoresPagination implements StoresPagination {
  const _StoresPagination({@JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'data') required  List<StoreModel> stores, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'per_page') required this.perPage, required this.total}): _stores = stores;
  factory _StoresPagination.fromJson(Map<String, dynamic> json) => _$StoresPaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<StoreModel> _stores;
@override@JsonKey(name: 'data') List<StoreModel> get stores {
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stores);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int total;

/// Create a copy of StoresPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoresPaginationCopyWith<_StoresPagination> get copyWith => __$StoresPaginationCopyWithImpl<_StoresPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoresPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoresPagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.stores, _stores)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_stores),lastPage,perPage,total);
}

@override
String toString() {
    return 'StoresPagination(currentPage: $currentPage, stores: $stores, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$StoresPaginationCopyWith<$Res> implements $StoresPaginationCopyWith<$Res> {
  factory _$StoresPaginationCopyWith(_StoresPagination value, $Res Function(_StoresPagination) _then) = __$StoresPaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<StoreModel> stores,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class __$StoresPaginationCopyWithImpl<$Res>
    implements _$StoresPaginationCopyWith<$Res> {
  __$StoresPaginationCopyWithImpl(this._self, this._then);

  final _StoresPagination _self;
  final $Res Function(_StoresPagination) _then;

/// Create a copy of StoresPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? stores = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_StoresPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,stores: null == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StoresResponse {

 StoresPagination get data; String? get message;
/// Create a copy of StoresResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoresResponseCopyWith<StoresResponse> get copyWith => _$StoresResponseCopyWithImpl<StoresResponse>(this as StoresResponse, _$identity);

  /// Serializes this StoresResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoresResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoresResponse;
  return Object.hash(runtimeType,_this.data,_this.message);
}

@override
String toString() {
  final _this = this as StoresResponse;
  return 'StoresResponse(data: ${_this.data}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $StoresResponseCopyWith<$Res>  {
  factory $StoresResponseCopyWith(StoresResponse value, $Res Function(StoresResponse) _then) = _$StoresResponseCopyWithImpl;
@useResult
$Res call({
 StoresPagination data, String? message
});


$StoresPaginationCopyWith<$Res> get data;

}
/// @nodoc
class _$StoresResponseCopyWithImpl<$Res>
    implements $StoresResponseCopyWith<$Res> {
  _$StoresResponseCopyWithImpl(this._self, this._then);

  final StoresResponse _self;
  final $Res Function(StoresResponse) _then;

/// Create a copy of StoresResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? message = freezed,}) {
  return _then(StoresResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StoresPagination,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StoresResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoresPaginationCopyWith<$Res> get data {
  
  return $StoresPaginationCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoresResponse].
extension StoresResponsePatterns on StoresResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoresResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoresResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoresResponse value)  $default,){
final _that = this;
switch (_that) {
case _StoresResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoresResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StoresResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoresPagination data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoresResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoresPagination data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _StoresResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoresPagination data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _StoresResponse() when $default != null:
return $default(_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoresResponse implements StoresResponse {
  const _StoresResponse({required this.data, this.message});
  factory _StoresResponse.fromJson(Map<String, dynamic> json) => _$StoresResponseFromJson(json);

@override final  StoresPagination data;
@override final  String? message;

/// Create a copy of StoresResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoresResponseCopyWith<_StoresResponse> get copyWith => __$StoresResponseCopyWithImpl<_StoresResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoresResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoresResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message);
}

@override
String toString() {
    return 'StoresResponse(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$StoresResponseCopyWith<$Res> implements $StoresResponseCopyWith<$Res> {
  factory _$StoresResponseCopyWith(_StoresResponse value, $Res Function(_StoresResponse) _then) = __$StoresResponseCopyWithImpl;
@override @useResult
$Res call({
 StoresPagination data, String? message
});


@override $StoresPaginationCopyWith<$Res> get data;

}
/// @nodoc
class __$StoresResponseCopyWithImpl<$Res>
    implements _$StoresResponseCopyWith<$Res> {
  __$StoresResponseCopyWithImpl(this._self, this._then);

  final _StoresResponse _self;
  final $Res Function(_StoresResponse) _then;

/// Create a copy of StoresResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? message = freezed,}) {
  return _then(_StoresResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StoresPagination,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StoresResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoresPaginationCopyWith<$Res> get data {
  
  return $StoresPaginationCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
