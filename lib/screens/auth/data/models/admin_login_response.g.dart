// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminLoginData _$AdminLoginDataFromJson(Map<String, dynamic> json) =>
    _AdminLoginData(
      token: json['token'] as String,
      tokenType: json['token_type'] as String?,
      admin: json['admin'] == null
          ? null
          : AdminModel.fromJson(json['admin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminLoginDataToJson(_AdminLoginData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'admin': instance.admin,
    };

_AdminLoginResponse _$AdminLoginResponseFromJson(Map<String, dynamic> json) =>
    _AdminLoginResponse(
      data: json['data'] == null
          ? null
          : AdminLoginData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$AdminLoginResponseToJson(_AdminLoginResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };

_AdminModel _$AdminModelFromJson(Map<String, dynamic> json) => _AdminModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$AdminModelToJson(_AdminModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
