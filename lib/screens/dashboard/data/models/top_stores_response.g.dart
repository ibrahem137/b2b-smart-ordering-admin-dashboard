// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_stores_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopStoreItem _$TopStoreItemFromJson(Map<String, dynamic> json) =>
    _TopStoreItem(
      storeId: (json['store_id'] as num).toInt(),
      totalSales: (json['total_sales'] as num?)?.toDouble() ?? 0,
      totalProfit: (json['total_profit'] as num?)?.toDouble() ?? 0,
      store: json['store'] == null
          ? null
          : TopStoreModel.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopStoreItemToJson(_TopStoreItem instance) =>
    <String, dynamic>{
      'store_id': instance.storeId,
      'total_sales': instance.totalSales,
      'total_profit': instance.totalProfit,
      'store': instance.store,
    };

_TopStoreModel _$TopStoreModelFromJson(Map<String, dynamic> json) =>
    _TopStoreModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$TopStoreModelToJson(_TopStoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

_TopStoresResponse _$TopStoresResponseFromJson(Map<String, dynamic> json) =>
    _TopStoresResponse(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => TopStoreItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$TopStoresResponseToJson(_TopStoresResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
