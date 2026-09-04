// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MasterProductModel _$MasterProductModelFromJson(Map<String, dynamic> json) =>
    _MasterProductModel(
      id: (json['id'] as num).toInt(),
      supplierId: (json['supplier_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      buyPrice: json['buy_price'] as String,
      stockQuantity: (json['stock_quantity'] as num).toInt(),
      status: json['status'] as String,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      supplier: json['supplier'] == null
          ? null
          : SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterProductModelToJson(_MasterProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier_id': instance.supplierId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'buy_price': instance.buyPrice,
      'stock_quantity': instance.stockQuantity,
      'status': instance.status,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'supplier': instance.supplier,
      'category': instance.category,
    };
