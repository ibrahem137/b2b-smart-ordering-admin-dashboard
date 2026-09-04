import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/orders/domain/repos/orders_repository.dart';
import 'package:dashboard/screens/orders/presentation/cubit/update_order_status_state.dart';

class UpdateOrderStatusCubit extends Cubit<UpdateOrderStatusState> {
  final OrdersRepository repository;

  UpdateOrderStatusCubit(this.repository)
    : super(const UpdateOrderStatusState.initial());

  Future<void> updateOrderStatus({
    required int id,
    required String status,
    String? notes,
  }) async {
    emit(const UpdateOrderStatusState.loading());

    final result = await repository.updateOrderStatus(
      id: id,
      status: status,
      notes: notes,
    );

    result.when(
      success: (_) {
        emit(const UpdateOrderStatusState.success());
      },
      failure: (error) {
        emit(
          UpdateOrderStatusState.failure(
            error.message ?? 'Failed to update order status',
          ),
        );
      },
    );
  }
}
