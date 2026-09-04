// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierOfferModel {

 int get id;@JsonKey(name: 'supplier_product_id') int get supplierProductId;@JsonKey(name: 'offer_price') String get offerPrice;@JsonKey(name: 'offer_stock') int? get offerStock; String get status;@JsonKey(name: 'expires_at') String? get expiresAt;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'supplier_product') SupplierProductModel? get supplierProduct;
/// Create a copy of SupplierOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOfferModelCopyWith<SupplierOfferModel> get copyWith => _$SupplierOfferModelCopyWithImpl<SupplierOfferModel>(this as SupplierOfferModel, _$identity);

  /// Serializes this SupplierOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupplierOfferModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOfferModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.supplierProductId, _this.supplierProductId) || other.supplierProductId == _this.supplierProductId)&&(identical(other.offerPrice, _this.offerPrice) || other.offerPrice == _this.offerPrice)&&(identical(other.offerStock, _this.offerStock) || other.offerStock == _this.offerStock)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.supplierProduct, _this.supplierProduct) || other.supplierProduct == _this.supplierProduct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupplierOfferModel;
  return Object.hash(runtimeType,_this.id,_this.supplierProductId,_this.offerPrice,_this.offerStock,_this.status,_this.expiresAt,_this.imageUrl,_this.createdAt,_this.updatedAt,_this.supplierProduct);
}

@override
String toString() {
  final _this = this as SupplierOfferModel;
  return 'SupplierOfferModel(id: ${_this.id}, supplierProductId: ${_this.supplierProductId}, offerPrice: ${_this.offerPrice}, offerStock: ${_this.offerStock}, status: ${_this.status}, expiresAt: ${_this.expiresAt}, imageUrl: ${_this.imageUrl}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, supplierProduct: ${_this.supplierProduct})';
}


}

/// @nodoc
abstract mixin class $SupplierOfferModelCopyWith<$Res>  {
  factory $SupplierOfferModelCopyWith(SupplierOfferModel value, $Res Function(SupplierOfferModel) _then) = _$SupplierOfferModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'supplier_product_id') int supplierProductId,@JsonKey(name: 'offer_price') String offerPrice,@JsonKey(name: 'offer_stock') int? offerStock, String status,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'supplier_product') SupplierProductModel? supplierProduct
});


$SupplierProductModelCopyWith<$Res>? get supplierProduct;

}
/// @nodoc
class _$SupplierOfferModelCopyWithImpl<$Res>
    implements $SupplierOfferModelCopyWith<$Res> {
  _$SupplierOfferModelCopyWithImpl(this._self, this._then);

  final SupplierOfferModel _self;
  final $Res Function(SupplierOfferModel) _then;

/// Create a copy of SupplierOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? supplierProductId = null,Object? offerPrice = null,Object? offerStock = freezed,Object? status = null,Object? expiresAt = freezed,Object? imageUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? supplierProduct = freezed,}) {
  return _then(SupplierOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierProductId: null == supplierProductId ? _self.supplierProductId : supplierProductId // ignore: cast_nullable_to_non_nullable
as int,offerPrice: null == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as String,offerStock: freezed == offerStock ? _self.offerStock : offerStock // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,supplierProduct: freezed == supplierProduct ? _self.supplierProduct : supplierProduct // ignore: cast_nullable_to_non_nullable
as SupplierProductModel?,
  ));
}
/// Create a copy of SupplierOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierProductModelCopyWith<$Res>? get supplierProduct {
    if (_self.supplierProduct == null) {
    return null;
  }

  return $SupplierProductModelCopyWith<$Res>(_self.supplierProduct!, (value) {
    return _then(_self.copyWith(supplierProduct: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupplierOfferModel].
extension SupplierOfferModelPatterns on SupplierOfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierOfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierOfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierOfferModel value)  $default,){
final _that = this;
switch (_that) {
case _SupplierOfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierOfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierOfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_product_id')  int supplierProductId, @JsonKey(name: 'offer_price')  String offerPrice, @JsonKey(name: 'offer_stock')  int? offerStock,  String status, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'supplier_product')  SupplierProductModel? supplierProduct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierOfferModel() when $default != null:
return $default(_that.id,_that.supplierProductId,_that.offerPrice,_that.offerStock,_that.status,_that.expiresAt,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplierProduct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_product_id')  int supplierProductId, @JsonKey(name: 'offer_price')  String offerPrice, @JsonKey(name: 'offer_stock')  int? offerStock,  String status, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'supplier_product')  SupplierProductModel? supplierProduct)  $default,) {final _that = this;
switch (_that) {
case _SupplierOfferModel():
return $default(_that.id,_that.supplierProductId,_that.offerPrice,_that.offerStock,_that.status,_that.expiresAt,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplierProduct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'supplier_product_id')  int supplierProductId, @JsonKey(name: 'offer_price')  String offerPrice, @JsonKey(name: 'offer_stock')  int? offerStock,  String status, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'supplier_product')  SupplierProductModel? supplierProduct)?  $default,) {final _that = this;
switch (_that) {
case _SupplierOfferModel() when $default != null:
return $default(_that.id,_that.supplierProductId,_that.offerPrice,_that.offerStock,_that.status,_that.expiresAt,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplierProduct);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierOfferModel implements SupplierOfferModel {
  const _SupplierOfferModel({required this.id, @JsonKey(name: 'supplier_product_id') required this.supplierProductId, @JsonKey(name: 'offer_price') required this.offerPrice, @JsonKey(name: 'offer_stock') this.offerStock, required this.status, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'supplier_product') this.supplierProduct});
  factory _SupplierOfferModel.fromJson(Map<String, dynamic> json) => _$SupplierOfferModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'supplier_product_id') final  int supplierProductId;
@override@JsonKey(name: 'offer_price') final  String offerPrice;
@override@JsonKey(name: 'offer_stock') final  int? offerStock;
@override final  String status;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'supplier_product') final  SupplierProductModel? supplierProduct;

/// Create a copy of SupplierOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierOfferModelCopyWith<_SupplierOfferModel> get copyWith => __$SupplierOfferModelCopyWithImpl<_SupplierOfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierOfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.supplierProductId, supplierProductId) || other.supplierProductId == supplierProductId)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.offerStock, offerStock) || other.offerStock == offerStock)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.supplierProduct, supplierProduct) || other.supplierProduct == supplierProduct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,supplierProductId,offerPrice,offerStock,status,expiresAt,imageUrl,createdAt,updatedAt,supplierProduct);
}

@override
String toString() {
    return 'SupplierOfferModel(id: $id, supplierProductId: $supplierProductId, offerPrice: $offerPrice, offerStock: $offerStock, status: $status, expiresAt: $expiresAt, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, supplierProduct: $supplierProduct)';
}


}

/// @nodoc
abstract mixin class _$SupplierOfferModelCopyWith<$Res> implements $SupplierOfferModelCopyWith<$Res> {
  factory _$SupplierOfferModelCopyWith(_SupplierOfferModel value, $Res Function(_SupplierOfferModel) _then) = __$SupplierOfferModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'supplier_product_id') int supplierProductId,@JsonKey(name: 'offer_price') String offerPrice,@JsonKey(name: 'offer_stock') int? offerStock, String status,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'supplier_product') SupplierProductModel? supplierProduct
});


@override $SupplierProductModelCopyWith<$Res>? get supplierProduct;

}
/// @nodoc
class __$SupplierOfferModelCopyWithImpl<$Res>
    implements _$SupplierOfferModelCopyWith<$Res> {
  __$SupplierOfferModelCopyWithImpl(this._self, this._then);

  final _SupplierOfferModel _self;
  final $Res Function(_SupplierOfferModel) _then;

/// Create a copy of SupplierOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? supplierProductId = null,Object? offerPrice = null,Object? offerStock = freezed,Object? status = null,Object? expiresAt = freezed,Object? imageUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? supplierProduct = freezed,}) {
  return _then(_SupplierOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierProductId: null == supplierProductId ? _self.supplierProductId : supplierProductId // ignore: cast_nullable_to_non_nullable
as int,offerPrice: null == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as String,offerStock: freezed == offerStock ? _self.offerStock : offerStock // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,supplierProduct: freezed == supplierProduct ? _self.supplierProduct : supplierProduct // ignore: cast_nullable_to_non_nullable
as SupplierProductModel?,
  ));
}

/// Create a copy of SupplierOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupplierProductModelCopyWith<$Res>? get supplierProduct {
    if (_self.supplierProduct == null) {
    return null;
  }

  return $SupplierProductModelCopyWith<$Res>(_self.supplierProduct!, (value) {
    return _then(_self.copyWith(supplierProduct: value));
  });
}
}

// dart format on
