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
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const ProductsSuccess({
    required this.products,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  int get from {
    if (products.isEmpty) return 0;

    return ((currentPage - 1) * perPage) + 1;
  }

  bool get hasNextPage => currentPage < lastPage;

  bool get hasPreviousPage => currentPage > 1;

  int get to {
    if (products.isEmpty) return 0;

    final value = from + products.length - 1;
    return value > total ? total : value;
  }
}
