import 'package:dashboard/screens/master_products/data/models/master_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_response.freezed.dart';
part 'products_response.g.dart';

@freezed
abstract class ProductsPagination with _$ProductsPagination {
  const factory ProductsPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<MasterProductModel> products,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _ProductsPagination;

  factory ProductsPagination.fromJson(Map<String, dynamic> json) =>
      _$ProductsPaginationFromJson(json);
}

@freezed
abstract class ProductsResponse with _$ProductsResponse {
  const factory ProductsResponse({
    ProductsPagination? data,
    String? message,
    dynamic errors,
  }) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}
