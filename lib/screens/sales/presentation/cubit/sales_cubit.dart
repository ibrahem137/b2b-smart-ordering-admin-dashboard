import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/sales/domain/repos/sales_repository.dart';

import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  final SalesRepository repository;

  SalesCubit(this.repository) : super(const SalesInitial());

  Future<void> getSales({
    int? storeId,
    int? customerId,
    String? status,
    String? fromDate,
    String? toDate,
  }) async {
    emit(const SalesLoading());

    final result = await repository.getSales(
      storeId: storeId,
      customerId: customerId,
      status: status,
      fromDate: fromDate,
      toDate: toDate,
    );

    result.when(
      success: (response) {
        emit(SalesSuccess(response.data?.sales ?? []));
      },
      failure: (error) {
        emit(SalesFailure(error.message ?? 'Failed to load sales'));
      },
    );
  }
}
