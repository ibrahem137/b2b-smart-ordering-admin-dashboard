import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_product_model.freezed.dart';
part 'master_product_model.g.dart';

@freezed
abstract class MasterProductModel
    with _$MasterProductModel {
  const factory MasterProductModel({
    required int id,

    @JsonKey(name: 'supplier_id') required int supplierId,

    @JsonKey(name: 'category_id') required int categoryId,

    required String name,

    String? description,

    @JsonKey(name: 'buy_price') required String buyPrice,

    @JsonKey(name: 'stock_quantity')
    required int stockQuantity,

    required String status,

    @JsonKey(name: 'image_url') String? imageUrl,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,

    SupplierModel? supplier,

    CategoryModel? category,
  }) = _MasterProductModel;

  factory MasterProductModel.fromJson(
    Map<String, dynamic> json,
  ) => _$MasterProductModelFromJson(json);
}
