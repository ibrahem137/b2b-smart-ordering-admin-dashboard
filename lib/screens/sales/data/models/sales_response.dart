import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_response.freezed.dart';
part 'sales_response.g.dart';

@freezed
abstract class SalesPagination with _$SalesPagination {
  const factory SalesPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<SaleModel> sales,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _SalesPagination;

  factory SalesPagination.fromJson(Map<String, dynamic> json) =>
      _$SalesPaginationFromJson(json);
}

@freezed
abstract class SalesResponse with _$SalesResponse {
  const factory SalesResponse({
    SalesPagination? data,
    String? message,
    dynamic errors,
  }) = _SalesResponse;

  factory SalesResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesResponseFromJson(json);
}
