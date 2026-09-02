class UpdateProductRequest {
  final int id;
  final int supplierId;
  final int categoryId;
  final String name;
  final String? description;
  final double buyPrice;
  final int stockQuantity;
  final String status;

  const UpdateProductRequest({
    required this.id,
    required this.supplierId,
    required this.categoryId,
    required this.name,
    this.description,
    required this.buyPrice,
    required this.stockQuantity,
    required this.status,
  });
}
