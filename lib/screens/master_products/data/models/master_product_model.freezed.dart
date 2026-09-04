// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MasterProductModel {

 int get id;@JsonKey(name: 'supplier_id') int get supplierId;@JsonKey(name: 'category_id') int get categoryId; String get name; String? get description;@JsonKey(name: 'buy_price') String get buyPrice;@JsonKey(name: 'stock_quantity') int get stockQuantity; String get status;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; SupplierModel? get supplier; CategoryModel? get category;
/// Create a copy of MasterProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterProductModelCopyWith<MasterProductModel> get copyWith => _$MasterProductModelCopyWithImpl<MasterProductModel>(this as MasterProductModel, _$identity);

  /// Serializes this MasterProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MasterProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.supplierId, _this.supplierId) || other.supplierId == _this.supplierId)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.buyPrice, _this.buyPrice) || other.buyPrice == _this.buyPrice)&&(identical(other.stockQuantity, _this.stockQuantity) || other.stockQuantity == _this.stockQuantity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.supplier, _this.supplier) || other.supplier == _this.supplier)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MasterProductModel;
  return Object.hash(runtimeType,_this.id,_this.supplierId,_this.categoryId,_this.name,_this.description,_this.buyPrice,_this.stockQuantity,_this.status,_this.imageUrl,_this.createdAt,_this.updatedAt,_this.supplier,_this.category);
}

@override
String toString() {
  final _this = this as MasterProductModel;
  return 'MasterProductModel(id: ${_this.id}, supplierId: ${_this.supplierId}, categoryId: ${_this.categoryId}, name: ${_this.name}, description: ${_this.description}, buyPrice: ${_this.buyPrice}, stockQuantity: ${_this.stockQuantity}, status: ${_this.status}, imageUrl: ${_this.imageUrl}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, supplier: ${_this.supplier}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $MasterProductModelCopyWith<$Res>  {
  factory $MasterProductModelCopyWith(MasterProductModel value, $Res Function(MasterProductModel) _then) = _$MasterProductModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'supplier_id') int supplierId,@JsonKey(name: 'category_id') int categoryId, String name, String? description,@JsonKey(name: 'buy_price') String buyPrice,@JsonKey(name: 'stock_quantity') int stockQuantity, String status,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, SupplierModel? supplier, CategoryModel? category
});


$SupplierModelCopyWith<$Res>? get supplier;$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$MasterProductModelCopyWithImpl<$Res>
    implements $MasterProductModelCopyWith<$Res> {
  _$MasterProductModelCopyWithImpl(this._self, this._then);

  final MasterProductModel _self;
  final $Res Function(MasterProductModel) _then;

/// Create a copy of MasterProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? supplierId = null,Object? categoryId = null,Object? name = null,Object? description = freezed,Object? buyPrice = null,Object? stockQuantity = null,Object? status = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? supplier = freezed,Object? category = freezed,}) {
  return _then(MasterProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierId: null == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,supplier: freezed == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}
/// Create a copy of MasterProductModel
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
}/// Create a copy of MasterProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [MasterProductModel].
extension MasterProductModelPatterns on MasterProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterProductModel value)  $default,){
final _that = this;
switch (_that) {
case _MasterProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _MasterProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'category_id')  int categoryId,  String name,  String? description, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  SupplierModel? supplier,  CategoryModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterProductModel() when $default != null:
return $default(_that.id,_that.supplierId,_that.categoryId,_that.name,_that.description,_that.buyPrice,_that.stockQuantity,_that.status,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplier,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'category_id')  int categoryId,  String name,  String? description, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  SupplierModel? supplier,  CategoryModel? category)  $default,) {final _that = this;
switch (_that) {
case _MasterProductModel():
return $default(_that.id,_that.supplierId,_that.categoryId,_that.name,_that.description,_that.buyPrice,_that.stockQuantity,_that.status,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplier,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'supplier_id')  int supplierId, @JsonKey(name: 'category_id')  int categoryId,  String name,  String? description, @JsonKey(name: 'buy_price')  String buyPrice, @JsonKey(name: 'stock_quantity')  int stockQuantity,  String status, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  SupplierModel? supplier,  CategoryModel? category)?  $default,) {final _that = this;
switch (_that) {
case _MasterProductModel() when $default != null:
return $default(_that.id,_that.supplierId,_that.categoryId,_that.name,_that.description,_that.buyPrice,_that.stockQuantity,_that.status,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.supplier,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MasterProductModel implements MasterProductModel {
  const _MasterProductModel({required this.id, @JsonKey(name: 'supplier_id') required this.supplierId, @JsonKey(name: 'category_id') required this.categoryId, required this.name, this.description, @JsonKey(name: 'buy_price') required this.buyPrice, @JsonKey(name: 'stock_quantity') required this.stockQuantity, required this.status, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.supplier, this.category});
  factory _MasterProductModel.fromJson(Map<String, dynamic> json) => _$MasterProductModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'supplier_id') final  int supplierId;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'buy_price') final  String buyPrice;
@override@JsonKey(name: 'stock_quantity') final  int stockQuantity;
@override final  String status;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  SupplierModel? supplier;
@override final  CategoryModel? category;

/// Create a copy of MasterProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterProductModelCopyWith<_MasterProductModel> get copyWith => __$MasterProductModelCopyWithImpl<_MasterProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MasterProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.buyPrice, buyPrice) || other.buyPrice == buyPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.supplier, supplier) || other.supplier == supplier)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,supplierId,categoryId,name,description,buyPrice,stockQuantity,status,imageUrl,createdAt,updatedAt,supplier,category);
}

@override
String toString() {
    return 'MasterProductModel(id: $id, supplierId: $supplierId, categoryId: $categoryId, name: $name, description: $description, buyPrice: $buyPrice, stockQuantity: $stockQuantity, status: $status, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, supplier: $supplier, category: $category)';
}


}

/// @nodoc
abstract mixin class _$MasterProductModelCopyWith<$Res> implements $MasterProductModelCopyWith<$Res> {
  factory _$MasterProductModelCopyWith(_MasterProductModel value, $Res Function(_MasterProductModel) _then) = __$MasterProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'supplier_id') int supplierId,@JsonKey(name: 'category_id') int categoryId, String name, String? description,@JsonKey(name: 'buy_price') String buyPrice,@JsonKey(name: 'stock_quantity') int stockQuantity, String status,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, SupplierModel? supplier, CategoryModel? category
});


@override $SupplierModelCopyWith<$Res>? get supplier;@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$MasterProductModelCopyWithImpl<$Res>
    implements _$MasterProductModelCopyWith<$Res> {
  __$MasterProductModelCopyWithImpl(this._self, this._then);

  final _MasterProductModel _self;
  final $Res Function(_MasterProductModel) _then;

/// Create a copy of MasterProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? supplierId = null,Object? categoryId = null,Object? name = null,Object? description = freezed,Object? buyPrice = null,Object? stockQuantity = null,Object? status = null,Object? imageUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? supplier = freezed,Object? category = freezed,}) {
  return _then(_MasterProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,supplierId: null == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,buyPrice: null == buyPrice ? _self.buyPrice : buyPrice // ignore: cast_nullable_to_non_nullable
as String,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,supplier: freezed == supplier ? _self.supplier : supplier // ignore: cast_nullable_to_non_nullable
as SupplierModel?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of MasterProductModel
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
}/// Create a copy of MasterProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
