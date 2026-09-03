import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';

import 'supplier_action_state.dart';

class DeleteSupplierCubit
    extends Cubit<SupplierActionState> {
  final SuppliersRepository repository;

  DeleteSupplierCubit(this.repository)
    : super(const SupplierActionInitial());

  Future<void> deleteSupplier(int id) async {
    emit(const SupplierActionLoading());

    final result = await repository.deleteSupplier(id);

    result.when(
      success: (_) {
        emit(
          const SupplierActionSuccess(
            message:
                'suppliers.messages.deleted_successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierActionFailure(
            error.message ?? 'Failed to delete supplier',
          ),
        );
      },
    );
  }
}
