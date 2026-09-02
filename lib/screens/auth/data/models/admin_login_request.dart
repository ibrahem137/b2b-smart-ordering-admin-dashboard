import 'package:json_annotation/json_annotation.dart';

part 'admin_login_request.g.dart';

@JsonSerializable()
class AdminLoginRequest {
  final String email;
  final String password;

  const AdminLoginRequest({required this.email, required this.password});

  factory AdminLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AdminLoginRequestToJson(this);
}
