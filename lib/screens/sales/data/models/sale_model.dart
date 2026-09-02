import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required int id,

    @JsonKey(name: 'store_id') required int storeId,

    required String name,

    String? phone,
    String? email,
    String? address,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    required int id,

    @JsonKey(name: 'store_id') required int storeId,

    @JsonKey(name: 'customer_id') required int customerId,

    required String status,

    required String total,

    @JsonKey(name: 'total_cost') required String totalCost,

    required String profit,

    @JsonKey(name: 'paid_amount') required String paidAmount,

    String? notes,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,

    StoreModel? store,

    CustomerModel? customer,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
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
