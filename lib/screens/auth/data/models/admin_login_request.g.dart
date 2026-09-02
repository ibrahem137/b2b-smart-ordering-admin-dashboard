// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminLoginRequest _$AdminLoginRequestFromJson(Map<String, dynamic> json) =>
    AdminLoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AdminLoginRequestToJson(AdminLoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
