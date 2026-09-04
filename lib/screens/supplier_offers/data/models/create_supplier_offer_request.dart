import 'package:dio/dio.dart';

class CreateSupplierOfferRequest {
  final int supplierProductId;
  final double offerPrice;
  final int? offerStock;
  final String? status;
  final String? expiresAt;
  final MultipartFile? image;

  const CreateSupplierOfferRequest({
    required this.supplierProductId,
    required this.offerPrice,
    this.offerStock,
    this.status,
    this.expiresAt,
    this.image,
  });
}
