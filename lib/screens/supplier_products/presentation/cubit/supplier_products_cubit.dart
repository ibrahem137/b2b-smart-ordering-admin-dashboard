import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_products/domain/repos/supplier_products_repository.dart';

import 'supplier_products_state.dart';

class SupplierProductsCubit extends Cubit<SupplierProductsState> {
  final SupplierProductsRepository repository;

  SupplierProductsCubit(this.repository)
    : super(const SupplierProductsInitial());

  Future<void> getSupplierProducts({
    int? supplierId,
    int? productId,
    String? status,
  }) async {
    emit(const SupplierProductsLoading());

    final result = await repository.getSupplierProducts(
      supplierId: supplierId,
      productId: productId,
      status: status,
    );

    result.when(
      success: (response) {
        emit(SupplierProductsSuccess(response.data?.supplierProducts ?? []));
      },
      failure: (error) {
        emit(
          SupplierProductsFailure(
            error.message ?? 'Failed to load supplier products',
          ),
        );
      },
    );
  }
}
