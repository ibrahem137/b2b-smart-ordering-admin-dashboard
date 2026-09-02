import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';

class SupplierProductsFailure extends SupplierProductsState {
  final String message;

  const SupplierProductsFailure(this.message);
}

class SupplierProductsInitial extends SupplierProductsState {
  const SupplierProductsInitial();
}

class SupplierProductsLoading extends SupplierProductsState {
  const SupplierProductsLoading();
}

sealed class SupplierProductsState {
  const SupplierProductsState();
}

class SupplierProductsSuccess extends SupplierProductsState {
  final List<SupplierProductModel> supplierProducts;

  const SupplierProductsSuccess(this.supplierProducts);
}
