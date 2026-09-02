// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdersPagination _$OrdersPaginationFromJson(Map<String, dynamic> json) =>
    _OrdersPagination(
      currentPage: (json['current_page'] as num).toInt(),
      orders: (json['data'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$OrdersPaginationToJson(_OrdersPagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.orders,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    _OrdersResponse(
      data: json['data'] == null
          ? null
          : OrdersPagination.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$OrdersResponseToJson(_OrdersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
