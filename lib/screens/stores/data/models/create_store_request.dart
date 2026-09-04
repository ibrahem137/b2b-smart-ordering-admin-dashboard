import 'package:dio/dio.dart';

class CreateStoreRequest {
  final String name;
  final String ownerName;
  final String phone;
  final String email;
  final String password;
  final String? address;
  final String status;
  final MultipartFile? image;

  const CreateStoreRequest({
    required this.name,
    required this.ownerName,
    required this.phone,
    required this.email,
    required this.password,
    this.address,
    required this.status,
    this.image,
  });
}
