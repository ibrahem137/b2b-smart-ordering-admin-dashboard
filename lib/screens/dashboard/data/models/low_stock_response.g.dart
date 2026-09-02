// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'low_stock_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LowStockCategory _$LowStockCategoryFromJson(Map<String, dynamic> json) =>
    _LowStockCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$LowStockCategoryToJson(_LowStockCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

_LowStockData _$LowStockDataFromJson(Map<String, dynamic> json) =>
    _LowStockData(
      threshold: (json['threshold'] as num?)?.toInt() ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => LowStockItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LowStockDataToJson(_LowStockData instance) =>
    <String, dynamic>{'threshold': instance.threshold, 'items': instance.items};

_LowStockItem _$LowStockItemFromJson(Map<String, dynamic> json) =>
    _LowStockItem(
      id: (json['id'] as num).toInt(),
      supplierId: (json['supplier_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      buyPrice: json['buy_price'] as String,
      stockQuantity: (json['stock_quantity'] as num?)?.toInt() ?? 0,
      status: json['status'] as String,
      supplier: json['supplier'] == null
          ? null
          : LowStockSupplier.fromJson(json['supplier'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : LowStockProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LowStockItemToJson(_LowStockItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplier_id': instance.supplierId,
      'product_id': instance.productId,
      'buy_price': instance.buyPrice,
      'stock_quantity': instance.stockQuantity,
      'status': instance.status,
      'supplier': instance.supplier,
      'product': instance.product,
    };

_LowStockProduct _$LowStockProductFromJson(Map<String, dynamic> json) =>
    _LowStockProduct(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      category: json['category'] == null
          ? null
          : LowStockCategory.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LowStockProductToJson(_LowStockProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
      'category': instance.category,
    };

_LowStockResponse _$LowStockResponseFromJson(Map<String, dynamic> json) =>
    _LowStockResponse(
      data: json['data'] == null
          ? null
          : LowStockData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$LowStockResponseToJson(_LowStockResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };

_LowStockSupplier _$LowStockSupplierFromJson(Map<String, dynamic> json) =>
    _LowStockSupplier(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LowStockSupplierToJson(_LowStockSupplier instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
