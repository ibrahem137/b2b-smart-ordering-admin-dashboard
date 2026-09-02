import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_action_state.dart';

class UpdateSupplierCategoriesCubit extends Cubit<SupplierActionState> {
  final SuppliersRepository repository;

  UpdateSupplierCategoriesCubit(this.repository)
    : super(const SupplierActionInitial());

  Future<void> updateCategories({
    required int supplierId,
    required List<int> categoryIds,
  }) async {
    emit(const SupplierActionLoading());

    final result = await repository.updateSupplierCategories(
      supplierId: supplierId,
      categoryIds: categoryIds,
    );

    result.when(
      success: (_) {
        emit(
          const SupplierActionSuccess(
            message: 'Supplier categories updated successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierActionFailure(
            error.message ?? 'Failed to update supplier categories',
          ),
        );
      },
    );
  }
}
