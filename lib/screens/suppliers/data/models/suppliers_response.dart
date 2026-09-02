import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suppliers_response.freezed.dart';
part 'suppliers_response.g.dart';

@freezed
abstract class SuppliersPagination with _$SuppliersPagination {
  const factory SuppliersPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<SupplierModel> suppliers,

    @JsonKey(name: 'from') int? from,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'next_page_url') String? nextPageUrl,

    @JsonKey(name: 'path') String? path,

    @JsonKey(name: 'per_page') required int perPage,

    @JsonKey(name: 'prev_page_url') String? prevPageUrl,

    @JsonKey(name: 'to') int? to,

    required int total,
  }) = _SuppliersPagination;

  factory SuppliersPagination.fromJson(Map<String, dynamic> json) =>
      _$SuppliersPaginationFromJson(json);
}

@freezed
abstract class SuppliersResponse with _$SuppliersResponse {
  const factory SuppliersResponse({
    SuppliersPagination? data,
    String? message,
    dynamic errors,
  }) = _SuppliersResponse;

  factory SuppliersResponse.fromJson(Map<String, dynamic> json) =>
      _$SuppliersResponseFromJson(json);
}
