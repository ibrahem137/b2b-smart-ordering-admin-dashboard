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
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const SuppliersSuccess({
    required this.suppliers,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  int get from {
    if (suppliers.isEmpty) return 0;

    return ((currentPage - 1) * perPage) + 1;
  }

  bool get hasNextPage => currentPage < lastPage;

  bool get hasPreviousPage => currentPage > 1;

  int get to {
    if (suppliers.isEmpty) return 0;

    final value = from + suppliers.length - 1;

    return value > total ? total : value;
  }
}
