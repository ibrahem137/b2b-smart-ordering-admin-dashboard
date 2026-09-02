import 'package:freezed_annotation/freezed_annotation.dart';

part 'low_stock_response.freezed.dart';
part 'low_stock_response.g.dart';

@freezed
abstract class LowStockCategory with _$LowStockCategory {
  const factory LowStockCategory({
    required int id,
    required String name,

    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _LowStockCategory;

  factory LowStockCategory.fromJson(Map<String, dynamic> json) =>
      _$LowStockCategoryFromJson(json);
}

@freezed
abstract class LowStockData with _$LowStockData {
  const factory LowStockData({
    @Default(0) int threshold,

    @Default([]) List<LowStockItem> items,
  }) = _LowStockData;

  factory LowStockData.fromJson(Map<String, dynamic> json) =>
      _$LowStockDataFromJson(json);
}

@freezed
abstract class LowStockItem with _$LowStockItem {
  const factory LowStockItem({
    required int id,

    @JsonKey(name: 'supplier_id') required int supplierId,

    @JsonKey(name: 'product_id') required int productId,

    @JsonKey(name: 'buy_price') required String buyPrice,

    @JsonKey(name: 'stock_quantity') @Default(0) int stockQuantity,

    required String status,

    LowStockSupplier? supplier,

    LowStockProduct? product,
  }) = _LowStockItem;

  factory LowStockItem.fromJson(Map<String, dynamic> json) =>
      _$LowStockItemFromJson(json);
}

@freezed
abstract class LowStockProduct with _$LowStockProduct {
  const factory LowStockProduct({
    required int id,
    required String name,

    @JsonKey(name: 'category_id') required int categoryId,

    LowStockCategory? category,
  }) = _LowStockProduct;

  factory LowStockProduct.fromJson(Map<String, dynamic> json) =>
      _$LowStockProductFromJson(json);
}

@freezed
abstract class LowStockResponse with _$LowStockResponse {
  const factory LowStockResponse({
    LowStockData? data,
    String? message,
    dynamic errors,
  }) = _LowStockResponse;

  factory LowStockResponse.fromJson(Map<String, dynamic> json) =>
      _$LowStockResponseFromJson(json);
}

@freezed
abstract class LowStockSupplier with _$LowStockSupplier {
  const factory LowStockSupplier({required int id, required String name}) =
      _LowStockSupplier;

  factory LowStockSupplier.fromJson(Map<String, dynamic> json) =>
      _$LowStockSupplierFromJson(json);
}
