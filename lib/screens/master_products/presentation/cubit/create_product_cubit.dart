import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/master_products/data/models/create_product_request.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';

class CreateProductCubit extends Cubit<ProductActionState> {
  final ProductsRepository repository;

  CreateProductCubit(this.repository) : super(const ProductActionInitial());

  Future<void> createProduct({
    required int supplierId,
    required int categoryId,
    required String name,
    String? description,
    required double buyPrice,
    required int stockQuantity,
    required String status,
  }) async {
    emit(const ProductActionLoading());

    final result = await repository.createProduct(
      CreateProductRequest(
        supplierId: supplierId,
        categoryId: categoryId,
        name: name.trim(),
        description: description?.trim().isEmpty == true
            ? null
            : description?.trim(),
        buyPrice: buyPrice,
        stockQuantity: stockQuantity,
        status: status,
      ),
    );

    result.when(
      success: (_) {
        emit(const ProductActionSuccess('Product created successfully'));
      },
      failure: (error) {
        emit(ProductActionFailure(error.message ?? 'Failed to create product'));
      },
    );
  }
}
