import 'package:dashboard/screens/master_products/data/models/master_product_model.dart';

class ProductsFailure extends ProductsState {
  final String message;

  const ProductsFailure(this.message);
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

sealed class ProductsState {
  const ProductsState();
}

class ProductsSuccess extends ProductsState {
  final List<MasterProductModel> products;

  const ProductsSuccess(this.products);
}
