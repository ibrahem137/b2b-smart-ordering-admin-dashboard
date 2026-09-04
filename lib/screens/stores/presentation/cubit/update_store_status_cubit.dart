import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/store_action_state.dart';

class UpdateStoreStatusCubit extends Cubit<StoreActionState> {
  final StoresRepository repository;

  UpdateStoreStatusCubit(this.repository)
    : super(const StoreActionState.initial());

  Future<void> updateStatus({required int id, required String status}) async {
    emit(const StoreActionState.loading());

    final result = await repository.updateStoreStatus(id: id, status: status);

    result.when(
      success: (store) {
        emit(StoreActionState.success(store));
      },
      failure: (error) {
        emit(
          StoreActionState.failure(
            error.message ?? 'Failed to update store status',
          ),
        );
      },
    );
  }
}
