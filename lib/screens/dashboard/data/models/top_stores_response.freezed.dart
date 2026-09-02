// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_stores_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopStoreItem {

@JsonKey(name: 'store_id') int get storeId;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'total_profit') double get totalProfit; TopStoreModel? get store;
/// Create a copy of TopStoreItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopStoreItemCopyWith<TopStoreItem> get copyWith => _$TopStoreItemCopyWithImpl<TopStoreItem>(this as TopStoreItem, _$identity);

  /// Serializes this TopStoreItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopStoreItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopStoreItem&&(identical(other.storeId, _this.storeId) || other.storeId == _this.storeId)&&(identical(other.totalSales, _this.totalSales) || other.totalSales == _this.totalSales)&&(identical(other.totalProfit, _this.totalProfit) || other.totalProfit == _this.totalProfit)&&(identical(other.store, _this.store) || other.store == _this.store));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopStoreItem;
  return Object.hash(runtimeType,_this.storeId,_this.totalSales,_this.totalProfit,_this.store);
}

@override
String toString() {
  final _this = this as TopStoreItem;
  return 'TopStoreItem(storeId: ${_this.storeId}, totalSales: ${_this.totalSales}, totalProfit: ${_this.totalProfit}, store: ${_this.store})';
}


}

/// @nodoc
abstract mixin class $TopStoreItemCopyWith<$Res>  {
  factory $TopStoreItemCopyWith(TopStoreItem value, $Res Function(TopStoreItem) _then) = _$TopStoreItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'store_id') int storeId,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'total_profit') double totalProfit, TopStoreModel? store
});


$TopStoreModelCopyWith<$Res>? get store;

}
/// @nodoc
class _$TopStoreItemCopyWithImpl<$Res>
    implements $TopStoreItemCopyWith<$Res> {
  _$TopStoreItemCopyWithImpl(this._self, this._then);

  final TopStoreItem _self;
  final $Res Function(TopStoreItem) _then;

/// Create a copy of TopStoreItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeId = null,Object? totalSales = null,Object? totalProfit = null,Object? store = freezed,}) {
  return _then(TopStoreItem(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as double,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as TopStoreModel?,
  ));
}
/// Create a copy of TopStoreItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopStoreModelCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $TopStoreModelCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopStoreItem].
extension TopStoreItemPatterns on TopStoreItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopStoreItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopStoreItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopStoreItem value)  $default,){
final _that = this;
switch (_that) {
case _TopStoreItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopStoreItem value)?  $default,){
final _that = this;
switch (_that) {
case _TopStoreItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'store_id')  int storeId, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_profit')  double totalProfit,  TopStoreModel? store)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopStoreItem() when $default != null:
return $default(_that.storeId,_that.totalSales,_that.totalProfit,_that.store);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'store_id')  int storeId, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_profit')  double totalProfit,  TopStoreModel? store)  $default,) {final _that = this;
switch (_that) {
case _TopStoreItem():
return $default(_that.storeId,_that.totalSales,_that.totalProfit,_that.store);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'store_id')  int storeId, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'total_profit')  double totalProfit,  TopStoreModel? store)?  $default,) {final _that = this;
switch (_that) {
case _TopStoreItem() when $default != null:
return $default(_that.storeId,_that.totalSales,_that.totalProfit,_that.store);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopStoreItem implements TopStoreItem {
  const _TopStoreItem({@JsonKey(name: 'store_id') required this.storeId, @JsonKey(name: 'total_sales') this.totalSales = 0, @JsonKey(name: 'total_profit') this.totalProfit = 0, this.store});
  factory _TopStoreItem.fromJson(Map<String, dynamic> json) => _$TopStoreItemFromJson(json);

@override@JsonKey(name: 'store_id') final  int storeId;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'total_profit') final  double totalProfit;
@override final  TopStoreModel? store;

/// Create a copy of TopStoreItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopStoreItemCopyWith<_TopStoreItem> get copyWith => __$TopStoreItemCopyWithImpl<_TopStoreItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopStoreItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopStoreItem&&(identical(other.storeId, storeId) || other.storeId == storeId)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit)&&(identical(other.store, store) || other.store == store));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,storeId,totalSales,totalProfit,store);
}

@override
String toString() {
    return 'TopStoreItem(storeId: $storeId, totalSales: $totalSales, totalProfit: $totalProfit, store: $store)';
}


}

/// @nodoc
abstract mixin class _$TopStoreItemCopyWith<$Res> implements $TopStoreItemCopyWith<$Res> {
  factory _$TopStoreItemCopyWith(_TopStoreItem value, $Res Function(_TopStoreItem) _then) = __$TopStoreItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'store_id') int storeId,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'total_profit') double totalProfit, TopStoreModel? store
});


@override $TopStoreModelCopyWith<$Res>? get store;

}
/// @nodoc
class __$TopStoreItemCopyWithImpl<$Res>
    implements _$TopStoreItemCopyWith<$Res> {
  __$TopStoreItemCopyWithImpl(this._self, this._then);

  final _TopStoreItem _self;
  final $Res Function(_TopStoreItem) _then;

/// Create a copy of TopStoreItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeId = null,Object? totalSales = null,Object? totalProfit = null,Object? store = freezed,}) {
  return _then(_TopStoreItem(
storeId: null == storeId ? _self.storeId : storeId // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as double,store: freezed == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as TopStoreModel?,
  ));
}

/// Create a copy of TopStoreItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopStoreModelCopyWith<$Res>? get store {
    if (_self.store == null) {
    return null;
  }

  return $TopStoreModelCopyWith<$Res>(_self.store!, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}


/// @nodoc
mixin _$TopStoreModel {

 int get id; String get name; String? get email;
/// Create a copy of TopStoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopStoreModelCopyWith<TopStoreModel> get copyWith => _$TopStoreModelCopyWithImpl<TopStoreModel>(this as TopStoreModel, _$identity);

  /// Serializes this TopStoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopStoreModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopStoreModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopStoreModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.email);
}

@override
String toString() {
  final _this = this as TopStoreModel;
  return 'TopStoreModel(id: ${_this.id}, name: ${_this.name}, email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $TopStoreModelCopyWith<$Res>  {
  factory $TopStoreModelCopyWith(TopStoreModel value, $Res Function(TopStoreModel) _then) = _$TopStoreModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? email
});




}
/// @nodoc
class _$TopStoreModelCopyWithImpl<$Res>
    implements $TopStoreModelCopyWith<$Res> {
  _$TopStoreModelCopyWithImpl(this._self, this._then);

  final TopStoreModel _self;
  final $Res Function(TopStoreModel) _then;

/// Create a copy of TopStoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = freezed,}) {
  return _then(TopStoreModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopStoreModel].
extension TopStoreModelPatterns on TopStoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopStoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopStoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopStoreModel value)  $default,){
final _that = this;
switch (_that) {
case _TopStoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopStoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _TopStoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopStoreModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? email)  $default,) {final _that = this;
switch (_that) {
case _TopStoreModel():
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _TopStoreModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopStoreModel implements TopStoreModel {
  const _TopStoreModel({required this.id, required this.name, this.email});
  factory _TopStoreModel.fromJson(Map<String, dynamic> json) => _$TopStoreModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? email;

/// Create a copy of TopStoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopStoreModelCopyWith<_TopStoreModel> get copyWith => __$TopStoreModelCopyWithImpl<_TopStoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopStoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopStoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,email);
}

@override
String toString() {
    return 'TopStoreModel(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$TopStoreModelCopyWith<$Res> implements $TopStoreModelCopyWith<$Res> {
  factory _$TopStoreModelCopyWith(_TopStoreModel value, $Res Function(_TopStoreModel) _then) = __$TopStoreModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? email
});




}
/// @nodoc
class __$TopStoreModelCopyWithImpl<$Res>
    implements _$TopStoreModelCopyWith<$Res> {
  __$TopStoreModelCopyWithImpl(this._self, this._then);

  final _TopStoreModel _self;
  final $Res Function(_TopStoreModel) _then;

/// Create a copy of TopStoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = freezed,}) {
  return _then(_TopStoreModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TopStoresResponse {

 List<TopStoreItem> get data; String? get message; dynamic get errors;
/// Create a copy of TopStoresResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopStoresResponseCopyWith<TopStoresResponse> get copyWith => _$TopStoresResponseCopyWithImpl<TopStoresResponse>(this as TopStoresResponse, _$identity);

  /// Serializes this TopStoresResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopStoresResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopStoresResponse&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopStoresResponse;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as TopStoresResponse;
  return 'TopStoresResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $TopStoresResponseCopyWith<$Res>  {
  factory $TopStoresResponseCopyWith(TopStoresResponse value, $Res Function(TopStoresResponse) _then) = _$TopStoresResponseCopyWithImpl;
@useResult
$Res call({
 List<TopStoreItem> data, String? message, dynamic errors
});




}
/// @nodoc
class _$TopStoresResponseCopyWithImpl<$Res>
    implements $TopStoresResponseCopyWith<$Res> {
  _$TopStoresResponseCopyWithImpl(this._self, this._then);

  final TopStoresResponse _self;
  final $Res Function(TopStoresResponse) _then;

/// Create a copy of TopStoresResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? message = freezed,Object? errors = freezed,}) {
  return _then(TopStoresResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TopStoreItem>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [TopStoresResponse].
extension TopStoresResponsePatterns on TopStoresResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopStoresResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopStoresResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopStoresResponse value)  $default,){
final _that = this;
switch (_that) {
case _TopStoresResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopStoresResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TopStoresResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TopStoreItem> data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopStoresResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TopStoreItem> data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _TopStoresResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TopStoreItem> data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _TopStoresResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopStoresResponse implements TopStoresResponse {
  const _TopStoresResponse({ List<TopStoreItem> data = const [], this.message, this.errors}): _data = data;
  factory _TopStoresResponse.fromJson(Map<String, dynamic> json) => _$TopStoresResponseFromJson(json);

 final  List<TopStoreItem> _data;
@override@JsonKey() List<TopStoreItem> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  String? message;
@override final  dynamic errors;

/// Create a copy of TopStoresResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopStoresResponseCopyWith<_TopStoresResponse> get copyWith => __$TopStoresResponseCopyWithImpl<_TopStoresResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopStoresResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopStoresResponse&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'TopStoresResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$TopStoresResponseCopyWith<$Res> implements $TopStoresResponseCopyWith<$Res> {
  factory _$TopStoresResponseCopyWith(_TopStoresResponse value, $Res Function(_TopStoresResponse) _then) = __$TopStoresResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TopStoreItem> data, String? message, dynamic errors
});




}
/// @nodoc
class __$TopStoresResponseCopyWithImpl<$Res>
    implements _$TopStoresResponseCopyWith<$Res> {
  __$TopStoresResponseCopyWithImpl(this._self, this._then);

  final _TopStoresResponse _self;
  final $Res Function(_TopStoresResponse) _then;

/// Create a copy of TopStoresResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_TopStoresResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TopStoreItem>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
