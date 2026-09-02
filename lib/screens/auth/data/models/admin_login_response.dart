import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_login_response.freezed.dart';
part 'admin_login_response.g.dart';

@freezed
abstract class AdminLoginData with _$AdminLoginData {
  const factory AdminLoginData({
    required String token,

    @JsonKey(name: 'token_type') String? tokenType,

    AdminModel? admin,
  }) = _AdminLoginData;

  factory AdminLoginData.fromJson(Map<String, dynamic> json) =>
      _$AdminLoginDataFromJson(json);
}

@freezed
abstract class AdminLoginResponse with _$AdminLoginResponse {
  const factory AdminLoginResponse({
    AdminLoginData? data,
    String? message,
    dynamic errors,
  }) = _AdminLoginResponse;

  factory AdminLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminLoginResponseFromJson(json);
}

@freezed
abstract class AdminModel with _$AdminModel {
  const factory AdminModel({
    required int id,
    required String name,
    required String email,
  }) = _AdminModel;

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
