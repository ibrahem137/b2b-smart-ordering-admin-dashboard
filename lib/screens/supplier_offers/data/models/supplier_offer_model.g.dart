// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierOfferModel _$SupplierOfferModelFromJson(Map<String, dynamic> json) =>
    _SupplierOfferModel(
      id: (json['id'] as num).toInt(),
      supplierProductId: (json['supplier_product_id'] as num).toInt(),
      offerPrice: json['offer_price'] as String,
      offerStock: (json['offer_stock'] as num?)?.toInt(),
      status: json['status'] as String,
      expiresAt: json['expires_at'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      supplierProduct: json['supplier_product'] == null
          ? null
          : SupplierProductModel.fromJson(
              json['supplier_product'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SupplierOfferModelToJson(_SupplierOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier_product_id': instance.supplierProductId,
      'offer_price': instance.offerPrice,
      'offer_stock': instance.offerStock,
      'status': instance.status,
      'expires_at': instance.expiresAt,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'supplier_product': instance.supplierProduct,
    };
