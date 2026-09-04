import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/data/models/create_store_request.dart';
import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:dashboard/screens/stores/data/models/stores_response.dart';

abstract class StoresRepository {
  Future<ApiResult<StoreModel>> createStore(CreateStoreRequest request);

  Future<ApiResult<void>> deleteStore(int id);

  Future<ApiResult<StoreModel>> getStore(int id);

  Future<ApiResult<StoresResponse>> getStores({String? status, String? search});

  Future<ApiResult<StoreModel>> updateStoreStatus({
    required int id,
    required String status,
  });
}
