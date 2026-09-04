import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/master_products/data/models/update_product_request.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/product_action_state.dart';
import 'package:dio/dio.dart';

class UpdateProductCubit extends Cubit<ProductActionState> {
  final ProductsRepository repository;

  UpdateProductCubit(this.repository)
    : super(const ProductActionInitial());

  Future<void> updateProduct({
    required int id,
    required int supplierId,
    required int categoryId,
    required String name,
    String? description,
    required double buyPrice,
    required int stockQuantity,
    required String status,
    MultipartFile? image,
  }) async {
    emit(const ProductActionLoading());

    final result = await repository.updateProduct(
      UpdateProductRequest(
        id: id,
        supplierId: supplierId,
        categoryId: categoryId,
        name: name.trim(),
        description: description?.trim().isEmpty == true
            ? null
            : description?.trim(),
        buyPrice: buyPrice,
        stockQuantity: stockQuantity,
        status: status,
        image: image,
      ),
    );

    result.when(
      success: (_) {
        emit(
          const ProductActionSuccess(
            'Product updated successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          ProductActionFailure(
            error.message ?? 'Failed to update product',
          ),
        );
      },
    );
  }
}
