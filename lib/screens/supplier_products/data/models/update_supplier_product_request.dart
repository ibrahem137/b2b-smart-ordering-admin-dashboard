class UpdateSupplierProductRequest {
  final int id;
  final int supplierId;
  final int productId;
  final double buyPrice;
  final int stockQuantity;
  final String status;

  const UpdateSupplierProductRequest({
    required this.id,
    required this.supplierId,
    required this.productId,
    required this.buyPrice,
    required this.stockQuantity,
    required this.status,
  });
}
