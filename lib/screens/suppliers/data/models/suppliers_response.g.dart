// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suppliers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuppliersPagination _$SuppliersPaginationFromJson(Map<String, dynamic> json) =>
    _SuppliersPagination(
      currentPage: (json['current_page'] as num).toInt(),
      suppliers: (json['data'] as List<dynamic>)
          .map((e) => SupplierModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$SuppliersPaginationToJson(
  _SuppliersPagination instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.suppliers,
  'from': instance.from,
  'last_page': instance.lastPage,
  'next_page_url': instance.nextPageUrl,
  'path': instance.path,
  'per_page': instance.perPage,
  'prev_page_url': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};

_SuppliersResponse _$SuppliersResponseFromJson(Map<String, dynamic> json) =>
    _SuppliersResponse(
      data: json['data'] == null
          ? null
          : SuppliersPagination.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$SuppliersResponseToJson(_SuppliersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
