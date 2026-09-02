// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    _CustomerModel(
      id: (json['id'] as num).toInt(),
      storeId: (json['store_id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(_CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeId,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_SaleModel _$SaleModelFromJson(Map<String, dynamic> json) => _SaleModel(
  id: (json['id'] as num).toInt(),
  storeId: (json['store_id'] as num).toInt(),
  customerId: (json['customer_id'] as num).toInt(),
  status: json['status'] as String,
  total: json['total'] as String,
  totalCost: json['total_cost'] as String,
  profit: json['profit'] as String,
  paidAmount: json['paid_amount'] as String,
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  store: json['store'] == null
      ? null
      : StoreModel.fromJson(json['store'] as Map<String, dynamic>),
  customer: json['customer'] == null
      ? null
      : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SaleModelToJson(_SaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeId,
      'customer_id': instance.customerId,
      'status': instance.status,
      'total': instance.total,
      'total_cost': instance.totalCost,
      'profit': instance.profit,
      'paid_amount': instance.paidAmount,
      'notes': instance.notes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'store': instance.store,
      'customer': instance.customer,
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
