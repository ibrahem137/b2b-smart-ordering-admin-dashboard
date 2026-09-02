// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsPagination _$ProductsPaginationFromJson(Map<String, dynamic> json) =>
    _ProductsPagination(
      currentPage: (json['current_page'] as num).toInt(),
      products: (json['data'] as List<dynamic>)
          .map((e) => MasterProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$ProductsPaginationToJson(_ProductsPagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.products,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    _ProductsResponse(
      data: json['data'] == null
          ? null
          : ProductsPagination.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$ProductsResponseToJson(_ProductsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
