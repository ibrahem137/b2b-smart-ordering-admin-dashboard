import 'package:dashboard/screens/master_products/data/models/master_product_model.dart';
import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_product_model.freezed.dart';
part 'supplier_product_model.g.dart';

@freezed
abstract class SupplierProductModel with _$SupplierProductModel {
  const factory SupplierProductModel({
    required int id,

    @JsonKey(name: 'supplier_id') required int supplierId,

    @JsonKey(name: 'product_id') required int productId,

    @JsonKey(name: 'buy_price') required String buyPrice,

    @JsonKey(name: 'stock_quantity') required int stockQuantity,

    required String status,

    @JsonKey(name: 'image_url') String? imageUrl,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,

    SupplierModel? supplier,

    MasterProductModel? product,
  }) = _SupplierProductModel;

  factory SupplierProductModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierProductModelFromJson(json);
}
