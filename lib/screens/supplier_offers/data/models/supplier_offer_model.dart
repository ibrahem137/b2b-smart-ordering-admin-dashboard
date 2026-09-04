import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_offer_model.freezed.dart';
part 'supplier_offer_model.g.dart';

@freezed
abstract class SupplierOfferModel with _$SupplierOfferModel {
  const factory SupplierOfferModel({
    required int id,

    @JsonKey(name: 'supplier_product_id') required int supplierProductId,

    @JsonKey(name: 'offer_price') required String offerPrice,

    @JsonKey(name: 'offer_stock') int? offerStock,

    required String status,

    @JsonKey(name: 'expires_at') String? expiresAt,

    @JsonKey(name: 'image_url') String? imageUrl,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,

    @JsonKey(name: 'supplier_product') SupplierProductModel? supplierProduct,
  }) = _SupplierOfferModel;

  factory SupplierOfferModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierOfferModelFromJson(json);
}
