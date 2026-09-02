class CreateSupplierRequest {
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String status;

  const CreateSupplierRequest({
    required this.name,
    this.phone,
    this.email,
    this.address,
    required this.status,
  });
}
