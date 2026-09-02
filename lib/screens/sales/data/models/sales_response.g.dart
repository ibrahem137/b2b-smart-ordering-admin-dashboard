// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesPagination _$SalesPaginationFromJson(Map<String, dynamic> json) =>
    _SalesPagination(
      currentPage: (json['current_page'] as num).toInt(),
      sales: (json['data'] as List<dynamic>)
          .map((e) => SaleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$SalesPaginationToJson(_SalesPagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.sales,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_SalesResponse _$SalesResponseFromJson(Map<String, dynamic> json) =>
    _SalesResponse(
      data: json['data'] == null
          ? null
          : SalesPagination.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$SalesResponseToJson(_SalesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
