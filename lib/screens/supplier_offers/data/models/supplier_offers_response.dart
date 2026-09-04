import 'package:dashboard/screens/supplier_offers/data/models/supplier_offer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_offers_response.freezed.dart';
part 'supplier_offers_response.g.dart';

@freezed
abstract class SupplierOffersPagination with _$SupplierOffersPagination {
  const factory SupplierOffersPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<SupplierOfferModel> offers,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _SupplierOffersPagination;

  factory SupplierOffersPagination.fromJson(Map<String, dynamic> json) =>
      _$SupplierOffersPaginationFromJson(json);
}

@freezed
abstract class SupplierOffersResponse with _$SupplierOffersResponse {
  const factory SupplierOffersResponse({
    required SupplierOffersPagination data,
    String? message,
  }) = _SupplierOffersResponse;

  factory SupplierOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$SupplierOffersResponseFromJson(json);
}
