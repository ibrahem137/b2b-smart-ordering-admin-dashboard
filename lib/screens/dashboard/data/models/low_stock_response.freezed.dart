// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'low_stock_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LowStockCategory {

 int get id; String get name;@JsonKey(name: 'image_url') String? get imageUrl;
/// Create a copy of LowStockCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockCategoryCopyWith<LowStockCategory> get copyWith => _$LowStockCategoryCopyWithImpl<LowStockCategory>(this as LowStockCategory, _$identity);

  /// Serializes this LowStockCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockCategory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockCategory;
  return Object.hash(runtimeType,_this.id,_this.name,_this.imageUrl);
}

@override
String toString() {
  final _this = this as LowStockCategory;
  return 'LowStockCategory(id: ${_this.id}, name: ${_this.name}, imageUrl: ${_this.imageUrl})';
}


}

/// @nodoc
abstract mixin class $LowStockCategoryCopyWith<$Res>  {
  factory $LowStockCategoryCopyWith(LowStockCategory value, $Res Function(LowStockCategory) _then) = _$LowStockCategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class _$LowStockCategoryCopyWithImpl<$Res>
    implements $LowStockCategoryCopyWith<$Res> {
  _$LowStockCategoryCopyWithImpl(this._self, this._then);

  final LowStockCategory _self;
  final $Res Function(LowStockCategory) _then;

/// Create a copy of LowStockCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,}) {
  return _then(LowStockCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockCategory].
extension LowStockCategoryPatterns on LowStockCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockCategory value)  $default,){
final _that = this;
switch (_that) {
case _LowStockCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockCategory value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockCategory() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'image_url')  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _LowStockCategory():
return $default(_that.id,_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _LowStockCategory() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockCategory implements LowStockCategory {
  const _LowStockCategory({required this.id, required this.name, @JsonKey(name: 'image_url') this.imageUrl});
  factory _LowStockCategory.fromJson(Map<String, dynamic> json) => _$LowStockCategoryFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'image_url') final  String? imageUrl;

/// Create a copy of LowStockCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockCategoryCopyWith<_LowStockCategory> get copyWith => __$LowStockCategoryCopyWithImpl<_LowStockCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,imageUrl);
}

@override
String toString() {
    return 'LowStockCategory(id: $id, name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$LowStockCategoryCopyWith<$Res> implements $LowStockCategoryCopyWith<$Res> {
  factory _$LowStockCategoryCopyWith(_LowStockCategory value, $Res Function(_LowStockCategory) _then) = __$LowStockCategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class __$LowStockCategoryCopyWithImpl<$Res>
    implements _$LowStockCategoryCopyWith<$Res> {
  __$LowStockCategoryCopyWithImpl(this._self, this._then);

  final _LowStockCategory _self;
  final $Res Function(_LowStockCategory) _then;

/// Create a copy of LowStockCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,}) {
  return _then(_LowStockCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LowStockData {

 int get threshold; List<LowStockItem> get items;
/// Create a copy of LowStockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockDataCopyWith<LowStockData> get copyWith => _$LowStockDataCopyWithImpl<LowStockData>(this as LowStockData, _$identity);

  /// Serializes this LowStockData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockData&&(identical(other.threshold, _this.threshold) || other.threshold == _this.threshold)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockData;
  return Object.hash(runtimeType,_this.threshold,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as LowStockData;
  return 'LowStockData(threshold: ${_this.threshold}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $LowStockDataCopyWith<$Res>  {
  factory $LowStockDataCopyWith(LowStockData value, $Res Function(LowStockData) _then) = _$LowStockDataCopyWithImpl;
@useResult
$Res call({
 int threshold, List<LowStockItem> items
});




}
/// @nodoc
class _$LowStockDataCopyWithImpl<$Res>
    implements $LowStockDataCopyWith<$Res> {
  _$LowStockDataCopyWithImpl(this._self, this._then);

  final LowStockData _self;
  final $Res Function(LowStockData) _then;

/// Create a copy of LowStockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? threshold = null,Object? items = null,}) {
  return _then(LowStockData(
threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LowStockItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockData].
extension LowStockDataPatterns on LowStockData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockData value)  $default,){
final _that = this;
switch (_that) {
case _LowStockData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockData value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int threshold,  List<LowStockItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockData() when $default != null:
return $default(_that.threshold,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int threshold,  List<LowStockItem> items)  $default,) {final _that = this;
switch (_that) {
case _LowStockData():
return $default(_that.threshold,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int threshold,  List<LowStockItem> items)?  $default,) {final _that = this;
switch (_that) {
case _LowStockData() when $default != null:
return $default(_that.threshold,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockData implements LowStockData {
  const _LowStockData({this.threshold = 0,  List<LowStockItem> items = const []}): _items = items;
  factory _LowStockData.fromJson(Map<String, dynamic> json) => _$LowStockDataFromJson(json);

@override@JsonKey() final  int threshold;
 final  List<LowStockItem> _items;
@override@JsonKey() List<LowStockItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of LowStockData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockDataCopyWith<_LowStockData> get copyWith => __$LowStockDataCopyWithImpl<_LowStockData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockData&&(identical(other.threshold, threshold) || other.threshold == threshold)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,threshold,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'LowStockData(threshold: $threshold, items: $items)';
}


}

/// @nodoc
abstract mixin class _$LowStockDataCopyWith<$Res> implements $LowStockDataCopyWith<$Res> {
  factory _$LowStockDataCopyWith(_LowStockData value, $Res Function(_LowStockData) _then) = __$LowStockDataCopyWithImpl;
@override @useResult
$Res call({
 int threshold, List<LowStockItem> items
});




}
/// @nodoc
class __$LowStockDataCopyWithImpl<$Res>
    implements _$LowStockDataCopyWith<$Res> {
  __$LowStockDataCopyWithImpl(this._self, this._then);

  final _LowStockData _self;
  final $Res Function(_LowStockData) _then;

/// Create a copy of LowStockData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? threshold = null,Object? items = null,}) {
  return _then(_LowStockData(
threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LowStockItem>,
  ));
}


}


/// @nodoc
mixin _$LowStockItem {

 int get id;@JsonKey(name: 'supplier_id') int get supplierId;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'buy_price') String get buyPrice;@JsonKey(name: 'stock_quantity') int get stockQuantity; String get status; LowStockSupplier? get supplier; LowStockProduct? get product;
/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockItemCopyWith<LowStockItem> get copyWith => _$LowStockItemCopyWithImpl<LowStockItem>(this as LowStockItem, _$identity);

  /// Serializes this LowStockItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.supplierId, _this.supplierId) || other.supplierId == _this.supplierId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.buyPrice, _this.buyPrice) || other.buyPrice == _this.buyPrice)&&(identical(other.stockQuantity, _this.stockQuantity) || other.stockQuantity == _this.stockQuantity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.supplier, _this.supplier) || other.supplier == _this.supplier)&&(identical(other.product, _this.product) || other.product == _this.product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockItem;
  return Object.hash(runtimeType,_this.id,_this.supplierId,_this.productId,_this.buyPrice,_this.stockQuantity,_this.status,_this.supplier,_this.product);
}

@override
String toString() {
  final _this = this as LowStockItem;
  return 'LowStockItem(id: ${_this.id}, supplierId: ${_this.supplierId}, productId: ${_this.productId}, buyPrice: ${_this.buyPrice}, stockQuantity: ${_this.stockQuantity}, status: ${_this.status}, supplier: ${_this.supplier}, product: ${_this.product})';
}


}

/// @nodoc
abstract mixin class $LowStockItemCopyWith<$Res>  {
  factory $LowStockItemCopyWith(LowStockItem value, $Res Function(LowStockItem) _then) = _$LowStockItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'supplier_id') int supplierId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'buy_price') String buyPrice,@JsonKey(name: 'stock_quantity') int stockQuantity, String status, LowStockSupplier? supplier, LowStockProduct? product
});


$LowStockSupplierCopyWith<$Res>? get supplier;$LowStockProductCopyWith<$Res>? get product;

}
/// @nodoc
class _$LowStockItemCopyWithImpl<$Res>
    implements $LowStockItemCopyWith<$Res> {
  _$LowStockItemCopyWithImpl(this._self, this._then);

  final LowStockItem _self;
  final $Res Function(LowStockItem) _then;

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? supplierId = null,Object? productId = null,Object? buyPrice = null,Object? stockQuantity = null,Object? status = null,Object? supplier = freezed,Object? product = freezed,}) {
  return _then(LowStockItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierId: null == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,supplier: freezed == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as LowStockSupplier?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as LowStockProduct?,
  ));
}
/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockSupplierCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
    return null;
  }

  return $LowStockSupplierCopyWith<$Res>(_self.supplier!, (value) {
    return _then(_self.copyWith(supplier: value));
  });
}/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $LowStockProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [LowStockItem].
extension LowStockItemPatterns on LowStockItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockItem value)  $default,){
final _that = this;
switch (_that) {
case _LowStockItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockItem value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status,  LowStockSupplier? supplier,  LowStockProduct? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
return $default(_that.id,_that.supplierId,_that.productId,_that.buyPrice,_that.stockQuantity,_that.status,_that.supplier,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status,  LowStockSupplier? supplier,  LowStockProduct? product)  $default,) {final _that = this;
switch (_that) {
case _LowStockItem():
return $default(_that.id,_that.supplierId,_that.productId,_that.buyPrice,_that.stockQuantity,_that.status,_that.supplier,_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status,  LowStockSupplier? supplier,  LowStockProduct? product)?  $default,) {final _that = this;
switch (_that) {
case _LowStockItem() when $default != null:
return $default(_that.id,_that.supplierId,_that.productId,_that.buyPrice,_that.stockQuantity,_that.status,_that.supplier,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockItem implements LowStockItem {
  const _LowStockItem({required this.id, @JsonKey(name: 'supplier_id') required this.supplierId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'buy_price') required this.buyPrice, @JsonKey(name: 'stock_quantity') this.stockQuantity = 0, required this.status, this.supplier, this.product});
  factory _LowStockItem.fromJson(Map<String, dynamic> json) => _$LowStockItemFromJson(json);

@override final  int id;
@override@JsonKey(name: 'supplier_id') final  int supplierId;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'buy_price') final  String buyPrice;
@override@JsonKey(name: 'stock_quantity') final  int stockQuantity;
@override final  String status;
@override final  LowStockSupplier? supplier;
@override final  LowStockProduct? product;

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockItemCopyWith<_LowStockItem> get copyWith => __$LowStockItemCopyWithImpl<_LowStockItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockItem&&(identical(other.id, id) || other.id == id)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.buyPrice, buyPrice) || other.buyPrice == buyPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.supplier, supplier) || other.supplier == supplier)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,supplierId,productId,buyPrice,stockQuantity,status,supplier,product);
}

@override
String toString() {
    return 'LowStockItem(id: $id, supplierId: $supplierId, productId: $productId, buyPrice: $buyPrice, stockQuantity: $stockQuantity, status: $status, supplier: $supplier, product: $product)';
}


}

/// @nodoc
abstract mixin class _$LowStockItemCopyWith<$Res> implements $LowStockItemCopyWith<$Res> {
  factory _$LowStockItemCopyWith(_LowStockItem value, $Res Function(_LowStockItem) _then) = __$LowStockItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'supplier_id') int supplierId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'buy_price') String buyPrice,@JsonKey(name: 'stock_quantity') int stockQuantity, String status, LowStockSupplier? supplier, LowStockProduct? product
});


@override $LowStockSupplierCopyWith<$Res>? get supplier;@override $LowStockProductCopyWith<$Res>? get product;

}
/// @nodoc
class __$LowStockItemCopyWithImpl<$Res>
    implements _$LowStockItemCopyWith<$Res> {
  __$LowStockItemCopyWithImpl(this._self, this._then);

  final _LowStockItem _self;
  final $Res Function(_LowStockItem) _then;

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? supplierId = null,Object? productId = null,Object? buyPrice = null,Object? stockQuantity = null,Object? status = null,Object? supplier = freezed,Object? product = freezed,}) {
  return _then(_LowStockItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierId: null == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,supplier: freezed == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as LowStockSupplier?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as LowStockProduct?,
  ));
}

/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockSupplierCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
    return null;
  }

  return $LowStockSupplierCopyWith<$Res>(_self.supplier!, (value) {
    return _then(_self.copyWith(supplier: value));
  });
}/// Create a copy of LowStockItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $LowStockProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$LowStockProduct {

 int get id; String get name;@JsonKey(name: 'category_id') int get categoryId; LowStockCategory? get category;
/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockProductCopyWith<LowStockProduct> get copyWith => _$LowStockProductCopyWithImpl<LowStockProduct>(this as LowStockProduct, _$identity);

  /// Serializes this LowStockProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockProduct;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockProduct&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockProduct;
  return Object.hash(runtimeType,_this.id,_this.name,_this.categoryId,_this.category);
}

@override
String toString() {
  final _this = this as LowStockProduct;
  return 'LowStockProduct(id: ${_this.id}, name: ${_this.name}, categoryId: ${_this.categoryId}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $LowStockProductCopyWith<$Res>  {
  factory $LowStockProductCopyWith(LowStockProduct value, $Res Function(LowStockProduct) _then) = _$LowStockProductCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'category_id') int categoryId, LowStockCategory? category
});


$LowStockCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class _$LowStockProductCopyWithImpl<$Res>
    implements $LowStockProductCopyWith<$Res> {
  _$LowStockProductCopyWithImpl(this._self, this._then);

  final LowStockProduct _self;
  final $Res Function(LowStockProduct) _then;

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? category = freezed,}) {
  return _then(LowStockProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as LowStockCategory?,
  ));
}
/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $LowStockCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [LowStockProduct].
extension LowStockProductPatterns on LowStockProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockProduct value)  $default,){
final _that = this;
switch (_that) {
case _LowStockProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockProduct value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'category_id')  int categoryId,  LowStockCategory? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'category_id')  int categoryId,  LowStockCategory? category)  $default,) {final _that = this;
switch (_that) {
case _LowStockProduct():
return $default(_that.id,_that.name,_that.categoryId,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'category_id')  int categoryId,  LowStockCategory? category)?  $default,) {final _that = this;
switch (_that) {
case _LowStockProduct() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockProduct implements LowStockProduct {
  const _LowStockProduct({required this.id, required this.name, @JsonKey(name: 'category_id') required this.categoryId, this.category});
  factory _LowStockProduct.fromJson(Map<String, dynamic> json) => _$LowStockProductFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override final  LowStockCategory? category;

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockProductCopyWith<_LowStockProduct> get copyWith => __$LowStockProductCopyWithImpl<_LowStockProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,categoryId,category);
}

@override
String toString() {
    return 'LowStockProduct(id: $id, name: $name, categoryId: $categoryId, category: $category)';
}


}

/// @nodoc
abstract mixin class _$LowStockProductCopyWith<$Res> implements $LowStockProductCopyWith<$Res> {
  factory _$LowStockProductCopyWith(_LowStockProduct value, $Res Function(_LowStockProduct) _then) = __$LowStockProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'category_id') int categoryId, LowStockCategory? category
});


@override $LowStockCategoryCopyWith<$Res>? get category;

}
/// @nodoc
class __$LowStockProductCopyWithImpl<$Res>
    implements _$LowStockProductCopyWith<$Res> {
  __$LowStockProductCopyWithImpl(this._self, this._then);

  final _LowStockProduct _self;
  final $Res Function(_LowStockProduct) _then;

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? category = freezed,}) {
  return _then(_LowStockProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as LowStockCategory?,
  ));
}

/// Create a copy of LowStockProduct
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $LowStockCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$LowStockResponse {

 LowStockData? get data; String? get message; dynamic get errors;
/// Create a copy of LowStockResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockResponseCopyWith<LowStockResponse> get copyWith => _$LowStockResponseCopyWithImpl<LowStockResponse>(this as LowStockResponse, _$identity);

  /// Serializes this LowStockResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as LowStockResponse;
  return 'LowStockResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $LowStockResponseCopyWith<$Res>  {
  factory $LowStockResponseCopyWith(LowStockResponse value, $Res Function(LowStockResponse) _then) = _$LowStockResponseCopyWithImpl;
@useResult
$Res call({
 LowStockData? data, String? message, dynamic errors
});


$LowStockDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$LowStockResponseCopyWithImpl<$Res>
    implements $LowStockResponseCopyWith<$Res> {
  _$LowStockResponseCopyWithImpl(this._self, this._then);

  final LowStockResponse _self;
  final $Res Function(LowStockResponse) _then;

/// Create a copy of LowStockResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(LowStockResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LowStockData?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of LowStockResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LowStockDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LowStockResponse].
extension LowStockResponsePatterns on LowStockResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockResponse value)  $default,){
final _that = this;
switch (_that) {
case _LowStockResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LowStockData? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LowStockData? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _LowStockResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LowStockData? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _LowStockResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockResponse implements LowStockResponse {
  const _LowStockResponse({this.data, this.message, this.errors});
  factory _LowStockResponse.fromJson(Map<String, dynamic> json) => _$LowStockResponseFromJson(json);

@override final  LowStockData? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of LowStockResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockResponseCopyWith<_LowStockResponse> get copyWith => __$LowStockResponseCopyWithImpl<_LowStockResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'LowStockResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$LowStockResponseCopyWith<$Res> implements $LowStockResponseCopyWith<$Res> {
  factory _$LowStockResponseCopyWith(_LowStockResponse value, $Res Function(_LowStockResponse) _then) = __$LowStockResponseCopyWithImpl;
@override @useResult
$Res call({
 LowStockData? data, String? message, dynamic errors
});


@override $LowStockDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$LowStockResponseCopyWithImpl<$Res>
    implements _$LowStockResponseCopyWith<$Res> {
  __$LowStockResponseCopyWithImpl(this._self, this._then);

  final _LowStockResponse _self;
  final $Res Function(_LowStockResponse) _then;

/// Create a copy of LowStockResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_LowStockResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LowStockData?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of LowStockResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LowStockDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LowStockDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LowStockSupplier {

 int get id; String get name;
/// Create a copy of LowStockSupplier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LowStockSupplierCopyWith<LowStockSupplier> get copyWith => _$LowStockSupplierCopyWithImpl<LowStockSupplier>(this as LowStockSupplier, _$identity);

  /// Serializes this LowStockSupplier to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LowStockSupplier;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowStockSupplier&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LowStockSupplier;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as LowStockSupplier;
  return 'LowStockSupplier(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $LowStockSupplierCopyWith<$Res>  {
  factory $LowStockSupplierCopyWith(LowStockSupplier value, $Res Function(LowStockSupplier) _then) = _$LowStockSupplierCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$LowStockSupplierCopyWithImpl<$Res>
    implements $LowStockSupplierCopyWith<$Res> {
  _$LowStockSupplierCopyWithImpl(this._self, this._then);

  final LowStockSupplier _self;
  final $Res Function(LowStockSupplier) _then;

/// Create a copy of LowStockSupplier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(LowStockSupplier(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LowStockSupplier].
extension LowStockSupplierPatterns on LowStockSupplier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LowStockSupplier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LowStockSupplier() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LowStockSupplier value)  $default,){
final _that = this;
switch (_that) {
case _LowStockSupplier():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LowStockSupplier value)?  $default,){
final _that = this;
switch (_that) {
case _LowStockSupplier() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LowStockSupplier() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _LowStockSupplier():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _LowStockSupplier() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LowStockSupplier implements LowStockSupplier {
  const _LowStockSupplier({required this.id, required this.name});
  factory _LowStockSupplier.fromJson(Map<String, dynamic> json) => _$LowStockSupplierFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of LowStockSupplier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LowStockSupplierCopyWith<_LowStockSupplier> get copyWith => __$LowStockSupplierCopyWithImpl<_LowStockSupplier>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LowStockSupplierToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LowStockSupplier&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'LowStockSupplier(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$LowStockSupplierCopyWith<$Res> implements $LowStockSupplierCopyWith<$Res> {
  factory _$LowStockSupplierCopyWith(_LowStockSupplier value, $Res Function(_LowStockSupplier) _then) = __$LowStockSupplierCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$LowStockSupplierCopyWithImpl<$Res>
    implements _$LowStockSupplierCopyWith<$Res> {
  __$LowStockSupplierCopyWithImpl(this._self, this._then);

  final _LowStockSupplier _self;
  final $Res Function(_LowStockSupplier) _then;

/// Create a copy of LowStockSupplier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_LowStockSupplier(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
