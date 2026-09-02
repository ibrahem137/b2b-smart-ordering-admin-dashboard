class UpdateSupplierRequest {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String status;

  const UpdateSupplierRequest({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    required this.status,
  });
}
