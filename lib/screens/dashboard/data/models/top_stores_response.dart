import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_stores_response.freezed.dart';
part 'top_stores_response.g.dart';

@freezed
abstract class TopStoreItem with _$TopStoreItem {
  const factory TopStoreItem({
    @JsonKey(name: 'store_id') required int storeId,

    @JsonKey(name: 'total_sales') @Default(0) double totalSales,

    @JsonKey(name: 'total_profit') @Default(0) double totalProfit,

    TopStoreModel? store,
  }) = _TopStoreItem;

  factory TopStoreItem.fromJson(Map<String, dynamic> json) =>
      _$TopStoreItemFromJson(json);
}

@freezed
abstract class TopStoreModel with _$TopStoreModel {
  const factory TopStoreModel({
    required int id,
    required String name,
    String? email,
  }) = _TopStoreModel;

  factory TopStoreModel.fromJson(Map<String, dynamic> json) =>
      _$TopStoreModelFromJson(json);
}

@freezed
abstract class TopStoresResponse with _$TopStoresResponse {
  const factory TopStoresResponse({
    @Default([]) List<TopStoreItem> data,

    String? message,
    dynamic errors,
  }) = _TopStoresResponse;

  factory TopStoresResponse.fromJson(Map<String, dynamic> json) =>
      _$TopStoresResponseFromJson(json);
}
