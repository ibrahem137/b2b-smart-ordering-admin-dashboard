import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';

class DeleteProductCubit extends Cubit<ProductActionState> {
  final ProductsRepository repository;

  DeleteProductCubit(this.repository) : super(const ProductActionInitial());

  Future<void> deleteProduct(int id) async {
    emit(const ProductActionLoading());

    final result = await repository.deleteProduct(id);

    result.when(
      success: (_) {
        emit(const ProductActionSuccess('Product deleted successfully'));
      },
      failure: (error) {
        emit(ProductActionFailure(error.message ?? 'Failed to delete product'));
      },
    );
  }
}
