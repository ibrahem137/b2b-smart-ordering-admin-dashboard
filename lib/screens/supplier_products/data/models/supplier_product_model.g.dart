// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierProductModel _$SupplierProductModelFromJson(
  Map<String, dynamic> json,
) => _SupplierProductModel(
  id: (json['id'] as num).toInt(),
  supplierId: (json['supplier_id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  buyPrice: json['buy_price'] as String,
  stockQuantity: (json['stock_quantity'] as num).toInt(),
  status: json['status'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  supplier: json['supplier'] == null
      ? null
      : SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
  product: json['product'] == null
      ? null
      : MasterProductModel.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SupplierProductModelToJson(
  _SupplierProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'supplier_id': instance.supplierId,
  'product_id': instance.productId,
  'buy_price': instance.buyPrice,
  'stock_quantity': instance.stockQuantity,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'supplier': instance.supplier,
  'product': instance.product,
};
