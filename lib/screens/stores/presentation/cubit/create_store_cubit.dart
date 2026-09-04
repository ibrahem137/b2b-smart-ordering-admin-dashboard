import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/data/models/create_store_request.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/store_action_state.dart';
import 'package:dio/dio.dart';

class CreateStoreCubit extends Cubit<StoreActionState> {
  final StoresRepository repository;

  CreateStoreCubit(this.repository) : super(const StoreActionState.initial());

  Future<void> createStore({
    required String name,
    required String ownerName,
    required String phone,
    required String email,
    required String password,
    String? address,
    required String status,
    MultipartFile? image,
  }) async {
    emit(const StoreActionState.loading());

    final result = await repository.createStore(
      CreateStoreRequest(
        name: name,
        ownerName: ownerName,
        phone: phone,
        email: email,
        password: password,
        address: address,
        status: status,
        image: image,
      ),
    );

    result.when(
      success: (store) {
        emit(StoreActionState.success(store));
      },
      failure: (error) {
        emit(
          StoreActionState.failure(error.message ?? 'Failed to create store'),
        );
      },
    );
  }
}
