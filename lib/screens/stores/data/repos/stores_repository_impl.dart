import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/stores/data/models/create_store_request.dart';
import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:dashboard/screens/stores/data/models/stores_response.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';

class StoresRepositoryImpl implements StoresRepository {
  final ApiService apiService;

  StoresRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<StoreModel>> createStore(CreateStoreRequest request) async {
    try {
      final response = await apiService.createStore(
        request.name,
        request.ownerName,
        request.phone,
        request.email,
        request.password,
        request.address,
        request.status,
        request.image,
      );

      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> deleteStore(int id) async {
    try {
      await apiService.deleteStore(id);

      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<StoreModel>> getStore(int id) async {
    try {
      final response = await apiService.getStore(id);

      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<StoresResponse>> getStores({
    String? status,
    String? search,
  }) async {
    try {
      final response = await apiService.getStores(
        status: status,
        search: search,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<StoreModel>> updateStoreStatus({
    required int id,
    required String status,
  }) async {
    try {
      final response = await apiService.updateStoreStatus(id, {
        'status': status,
      });

      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
