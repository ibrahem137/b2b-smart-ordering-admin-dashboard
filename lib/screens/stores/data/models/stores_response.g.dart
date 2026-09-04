// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoresPagination _$StoresPaginationFromJson(Map<String, dynamic> json) =>
    _StoresPagination(
      currentPage: (json['current_page'] as num).toInt(),
      stores: (json['data'] as List<dynamic>)
          .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$StoresPaginationToJson(_StoresPagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.stores,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };

_StoresResponse _$StoresResponseFromJson(Map<String, dynamic> json) =>
    _StoresResponse(
      data: StoresPagination.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StoresResponseToJson(_StoresResponse instance) =>
    <String, dynamic>{'data': instance.data, 'message': instance.message};
