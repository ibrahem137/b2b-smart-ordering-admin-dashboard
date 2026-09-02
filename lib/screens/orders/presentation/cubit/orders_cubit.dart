import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/orders/domain/repos/orders_repository.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository repository;

  OrdersCubit(this.repository) : super(const OrdersInitial());

  Future<void> getOrders({
    int? storeId,
    int? supplierId,
    String? status,
    String? fromDate,
    String? toDate,
  }) async {
    emit(const OrdersLoading());

    final result = await repository.getOrders(
      storeId: storeId,
      supplierId: supplierId,
      status: status,
      fromDate: fromDate,
      toDate: toDate,
    );

    result.when(
      success: (response) {
        emit(OrdersSuccess(response.data?.orders ?? []));
      },
      failure: (error) {
        emit(OrdersFailure(error.message ?? 'Failed to load orders'));
      },
    );
  }
}
