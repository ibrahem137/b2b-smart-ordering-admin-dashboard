// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierOffersPagination _$SupplierOffersPaginationFromJson(
  Map<String, dynamic> json,
) => _SupplierOffersPagination(
  currentPage: (json['current_page'] as num).toInt(),
  offers: (json['data'] as List<dynamic>)
      .map((e) => SupplierOfferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$SupplierOffersPaginationToJson(
  _SupplierOffersPagination instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.offers,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
};

_SupplierOffersResponse _$SupplierOffersResponseFromJson(
  Map<String, dynamic> json,
) => _SupplierOffersResponse(
  data: SupplierOffersPagination.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$SupplierOffersResponseToJson(
  _SupplierOffersResponse instance,
) => <String, dynamic>{'data': instance.data, 'message': instance.message};
