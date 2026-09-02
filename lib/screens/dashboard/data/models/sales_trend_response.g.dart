// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_trend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesTrendItem _$SalesTrendItemFromJson(Map<String, dynamic> json) =>
    _SalesTrendItem(
      month: json['month'] as String,
      total: json['total'] as String,
      profit: json['profit'] as String,
    );

Map<String, dynamic> _$SalesTrendItemToJson(_SalesTrendItem instance) =>
    <String, dynamic>{
      'month': instance.month,
      'total': instance.total,
      'profit': instance.profit,
    };

_SalesTrendResponse _$SalesTrendResponseFromJson(Map<String, dynamic> json) =>
    _SalesTrendResponse(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => SalesTrendItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$SalesTrendResponseToJson(_SalesTrendResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
