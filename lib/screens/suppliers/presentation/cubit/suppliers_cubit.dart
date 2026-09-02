import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';

import 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  final SuppliersRepository repository;

  SuppliersCubit(this.repository) : super(const SuppliersInitial());

  Future<void> getSuppliers({String? search, String? status}) async {
    emit(const SuppliersLoading());

    final result = await repository.getSuppliers(
      search: search,
      status: status,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        emit(
          SuppliersSuccess(
            suppliers: pagination?.suppliers ?? [],
            total: pagination?.total ?? 0,
          ),
        );
      },
      failure: (error) {
        emit(SuppliersFailure(error.message ?? 'Something went wrong'));
      },
    );
  }
}
