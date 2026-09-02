import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_products_response.freezed.dart';
part 'supplier_products_response.g.dart';

@freezed
abstract class SupplierProductsPagination with _$SupplierProductsPagination {
  const factory SupplierProductsPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<SupplierProductModel> supplierProducts,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _SupplierProductsPagination;

  factory SupplierProductsPagination.fromJson(Map<String, dynamic> json) =>
      _$SupplierProductsPaginationFromJson(json);
}

@freezed
abstract class SupplierProductsResponse with _$SupplierProductsResponse {
  const factory SupplierProductsResponse({
    SupplierProductsPagination? data,
    String? message,
    dynamic errors,
  }) = _SupplierProductsResponse;

  factory SupplierProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierProductsResponseFromJson(json);
}
