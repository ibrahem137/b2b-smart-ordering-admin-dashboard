// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_offers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierOffersPagination {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'data') List<SupplierOfferModel> get offers;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'per_page') int get perPage; int get total;
/// Create a copy of SupplierOffersPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOffersPaginationCopyWith<SupplierOffersPagination> get copyWith => _$SupplierOffersPaginationCopyWithImpl<SupplierOffersPagination>(this as SupplierOffersPagination, _$identity);

  /// Serializes this SupplierOffersPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplierOffersPagination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersPagination&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.offers, _this.offers)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplierOffersPagination;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.offers),_this.lastPage,_this.perPage,_this.total);
}

@override
String toString() {
  final _this = this as SupplierOffersPagination;
  return 'SupplierOffersPagination(currentPage: ${_this.currentPage}, offers: ${_this.offers}, lastPage: ${_this.lastPage}, perPage: ${_this.perPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $SupplierOffersPaginationCopyWith<$Res>  {
  factory $SupplierOffersPaginationCopyWith(SupplierOffersPagination value, $Res Function(SupplierOffersPagination) _then) = _$SupplierOffersPaginationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SupplierOfferModel> offers,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class _$SupplierOffersPaginationCopyWithImpl<$Res>
    implements $SupplierOffersPaginationCopyWith<$Res> {
  _$SupplierOffersPaginationCopyWithImpl(this._self, this._then);

  final SupplierOffersPagination _self;
  final $Res Function(SupplierOffersPagination) _then;

/// Create a copy of SupplierOffersPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? offers = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(SupplierOffersPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<SupplierOfferModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierOffersPagination].
extension SupplierOffersPaginationPatterns on SupplierOffersPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierOffersPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierOffersPagination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierOffersPagination value)  $default,){
final _that = this;
switch (_that) {
case _SupplierOffersPagination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierOffersPagination value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierOffersPagination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierOfferModel> offers, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierOffersPagination() when $default != null:
return $default(_that.currentPage,_that.offers,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierOfferModel> offers, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _SupplierOffersPagination():
return $default(_that.currentPage,_that.offers,_that.lastPage,_that.perPage,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'data')  List<SupplierOfferModel> offers, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _SupplierOffersPagination() when $default != null:
return $default(_that.currentPage,_that.offers,_that.lastPage,_that.perPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierOffersPagination implements SupplierOffersPagination {
  const _SupplierOffersPagination({@JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'data') required  List<SupplierOfferModel> offers, @JsonKey(name: 'last_page') required this.lastPage, @JsonKey(name: 'per_page') required this.perPage, required this.total}): _offers = offers;
  factory _SupplierOffersPagination.fromJson(Map<String, dynamic> json) => _$SupplierOffersPaginationFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<SupplierOfferModel> _offers;
@override@JsonKey(name: 'data') List<SupplierOfferModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'per_page') final  int perPage;
@override final  int total;

/// Create a copy of SupplierOffersPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierOffersPaginationCopyWith<_SupplierOffersPagination> get copyWith => __$SupplierOffersPaginationCopyWithImpl<_SupplierOffersPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierOffersPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierOffersPagination&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.offers, _offers)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_offers),lastPage,perPage,total);
}

@override
String toString() {
    return 'SupplierOffersPagination(currentPage: $currentPage, offers: $offers, lastPage: $lastPage, perPage: $perPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$SupplierOffersPaginationCopyWith<$Res> implements $SupplierOffersPaginationCopyWith<$Res> {
  factory _$SupplierOffersPaginationCopyWith(_SupplierOffersPagination value, $Res Function(_SupplierOffersPagination) _then) = __$SupplierOffersPaginationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'data') List<SupplierOfferModel> offers,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total
});




}
/// @nodoc
class __$SupplierOffersPaginationCopyWithImpl<$Res>
    implements _$SupplierOffersPaginationCopyWith<$Res> {
  __$SupplierOffersPaginationCopyWithImpl(this._self, this._then);

  final _SupplierOffersPagination _self;
  final $Res Function(_SupplierOffersPagination) _then;

/// Create a copy of SupplierOffersPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? offers = null,Object? lastPage = null,Object? perPage = null,Object? total = null,}) {
  return _then(_SupplierOffersPagination(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<SupplierOfferModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SupplierOffersResponse {

 SupplierOffersPagination get data; String? get message;
/// Create a copy of SupplierOffersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOffersResponseCopyWith<SupplierOffersResponse> get copyWith => _$SupplierOffersResponseCopyWithImpl<SupplierOffersResponse>(this as SupplierOffersResponse, _$identity);

  /// Serializes this SupplierOffersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplierOffersResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplierOffersResponse;
  return Object.hash(runtimeType,_this.data,_this.message);
}

@override
String toString() {
  final _this = this as SupplierOffersResponse;
  return 'SupplierOffersResponse(data: ${_this.data}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $SupplierOffersResponseCopyWith<$Res>  {
  factory $SupplierOffersResponseCopyWith(SupplierOffersResponse value, $Res Function(SupplierOffersResponse) _then) = _$SupplierOffersResponseCopyWithImpl;
@useResult
$Res call({
 SupplierOffersPagination data, String? message
});


$SupplierOffersPaginationCopyWith<$Res> get data;

}
/// @nodoc
class _$SupplierOffersResponseCopyWithImpl<$Res>
    implements $SupplierOffersResponseCopyWith<$Res> {
  _$SupplierOffersResponseCopyWithImpl(this._self, this._then);

  final SupplierOffersResponse _self;
  final $Res Function(SupplierOffersResponse) _then;

/// Create a copy of SupplierOffersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? message = freezed,}) {
  return _then(SupplierOffersResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SupplierOffersPagination,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SupplierOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierOffersPaginationCopyWith<$Res> get data {
  
  return $SupplierOffersPaginationCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupplierOffersResponse].
extension SupplierOffersResponsePatterns on SupplierOffersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierOffersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierOffersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierOffersResponse value)  $default,){
final _that = this;
switch (_that) {
case _SupplierOffersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierOffersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierOffersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SupplierOffersPagination data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierOffersResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SupplierOffersPagination data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _SupplierOffersResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SupplierOffersPagination data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _SupplierOffersResponse() when $default != null:
return $default(_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierOffersResponse implements SupplierOffersResponse {
  const _SupplierOffersResponse({required this.data, this.message});
  factory _SupplierOffersResponse.fromJson(Map<String, dynamic> json) => _$SupplierOffersResponseFromJson(json);

@override final  SupplierOffersPagination data;
@override final  String? message;

/// Create a copy of SupplierOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierOffersResponseCopyWith<_SupplierOffersResponse> get copyWith => __$SupplierOffersResponseCopyWithImpl<_SupplierOffersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierOffersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierOffersResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message);
}

@override
String toString() {
    return 'SupplierOffersResponse(data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SupplierOffersResponseCopyWith<$Res> implements $SupplierOffersResponseCopyWith<$Res> {
  factory _$SupplierOffersResponseCopyWith(_SupplierOffersResponse value, $Res Function(_SupplierOffersResponse) _then) = __$SupplierOffersResponseCopyWithImpl;
@override @useResult
$Res call({
 SupplierOffersPagination data, String? message
});


@override $SupplierOffersPaginationCopyWith<$Res> get data;

}
/// @nodoc
class __$SupplierOffersResponseCopyWithImpl<$Res>
    implements _$SupplierOffersResponseCopyWith<$Res> {
  __$SupplierOffersResponseCopyWithImpl(this._self, this._then);

  final _SupplierOffersResponse _self;
  final $Res Function(_SupplierOffersResponse) _then;

/// Create a copy of SupplierOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? message = freezed,}) {
  return _then(_SupplierOffersResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SupplierOffersPagination,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SupplierOffersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierOffersPaginationCopyWith<$Res> get data {
  
  return $SupplierOffersPaginationCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
