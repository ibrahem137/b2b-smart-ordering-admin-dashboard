import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/delete_store_state.dart';

class DeleteStoreCubit extends Cubit<DeleteStoreState> {
  final StoresRepository repository;

  DeleteStoreCubit(this.repository) : super(const DeleteStoreState.initial());

  Future<void> deleteStore(int id) async {
    emit(const DeleteStoreState.loading());

    final result = await repository.deleteStore(id);

    result.when(
      success: (_) {
        emit(const DeleteStoreState.success());
      },
      failure: (error) {
        emit(
          DeleteStoreState.failure(error.message ?? 'Failed to delete store'),
        );
      },
    );
  }
}
