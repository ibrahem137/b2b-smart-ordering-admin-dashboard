// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) =>
    _StoreResponse(
      data: StoreModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StoreResponseToJson(_StoreResponse instance) =>
    <String, dynamic>{'data': instance.data, 'message': instance.message};
