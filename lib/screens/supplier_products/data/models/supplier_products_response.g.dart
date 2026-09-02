// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierProductsPagination _$SupplierProductsPaginationFromJson(
  Map<String, dynamic> json,
) => _SupplierProductsPagination(
  currentPage: (json['current_page'] as num).toInt(),
  supplierProducts: (json['data'] as List<dynamic>)
      .map((e) => SupplierProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$SupplierProductsPaginationToJson(
  _SupplierProductsPagination instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.supplierProducts,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
};

_SupplierProductsResponse _$SupplierProductsResponseFromJson(
  Map<String, dynamic> json,
) => _SupplierProductsResponse(
  data: json['data'] == null
      ? null
      : SupplierProductsPagination.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  message: json['message'] as String?,
  errors: json['errors'],
);

Map<String, dynamic> _$SupplierProductsResponseToJson(
  _SupplierProductsResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'errors': instance.errors,
};
