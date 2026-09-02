// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdersPagination {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'data') List<OrderModel> get orders;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'per_page') int get perPage; int get total;
/// Create a copy of OrdersPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersPaginationCopyWith<OrdersPagination> get copyWith => _$OrdersPaginationCopyWithImpl<OrdersPagination>(this as OrdersPagination, _$identity);

  /// Serializes this OrdersPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrdersPagination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersPagination&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.orders, _this.orders)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrdersPagination;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.orders),_this.lastPage,_this.perPage,_this.total);
}

@override
String toString() {
  final _this = this as OrdersPagination;
  return 'OrdersPagination(currentPage: ${_this.currentPage}, orders: ${_this.orders}, lastPage: ${_this.lastPage}, perPage: ${_this.perPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $OrdersPaginationCopyWith<$Res>  {
  factory $OrdersPaginationCopyWith(OrdersPagination value, $Res Function(OrdersPagination) _then) = _$OrdersPaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<OrderModel> orders,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class _$OrdersPaginationCopyWithImpl<$Res>
    implements $OrdersPaginationCopyWith<$Res> {
  _$OrdersPaginationCopyWithImpl(this._self, this._then);

  final OrdersPagination _self;
  final $Res Function(OrdersPagination) _then;

/// Create a copy of OrdersPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? orders = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(OrdersPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersPagination].
extension OrdersPaginationPatterns on OrdersPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersPagination value)  $default,){
final _that = this;
switch (_that) {
case _OrdersPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersPagination value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<OrderModel> orders, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersPagination() when $default != null:
return $default(_that.currentPage,_that.orders,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<OrderModel> orders, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _OrdersPagination():
return $default(_that.currentPage,_that.orders,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<OrderModel> orders, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _OrdersPagination() when $default != null:
return $default(_that.currentPage,_that.orders,_that.lastPage,_that.perPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersPagination implements OrdersPagination {
  const _OrdersPagination({@JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'data') required  List<OrderModel> orders, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'per_page') required this.perPage, required this.total}): _orders = orders;
  factory _OrdersPagination.fromJson(Map<String, dynamic> json) => _$OrdersPaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<OrderModel> _orders;
@override@JsonKey(name: 'data') List<OrderModel> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int total;

/// Create a copy of OrdersPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersPaginationCopyWith<_OrdersPagination> get copyWith => __$OrdersPaginationCopyWithImpl<_OrdersPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersPagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.orders, _orders)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_orders),lastPage,perPage,total);
}

@override
String toString() {
    return 'OrdersPagination(currentPage: $currentPage, orders: $orders, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrdersPaginationCopyWith<$Res> implements $OrdersPaginationCopyWith<$Res> {
  factory _$OrdersPaginationCopyWith(_OrdersPagination value, $Res Function(_OrdersPagination) _then) = __$OrdersPaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<OrderModel> orders,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class __$OrdersPaginationCopyWithImpl<$Res>
    implements _$OrdersPaginationCopyWith<$Res> {
  __$OrdersPaginationCopyWithImpl(this._self, this._then);

  final _OrdersPagination _self;
  final $Res Function(_OrdersPagination) _then;

/// Create a copy of OrdersPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? orders = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_OrdersPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OrdersResponse {

 OrdersPagination? get data; String? get message; dynamic get errors;
/// Create a copy of OrdersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersResponseCopyWith<OrdersResponse> get copyWith => _$OrdersResponseCopyWithImpl<OrdersResponse>(this as OrdersResponse, _$identity);

  /// Serializes this OrdersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrdersResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrdersResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as OrdersResponse;
  return 'OrdersResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $OrdersResponseCopyWith<$Res>  {
  factory $OrdersResponseCopyWith(OrdersResponse value, $Res Function(OrdersResponse) _then) = _$OrdersResponseCopyWithImpl;
@useResult
$Res call({
 OrdersPagination? data, String? message, dynamic errors
});


$OrdersPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class _$OrdersResponseCopyWithImpl<$Res>
    implements $OrdersResponseCopyWith<$Res> {
  _$OrdersResponseCopyWithImpl(this._self, this._then);

  final OrdersResponse _self;
  final $Res Function(OrdersResponse) _then;

/// Create a copy of OrdersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(OrdersResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrdersPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of OrdersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrdersPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OrdersPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrdersResponse].
extension OrdersResponsePatterns on OrdersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersResponse value)  $default,){
final _that = this;
switch (_that) {
case _OrdersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrdersPagination? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrdersPagination? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _OrdersResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrdersPagination? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _OrdersResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersResponse implements OrdersResponse {
  const _OrdersResponse({this.data, this.message, this.errors});
  factory _OrdersResponse.fromJson(Map<String, dynamic> json) => _$OrdersResponseFromJson(json);

@override final  OrdersPagination? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of OrdersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersResponseCopyWith<_OrdersResponse> get copyWith => __$OrdersResponseCopyWithImpl<_OrdersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'OrdersResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$OrdersResponseCopyWith<$Res> implements $OrdersResponseCopyWith<$Res> {
  factory _$OrdersResponseCopyWith(_OrdersResponse value, $Res Function(_OrdersResponse) _then) = __$OrdersResponseCopyWithImpl;
@override @useResult
$Res call({
 OrdersPagination? data, String? message, dynamic errors
});


@override $OrdersPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class __$OrdersResponseCopyWithImpl<$Res>
    implements _$OrdersResponseCopyWith<$Res> {
  __$OrdersResponseCopyWithImpl(this._self, this._then);

  final _OrdersResponse _self;
  final $Res Function(_OrdersResponse) _then;

/// Create a copy of OrdersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_OrdersResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OrdersPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of OrdersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrdersPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OrdersPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
