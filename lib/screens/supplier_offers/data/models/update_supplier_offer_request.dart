import 'package:dio/dio.dart';

class UpdateSupplierOfferRequest {
  final int id;
  final int? supplierProductId;
  final double? offerPrice;
  final int? offerStock;
  final String? status;
  final String? expiresAt;
  final MultipartFile? image;

  const UpdateSupplierOfferRequest({
    required this.id,
    this.supplierProductId,
    this.offerPrice,
    this.offerStock,
    this.status,
    this.expiresAt,
    this.image,
  });
}
