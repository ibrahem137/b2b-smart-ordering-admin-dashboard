// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierProductsPagination {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'data') List<SupplierProductModel> get supplierProducts;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'per_page') int get perPage; int get total;
/// Create a copy of SupplierProductsPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierProductsPaginationCopyWith<SupplierProductsPagination> get copyWith => _$SupplierProductsPaginationCopyWithImpl<SupplierProductsPagination>(this as SupplierProductsPagination, _$identity);

  /// Serializes this SupplierProductsPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplierProductsPagination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierProductsPagination&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.supplierProducts, _this.supplierProducts)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplierProductsPagination;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.supplierProducts),_this.lastPage,_this.perPage,_this.total);
}

@override
String toString() {
  final _this = this as SupplierProductsPagination;
  return 'SupplierProductsPagination(currentPage: ${_this.currentPage}, supplierProducts: ${_this.supplierProducts}, lastPage: ${_this.lastPage}, perPage: ${_this.perPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $SupplierProductsPaginationCopyWith<$Res>  {
  factory $SupplierProductsPaginationCopyWith(SupplierProductsPagination value, $Res Function(SupplierProductsPagination) _then) = _$SupplierProductsPaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SupplierProductModel> supplierProducts,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class _$SupplierProductsPaginationCopyWithImpl<$Res>
    implements $SupplierProductsPaginationCopyWith<$Res> {
  _$SupplierProductsPaginationCopyWithImpl(this._self, this._then);

  final SupplierProductsPagination _self;
  final $Res Function(SupplierProductsPagination) _then;

/// Create a copy of SupplierProductsPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? supplierProducts = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(SupplierProductsPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,supplierProducts: null == supplierProducts ? _self.supplierProducts : supplierProducts // ignore: cast_nullable_to_non_nullable
as List<SupplierProductModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierProductsPagination].
extension SupplierProductsPaginationPatterns on SupplierProductsPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierProductsPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierProductsPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierProductsPagination value)  $default,){
final _that = this;
switch (_that) {
case _SupplierProductsPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierProductsPagination value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierProductsPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierProductModel> supplierProducts, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierProductsPagination() when $default != null:
return $default(_that.currentPage,_that.supplierProducts,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierProductModel> supplierProducts, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _SupplierProductsPagination():
return $default(_that.currentPage,_that.supplierProducts,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierProductModel> supplierProducts, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _SupplierProductsPagination() when $default != null:
return $default(_that.currentPage,_that.supplierProducts,_that.lastPage,_that.perPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierProductsPagination implements SupplierProductsPagination {
  const _SupplierProductsPagination({@JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'data') required  List<SupplierProductModel> supplierProducts, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'per_page') required this.perPage, required this.total}): _supplierProducts = supplierProducts;
  factory _SupplierProductsPagination.fromJson(Map<String, dynamic> json) => _$SupplierProductsPaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<SupplierProductModel> _supplierProducts;
@override@JsonKey(name: 'data') List<SupplierProductModel> get supplierProducts {
  if (_supplierProducts is EqualUnmodifiableListView) return _supplierProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supplierProducts);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int total;

/// Create a copy of SupplierProductsPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierProductsPaginationCopyWith<_SupplierProductsPagination> get copyWith => __$SupplierProductsPaginationCopyWithImpl<_SupplierProductsPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierProductsPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierProductsPagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.supplierProducts, _supplierProducts)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_supplierProducts),lastPage,perPage,total);
}

@override
String toString() {
    return 'SupplierProductsPagination(currentPage: $currentPage, supplierProducts: $supplierProducts, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SupplierProductsPaginationCopyWith<$Res> implements $SupplierProductsPaginationCopyWith<$Res> {
  factory _$SupplierProductsPaginationCopyWith(_SupplierProductsPagination value, $Res Function(_SupplierProductsPagination) _then) = __$SupplierProductsPaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SupplierProductModel> supplierProducts,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class __$SupplierProductsPaginationCopyWithImpl<$Res>
    implements _$SupplierProductsPaginationCopyWith<$Res> {
  __$SupplierProductsPaginationCopyWithImpl(this._self, this._then);

  final _SupplierProductsPagination _self;
  final $Res Function(_SupplierProductsPagination) _then;

/// Create a copy of SupplierProductsPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? supplierProducts = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_SupplierProductsPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,supplierProducts: null == supplierProducts ? _self._supplierProducts : supplierProducts // ignore: cast_nullable_to_non_nullable
as List<SupplierProductModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SupplierProductsResponse {

 SupplierProductsPagination? get data; String? get message; dynamic get errors;
/// Create a copy of SupplierProductsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierProductsResponseCopyWith<SupplierProductsResponse> get copyWith => _$SupplierProductsResponseCopyWithImpl<SupplierProductsResponse>(this as SupplierProductsResponse, _$identity);

  /// Serializes this SupplierProductsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplierProductsResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierProductsResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplierProductsResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as SupplierProductsResponse;
  return 'SupplierProductsResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $SupplierProductsResponseCopyWith<$Res>  {
  factory $SupplierProductsResponseCopyWith(SupplierProductsResponse value, $Res Function(SupplierProductsResponse) _then) = _$SupplierProductsResponseCopyWithImpl;
@useResult
$Res call({
 SupplierProductsPagination? data, String? message, dynamic errors
});


$SupplierProductsPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class _$SupplierProductsResponseCopyWithImpl<$Res>
    implements $SupplierProductsResponseCopyWith<$Res> {
  _$SupplierProductsResponseCopyWithImpl(this._self, this._then);

  final SupplierProductsResponse _self;
  final $Res Function(SupplierProductsResponse) _then;

/// Create a copy of SupplierProductsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(SupplierProductsResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SupplierProductsPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of SupplierProductsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierProductsPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SupplierProductsPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupplierProductsResponse].
extension SupplierProductsResponsePatterns on SupplierProductsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierProductsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierProductsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierProductsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SupplierProductsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierProductsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierProductsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SupplierProductsPagination? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierProductsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SupplierProductsPagination? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _SupplierProductsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SupplierProductsPagination? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _SupplierProductsResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierProductsResponse implements SupplierProductsResponse {
  const _SupplierProductsResponse({this.data, this.message, this.errors});
  factory _SupplierProductsResponse.fromJson(Map<String, dynamic> json) => _$SupplierProductsResponseFromJson(json);

@override final  SupplierProductsPagination? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of SupplierProductsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierProductsResponseCopyWith<_SupplierProductsResponse> get copyWith => __$SupplierProductsResponseCopyWithImpl<_SupplierProductsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierProductsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierProductsResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'SupplierProductsResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SupplierProductsResponseCopyWith<$Res> implements $SupplierProductsResponseCopyWith<$Res> {
  factory _$SupplierProductsResponseCopyWith(_SupplierProductsResponse value, $Res Function(_SupplierProductsResponse) _then) = __$SupplierProductsResponseCopyWithImpl;
@override @useResult
$Res call({
 SupplierProductsPagination? data, String? message, dynamic errors
});


@override $SupplierProductsPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class __$SupplierProductsResponseCopyWithImpl<$Res>
    implements _$SupplierProductsResponseCopyWith<$Res> {
  __$SupplierProductsResponseCopyWithImpl(this._self, this._then);

  final _SupplierProductsResponse _self;
  final $Res Function(_SupplierProductsResponse) _then;

/// Create a copy of SupplierProductsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_SupplierProductsResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SupplierProductsPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of SupplierProductsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierProductsPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SupplierProductsPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
