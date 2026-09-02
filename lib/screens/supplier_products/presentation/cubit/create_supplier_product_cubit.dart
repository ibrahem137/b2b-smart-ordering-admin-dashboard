import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_products/data/models/create_supplier_product_request.dart';
import 'package:dashboard/screens/supplier_products/domain/repos/supplier_products_repository.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_product_action_state.dart';

class CreateSupplierProductCubit extends Cubit<SupplierProductActionState> {
  final SupplierProductsRepository repository;

  CreateSupplierProductCubit(this.repository)
    : super(const SupplierProductActionInitial());

  Future<void> createSupplierProduct({
    required int supplierId,
    required int productId,
    required double buyPrice,
    required int stockQuantity,
    required String status,
  }) async {
    emit(const SupplierProductActionLoading());

    final result = await repository.createSupplierProduct(
      CreateSupplierProductRequest(
        supplierId: supplierId,
        productId: productId,
        buyPrice: buyPrice,
        stockQuantity: stockQuantity,
        status: status,
      ),
    );

    result.when(
      success: (_) {
        emit(
          const SupplierProductActionSuccess(
            'Supplier offer saved successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierProductActionFailure(
            error.message ?? 'Failed to save supplier offer',
          ),
        );
      },
    );
  }
}
