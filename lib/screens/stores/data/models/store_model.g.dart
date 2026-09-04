// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => _StoreModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  ownerName: json['owner_name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  address: json['address'] as String?,
  status: json['status'] as String,
  imageUrl: json['image_url'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$StoreModelToJson(_StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner_name': instance.ownerName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'status': instance.status,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
