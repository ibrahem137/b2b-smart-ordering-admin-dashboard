import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository repository;

  ProductsCubit(this.repository) : super(const ProductsInitial());

  Future<void> getProducts({
    int? supplierId,
    int? categoryId,
    String? status,
    String? search,
  }) async {
    emit(const ProductsLoading());

    final result = await repository.getProducts(
      supplierId: supplierId,
      categoryId: categoryId,
      status: status,
      search: search,
    );

    result.when(
      success: (response) {
        emit(ProductsSuccess(response.data?.products ?? []));
      },
      failure: (error) {
        emit(ProductsFailure(error.message ?? 'Failed to load products'));
      },
    );
  }
}
