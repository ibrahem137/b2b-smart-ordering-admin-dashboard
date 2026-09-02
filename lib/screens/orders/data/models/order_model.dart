import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,

    @JsonKey(name: 'store_id') required int storeId,

    @JsonKey(name: 'supplier_id') required int supplierId,

    required String status,

    @JsonKey(name: 'total_buy') required String totalBuy,

    @JsonKey(name: 'total_sell') String? totalSell,

    String? notes,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,

    StoreModel? store,

    SupplierModel? supplier,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
abstract class StoreModel with _$StoreModel {
  const factory StoreModel({
    required int id,
    required String name,

    @JsonKey(name: 'owner_name') String? ownerName,

    String? phone,
    String? email,
    String? address,
    String? status,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}
