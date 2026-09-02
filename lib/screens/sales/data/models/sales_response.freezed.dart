// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesPagination {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'data') List<SaleModel> get sales;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'per_page') int get perPage; int get total;
/// Create a copy of SalesPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesPaginationCopyWith<SalesPagination> get copyWith => _$SalesPaginationCopyWithImpl<SalesPagination>(this as SalesPagination, _$identity);

  /// Serializes this SalesPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesPagination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesPagination&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.sales, _this.sales)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesPagination;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.sales),_this.lastPage,_this.perPage,_this.total);
}

@override
String toString() {
  final _this = this as SalesPagination;
  return 'SalesPagination(currentPage: ${_this.currentPage}, sales: ${_this.sales}, lastPage: ${_this.lastPage}, perPage: ${_this.perPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $SalesPaginationCopyWith<$Res>  {
  factory $SalesPaginationCopyWith(SalesPagination value, $Res Function(SalesPagination) _then) = _$SalesPaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SaleModel> sales,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class _$SalesPaginationCopyWithImpl<$Res>
    implements $SalesPaginationCopyWith<$Res> {
  _$SalesPaginationCopyWithImpl(this._self, this._then);

  final SalesPagination _self;
  final $Res Function(SalesPagination) _then;

/// Create a copy of SalesPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? sales = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(SalesPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as List<SaleModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesPagination].
extension SalesPaginationPatterns on SalesPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesPagination value)  $default,){
final _that = this;
switch (_that) {
case _SalesPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesPagination value)?  $default,){
final _that = this;
switch (_that) {
case _SalesPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SaleModel> sales, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesPagination() when $default != null:
return $default(_that.currentPage,_that.sales,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SaleModel> sales, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _SalesPagination():
return $default(_that.currentPage,_that.sales,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SaleModel> sales, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _SalesPagination() when $default != null:
return $default(_that.currentPage,_that.sales,_that.lastPage,_that.perPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesPagination implements SalesPagination {
  const _SalesPagination({@JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'data') required  List<SaleModel> sales, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'per_page') required this.perPage, required this.total}): _sales = sales;
  factory _SalesPagination.fromJson(Map<String, dynamic> json) => _$SalesPaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<SaleModel> _sales;
@override@JsonKey(name: 'data') List<SaleModel> get sales {
  if (_sales is EqualUnmodifiableListView) return _sales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sales);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int total;

/// Create a copy of SalesPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesPaginationCopyWith<_SalesPagination> get copyWith => __$SalesPaginationCopyWithImpl<_SalesPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesPagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.sales, _sales)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_sales),lastPage,perPage,total);
}

@override
String toString() {
    return 'SalesPagination(currentPage: $currentPage, sales: $sales, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SalesPaginationCopyWith<$Res> implements $SalesPaginationCopyWith<$Res> {
  factory _$SalesPaginationCopyWith(_SalesPagination value, $Res Function(_SalesPagination) _then) = __$SalesPaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SaleModel> sales,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class __$SalesPaginationCopyWithImpl<$Res>
    implements _$SalesPaginationCopyWith<$Res> {
  __$SalesPaginationCopyWithImpl(this._self, this._then);

  final _SalesPagination _self;
  final $Res Function(_SalesPagination) _then;

/// Create a copy of SalesPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? sales = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_SalesPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,sales: null == sales ? _self._sales : sales // ignore: cast_nullable_to_non_nullable
as List<SaleModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SalesResponse {

 SalesPagination? get data; String? get message; dynamic get errors;
/// Create a copy of SalesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesResponseCopyWith<SalesResponse> get copyWith => _$SalesResponseCopyWithImpl<SalesResponse>(this as SalesResponse, _$identity);

  /// Serializes this SalesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as SalesResponse;
  return 'SalesResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $SalesResponseCopyWith<$Res>  {
  factory $SalesResponseCopyWith(SalesResponse value, $Res Function(SalesResponse) _then) = _$SalesResponseCopyWithImpl;
@useResult
$Res call({
 SalesPagination? data, String? message, dynamic errors
});


$SalesPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class _$SalesResponseCopyWithImpl<$Res>
    implements $SalesResponseCopyWith<$Res> {
  _$SalesResponseCopyWithImpl(this._self, this._then);

  final SalesResponse _self;
  final $Res Function(SalesResponse) _then;

/// Create a copy of SalesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(SalesResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SalesPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of SalesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SalesPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesResponse].
extension SalesResponsePatterns on SalesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesResponse value)  $default,){
final _that = this;
switch (_that) {
case _SalesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SalesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SalesPagination? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SalesPagination? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _SalesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SalesPagination? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _SalesResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesResponse implements SalesResponse {
  const _SalesResponse({this.data, this.message, this.errors});
  factory _SalesResponse.fromJson(Map<String, dynamic> json) => _$SalesResponseFromJson(json);

@override final  SalesPagination? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of SalesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesResponseCopyWith<_SalesResponse> get copyWith => __$SalesResponseCopyWithImpl<_SalesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'SalesResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SalesResponseCopyWith<$Res> implements $SalesResponseCopyWith<$Res> {
  factory _$SalesResponseCopyWith(_SalesResponse value, $Res Function(_SalesResponse) _then) = __$SalesResponseCopyWithImpl;
@override @useResult
$Res call({
 SalesPagination? data, String? message, dynamic errors
});


@override $SalesPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class __$SalesResponseCopyWithImpl<$Res>
    implements _$SalesResponseCopyWith<$Res> {
  __$SalesResponseCopyWithImpl(this._self, this._then);

  final _SalesResponse _self;
  final $Res Function(_SalesResponse) _then;

/// Create a copy of SalesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_SalesResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SalesPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of SalesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SalesPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
