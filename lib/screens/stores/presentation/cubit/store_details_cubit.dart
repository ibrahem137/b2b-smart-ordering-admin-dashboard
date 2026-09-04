import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/store_details_state.dart';

class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final StoresRepository repository;

  StoreDetailsCubit(this.repository) : super(const StoreDetailsState.initial());

  Future<void> getStore(int id) async {
    emit(const StoreDetailsState.loading());

    final result = await repository.getStore(id);

    result.when(
      success: (store) {
        emit(StoreDetailsState.success(store));
      },
      failure: (error) {
        emit(
          StoreDetailsState.failure(
            error.message ?? 'Failed to load store details',
          ),
        );
      },
    );
  }
}
