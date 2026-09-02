import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';

class SuppliersFailure extends SuppliersState {
  final String message;

  const SuppliersFailure(this.message);
}

class SuppliersInitial extends SuppliersState {
  const SuppliersInitial();
}

class SuppliersLoading extends SuppliersState {
  const SuppliersLoading();
}

sealed class SuppliersState {
  const SuppliersState();
}

class SuppliersSuccess extends SuppliersState {
  final List<SupplierModel> suppliers;
  final int total;

  const SuppliersSuccess({required this.suppliers, required this.total});
}
