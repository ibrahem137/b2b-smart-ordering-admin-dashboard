class CreateSupplierProductRequest {
  final int supplierId;
  final int productId;
  final double buyPrice;
  final int stockQuantity;
  final String status;

  const CreateSupplierProductRequest({
    required this.supplierId,
    required this.productId,
    required this.buyPrice,
    required this.stockQuantity,
    required this.status,
  });
}
