// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: (json['id'] as num).toInt(),
  storeId: (json['store_id'] as num).toInt(),
  supplierId: (json['supplier_id'] as num).toInt(),
  status: json['status'] as String,
  totalBuy: json['total_buy'] as String,
  totalSell: json['total_sell'] as String?,
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  store: json['store'] == null
      ? null
      : StoreModel.fromJson(json['store'] as Map<String, dynamic>),
  supplier: json['supplier'] == null
      ? null
      : SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeId,
      'supplier_id': instance.supplierId,
      'status': instance.status,
      'total_buy': instance.totalBuy,
      'total_sell': instance.totalSell,
      'notes': instance.notes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'store': instance.store,
      'supplier': instance.supplier,
    };

_StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => _StoreModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  ownerName: json['owner_name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  status: json['status'] as String?,
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
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
