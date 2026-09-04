import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  final StoresRepository repository;

  String? _status;

  String? _search;
  StoresCubit(this.repository) : super(const StoresState.initial());

  Future<void> getStores({String? status, String? search}) async {
    _status = status;
    _search = search;

    emit(const StoresState.loading());

    final result = await repository.getStores(status: status, search: search);

    result.when(
      success: (response) {
        emit(
          StoresState.success(
            stores: response.data.stores,
            total: response.data.total,
          ),
        );
      },
      failure: (error) {
        emit(StoresState.failure(error.message ?? 'Failed to load stores'));
      },
    );
  }

  Future<void> refresh() {
    return getStores(status: _status, search: _search);
  }
}
