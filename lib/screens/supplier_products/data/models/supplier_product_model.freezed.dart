// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierProductModel {

 int get id;@JsonKey(name: 'supplier_id') int get supplierId;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'buy_price') String get buyPrice;@JsonKey(name: 'stock_quantity') int get stockQuantity; String get status;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; SupplierModel? get supplier; MasterProductModel? get product;
/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierProductModelCopyWith<SupplierProductModel> get copyWith => _$SupplierProductModelCopyWithImpl<SupplierProductModel>(this as SupplierProductModel, _$identity);

  /// Serializes this SupplierProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplierProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.supplierId, _this.supplierId) || other.supplierId == _this.supplierId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.buyPrice, _this.buyPrice) || other.buyPrice == _this.buyPrice)&&(identical(other.stockQuantity, _this.stockQuantity) || other.stockQuantity == _this.stockQuantity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.supplier, _this.supplier) || other.supplier == _this.supplier)&&(identical(other.product, _this.product) || other.product == _this.product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplierProductModel;
  return Object.hash(runtimeType,_this.id,_this.supplierId,_this.productId,_this.buyPrice,_this.stockQuantity,_this.status,_this.imageUrl,_this.createdAt,_this.updatedAt,_this.supplier,_this.product);
}

@override
String toString() {
  final _this = this as SupplierProductModel;
  return 'SupplierProductModel(id: ${_this.id}, supplierId: ${_this.supplierId}, productId: ${_this.productId}, buyPrice: ${_this.buyPrice}, stockQuantity: ${_this.stockQuantity}, status: ${_this.status}, imageUrl: ${_this.imageUrl}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, supplier: ${_this.supplier}, product: ${_this.product})';
}


}

/// @nodoc
abstract mixin class $SupplierProductModelCopyWith<$Res>  {
  factory $SupplierProductModelCopyWith(SupplierProductModel value, $Res Function(SupplierProductModel) _then) = _$SupplierProductModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'supplier_id') int supplierId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'buy_price') String buyPrice,@JsonKey(name: 'stock_quantity') int stockQuantity, String status,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, SupplierModel? supplier, MasterProductModel? product
});


$SupplierModelCopyWith<$Res>? get supplier;$MasterProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$SupplierProductModelCopyWithImpl<$Res>
    implements $SupplierProductModelCopyWith<$Res> {
  _$SupplierProductModelCopyWithImpl(this._self, this._then);

  final SupplierProductModel _self;
  final $Res Function(SupplierProductModel) _then;

/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? supplierId = null,Object? productId = null,Object? buyPrice = null,Object? stockQuantity = null,Object? status = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? supplier = freezed,Object? product = freezed,}) {
  return _then(SupplierProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierId: null == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,supplier: freezed == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as MasterProductModel?,
  ));
}
/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierModelCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
    return null;
  }

  return $SupplierModelCopyWith<$Res>(_self.supplier!, (value) {
    return _then(_self.copyWith(supplier: value));
  });
}/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $MasterProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupplierProductModel].
extension SupplierProductModelPatterns on SupplierProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierProductModel value)  $default,){
final _that = this;
switch (_that) {
case _SupplierProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  SupplierModel? supplier,  MasterProductModel? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierProductModel() when $default != null:
return $default(_that.id,_that.supplierId,_that.productId,_that.buyPrice,_that.stockQuantity,_that.status,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplier,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  SupplierModel? supplier,  MasterProductModel? product)  $default,) {final _that = this;
switch (_that) {
case _SupplierProductModel():
return $default(_that.id,_that.supplierId,_that.productId,_that.buyPrice,_that.stockQuantity,_that.status,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplier,_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  SupplierModel? supplier,  MasterProductModel? product)?  $default,) {final _that = this;
switch (_that) {
case _SupplierProductModel() when $default != null:
return $default(_that.id,_that.supplierId,_that.productId,_that.buyPrice,_that.stockQuantity,_that.status,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplier,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierProductModel implements SupplierProductModel {
  const _SupplierProductModel({required this.id, @JsonKey(name: 'supplier_id') required this.supplierId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'buy_price') required this.buyPrice, @JsonKey(name: 'stock_quantity') required this.stockQuantity, required this.status, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.supplier, this.product});
  factory _SupplierProductModel.fromJson(Map<String, dynamic> json) => _$SupplierProductModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'supplier_id') final  int supplierId;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'buy_price') final  String buyPrice;
@override@JsonKey(name: 'stock_quantity') final  int stockQuantity;
@override final  String status;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  SupplierModel? supplier;
@override final  MasterProductModel? product;

/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierProductModelCopyWith<_SupplierProductModel> get copyWith => __$SupplierProductModelCopyWithImpl<_SupplierProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.buyPrice, buyPrice) || other.buyPrice == buyPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.supplier, supplier) || other.supplier == supplier)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,supplierId,productId,buyPrice,stockQuantity,status,imageUrl,createdAt,updatedAt,supplier,product);
}

@override
String toString() {
    return 'SupplierProductModel(id: $id, supplierId: $supplierId, productId: $productId, buyPrice: $buyPrice, stockQuantity: $stockQuantity, status: $status, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, supplier: $supplier, product: $product)';
}


}

/// @nodoc
abstract mixin class _$SupplierProductModelCopyWith<$Res> implements $SupplierProductModelCopyWith<$Res> {
  factory _$SupplierProductModelCopyWith(_SupplierProductModel value, $Res Function(_SupplierProductModel) _then) = __$SupplierProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'supplier_id') int supplierId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'buy_price') String buyPrice,@JsonKey(name: 'stock_quantity') int stockQuantity, String status,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, SupplierModel? supplier, MasterProductModel? product
});


@override $SupplierModelCopyWith<$Res>? get supplier;@override $MasterProductModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$SupplierProductModelCopyWithImpl<$Res>
    implements _$SupplierProductModelCopyWith<$Res> {
  __$SupplierProductModelCopyWithImpl(this._self, this._then);

  final _SupplierProductModel _self;
  final $Res Function(_SupplierProductModel) _then;

/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? supplierId = null,Object? productId = null,Object? buyPrice = null,Object? stockQuantity = null,Object? status = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? supplier = freezed,Object? product = freezed,}) {
  return _then(_SupplierProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierId: null == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,supplier: freezed == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as MasterProductModel?,
  ));
}

/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierModelCopyWith<$Res>? get supplier {
    if (_self.supplier == null) {
    return null;
  }

  return $SupplierModelCopyWith<$Res>(_self.supplier!, (value) {
    return _then(_self.copyWith(supplier: value));
  });
}/// Create a copy of SupplierProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $MasterProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
