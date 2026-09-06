import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';

class SupplierProductsFailure
    extends SupplierProductsState {
  final String message;

  const SupplierProductsFailure(this.message);
}

class SupplierProductsInitial
    extends SupplierProductsState {
  const SupplierProductsInitial();
}

class SupplierProductsLoading
    extends SupplierProductsState {
  const SupplierProductsLoading();
}

sealed class SupplierProductsState {
  const SupplierProductsState();
}

class SupplierProductsSuccess
    extends SupplierProductsState {
  final List<SupplierProductModel> supplierProducts;

  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const SupplierProductsSuccess({
    required this.supplierProducts,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  int get from {
    if (supplierProducts.isEmpty) {
      return 0;
    }

    return ((currentPage - 1) * perPage) + 1;
  }

  bool get hasNextPage => currentPage < lastPage;

  bool get hasPreviousPage => currentPage > 1;

  int get to {
    if (supplierProducts.isEmpty) {
      return 0;
    }

    final value = from + supplierProducts.length - 1;

    return value > total ? total : value;
  }
}
