import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_products/domain/repos/supplier_products_repository.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_product_action_state.dart';

class DeleteSupplierProductCubit extends Cubit<SupplierProductActionState> {
  final SupplierProductsRepository repository;

  DeleteSupplierProductCubit(this.repository)
    : super(const SupplierProductActionInitial());

  Future<void> deleteSupplierProduct(int id) async {
    emit(const SupplierProductActionLoading());

    final result = await repository.deleteSupplierProduct(id);

    result.when(
      success: (_) {
        emit(
          const SupplierProductActionSuccess(
            'Supplier offer deleted successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierProductActionFailure(
            error.message ?? 'Failed to delete supplier offer',
          ),
        );
      },
    );
  }
}
