// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suppliers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuppliersPagination {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'data') List<SupplierModel> get suppliers;@JsonKey(name: 'from') int? get from;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'next_page_url') String? get nextPageUrl;@JsonKey(name: 'path') String? get path;@JsonKey(name: 'per_page') int get perPage;@JsonKey(name: 'prev_page_url') String? get prevPageUrl;@JsonKey(name: 'to') int? get to; int get total;
/// Create a copy of SuppliersPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuppliersPaginationCopyWith<SuppliersPagination> get copyWith => _$SuppliersPaginationCopyWithImpl<SuppliersPagination>(this as SuppliersPagination, _$identity);

  /// Serializes this SuppliersPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SuppliersPagination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuppliersPagination&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.suppliers, _this.suppliers)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.nextPageUrl, _this.nextPageUrl) || other.nextPageUrl == _this.nextPageUrl)&&(identical(other.path, _this.path) || other.path == _this.path)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.prevPageUrl, _this.prevPageUrl) || other.prevPageUrl == _this.prevPageUrl)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SuppliersPagination;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.suppliers),_this.from,_this.lastPage,_this.nextPageUrl,_this.path,_this.perPage,_this.prevPageUrl,_this.to,_this.total);
}

@override
String toString() {
  final _this = this as SuppliersPagination;
  return 'SuppliersPagination(currentPage: ${_this.currentPage}, suppliers: ${_this.suppliers}, from: ${_this.from}, lastPage: ${_this.lastPage}, nextPageUrl: ${_this.nextPageUrl}, path: ${_this.path}, perPage: ${_this.perPage}, prevPageUrl: ${_this.prevPageUrl}, to: ${_this.to}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $SuppliersPaginationCopyWith<$Res>  {
  factory $SuppliersPaginationCopyWith(SuppliersPagination value, $Res Function(SuppliersPagination) _then) = _$SuppliersPaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SupplierModel> suppliers,@JsonKey(name: 'from') int? from,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'next_page_url') String? nextPageUrl,@JsonKey(name: 'path') String? path,@JsonKey(name: 'per_page') int perPage,@JsonKey(name: 'prev_page_url') String? prevPageUrl,@JsonKey(name: 'to') int? to, int total
});




}
/// @nodoc
class _$SuppliersPaginationCopyWithImpl<$Res>
    implements $SuppliersPaginationCopyWith<$Res> {
  _$SuppliersPaginationCopyWithImpl(this._self, this._then);

  final SuppliersPagination _self;
  final $Res Function(SuppliersPagination) _then;

/// Create a copy of SuppliersPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? suppliers = null,Object? from = freezed,Object? lastPage = null,Object? nextPageUrl = freezed,Object? path = freezed,Object? perPage = null,Object? prevPageUrl = freezed,Object? to = freezed,Object? total = null,}) {
  return _then(SuppliersPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,suppliers: null == suppliers ? _self.suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SuppliersPagination].
extension SuppliersPaginationPatterns on SuppliersPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuppliersPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuppliersPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuppliersPagination value)  $default,){
final _that = this;
switch (_that) {
case _SuppliersPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuppliersPagination value)?  $default,){
final _that = this;
switch (_that) {
case _SuppliersPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierModel> suppliers, @JsonKey(name: 'from')  int? from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'next_page_url')  String? nextPageUrl, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl, @JsonKey(name: 'to')  int? to,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuppliersPagination() when $default != null:
return $default(_that.currentPage,_that.suppliers,_that.from,_that.lastPage,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierModel> suppliers, @JsonKey(name: 'from')  int? from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'next_page_url')  String? nextPageUrl, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl, @JsonKey(name: 'to')  int? to,  int total)  $default,) {final _that = this;
switch (_that) {
case _SuppliersPagination():
return $default(_that.currentPage,_that.suppliers,_that.from,_that.lastPage,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierModel> suppliers, @JsonKey(name: 'from')  int? from, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'next_page_url')  String? nextPageUrl, @JsonKey(name: 'path')  String? path, @JsonKey(name: 'per_page')  int perPage, @JsonKey(name: 'prev_page_url')  String? prevPageUrl, @JsonKey(name: 'to')  int? to,  int total)?  $default,) {final _that = this;
switch (_that) {
case _SuppliersPagination() when $default != null:
return $default(_that.currentPage,_that.suppliers,_that.from,_that.lastPage,_that.nextPageUrl,_that.path,_that.perPage,_that.prevPageUrl,_that.to,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuppliersPagination implements SuppliersPagination {
  const _SuppliersPagination({@JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'data') required  List<SupplierModel> suppliers, @JsonKey(name: 'from') this.from, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'next_page_url') this.nextPageUrl, @JsonKey(name: 'path') this.path, @JsonKey(name: 'per_page') required this.perPage, @JsonKey(name: 'prev_page_url') this.prevPageUrl, @JsonKey(name: 'to') this.to, required this.total}): _suppliers = suppliers;
  factory _SuppliersPagination.fromJson(Map<String, dynamic> json) => _$SuppliersPaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<SupplierModel> _suppliers;
@override@JsonKey(name: 'data') List<SupplierModel> get suppliers {
  if (_suppliers is EqualUnmodifiableListView) return _suppliers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suppliers);
}

@override@JsonKey(name: 'from') final  int? from;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'next_page_url') final  String? nextPageUrl;
@override@JsonKey(name: 'path') final  String? path;
@override@JsonKey(name: 'per_page') final  int perPage;
@override@JsonKey(name: 'prev_page_url') final  String? prevPageUrl;
@override@JsonKey(name: 'to') final  int? to;
@override final  int total;

/// Create a copy of SuppliersPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuppliersPaginationCopyWith<_SuppliersPagination> get copyWith => __$SuppliersPaginationCopyWithImpl<_SuppliersPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuppliersPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuppliersPagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.suppliers, _suppliers)&&(identical(other.from, from) || other.from == from)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl)&&(identical(other.path, path) || other.path == path)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.prevPageUrl, prevPageUrl) || other.prevPageUrl == prevPageUrl)&&(identical(other.to, to) || other.to == to)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_suppliers),from,lastPage,nextPageUrl,path,perPage,prevPageUrl,to,total);
}

@override
String toString() {
    return 'SuppliersPagination(currentPage: $currentPage, suppliers: $suppliers, from: $from, lastPage: $lastPage, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SuppliersPaginationCopyWith<$Res> implements $SuppliersPaginationCopyWith<$Res> {
  factory _$SuppliersPaginationCopyWith(_SuppliersPagination value, $Res Function(_SuppliersPagination) _then) = __$SuppliersPaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SupplierModel> suppliers,@JsonKey(name: 'from') int? from,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'next_page_url') String? nextPageUrl,@JsonKey(name: 'path') String? path,@JsonKey(name: 'per_page') int perPage,@JsonKey(name: 'prev_page_url') String? prevPageUrl,@JsonKey(name: 'to') int? to, int total
});




}
/// @nodoc
class __$SuppliersPaginationCopyWithImpl<$Res>
    implements _$SuppliersPaginationCopyWith<$Res> {
  __$SuppliersPaginationCopyWithImpl(this._self, this._then);

  final _SuppliersPagination _self;
  final $Res Function(_SuppliersPagination) _then;

/// Create a copy of SuppliersPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? suppliers = null,Object? from = freezed,Object? lastPage = null,Object? nextPageUrl = freezed,Object? path = freezed,Object? perPage = null,Object? prevPageUrl = freezed,Object? to = freezed,Object? total = null,}) {
  return _then(_SuppliersPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,suppliers: null == suppliers ? _self._suppliers : suppliers // ignore: cast_nullable_to_non_nullable
as List<SupplierModel>,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as int?,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,prevPageUrl: freezed == prevPageUrl ? _self.prevPageUrl : prevPageUrl // ignore: cast_nullable_to_non_nullable
as String?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as int?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SuppliersResponse {

 SuppliersPagination? get data; String? get message; dynamic get errors;
/// Create a copy of SuppliersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuppliersResponseCopyWith<SuppliersResponse> get copyWith => _$SuppliersResponseCopyWithImpl<SuppliersResponse>(this as SuppliersResponse, _$identity);

  /// Serializes this SuppliersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SuppliersResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuppliersResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SuppliersResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as SuppliersResponse;
  return 'SuppliersResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $SuppliersResponseCopyWith<$Res>  {
  factory $SuppliersResponseCopyWith(SuppliersResponse value, $Res Function(SuppliersResponse) _then) = _$SuppliersResponseCopyWithImpl;
@useResult
$Res call({
 SuppliersPagination? data, String? message, dynamic errors
});


$SuppliersPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class _$SuppliersResponseCopyWithImpl<$Res>
    implements $SuppliersResponseCopyWith<$Res> {
  _$SuppliersResponseCopyWithImpl(this._self, this._then);

  final SuppliersResponse _self;
  final $Res Function(SuppliersResponse) _then;

/// Create a copy of SuppliersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(SuppliersResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SuppliersPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of SuppliersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SuppliersPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SuppliersPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SuppliersResponse].
extension SuppliersResponsePatterns on SuppliersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuppliersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuppliersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuppliersResponse value)  $default,){
final _that = this;
switch (_that) {
case _SuppliersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuppliersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SuppliersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SuppliersPagination? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuppliersResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SuppliersPagination? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _SuppliersResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SuppliersPagination? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _SuppliersResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuppliersResponse implements SuppliersResponse {
  const _SuppliersResponse({this.data, this.message, this.errors});
  factory _SuppliersResponse.fromJson(Map<String, dynamic> json) => _$SuppliersResponseFromJson(json);

@override final  SuppliersPagination? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of SuppliersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuppliersResponseCopyWith<_SuppliersResponse> get copyWith => __$SuppliersResponseCopyWithImpl<_SuppliersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuppliersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuppliersResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'SuppliersResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SuppliersResponseCopyWith<$Res> implements $SuppliersResponseCopyWith<$Res> {
  factory _$SuppliersResponseCopyWith(_SuppliersResponse value, $Res Function(_SuppliersResponse) _then) = __$SuppliersResponseCopyWithImpl;
@override @useResult
$Res call({
 SuppliersPagination? data, String? message, dynamic errors
});


@override $SuppliersPaginationCopyWith<$Res>? get data;

}
/// @nodoc
class __$SuppliersResponseCopyWithImpl<$Res>
    implements _$SuppliersResponseCopyWith<$Res> {
  __$SuppliersResponseCopyWithImpl(this._self, this._then);

  final _SuppliersResponse _self;
  final $Res Function(_SuppliersResponse) _then;

/// Create a copy of SuppliersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_SuppliersResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SuppliersPagination?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of SuppliersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SuppliersPaginationCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SuppliersPaginationCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
