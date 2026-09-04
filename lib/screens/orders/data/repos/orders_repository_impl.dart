import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/orders/data/models/orders_response.dart';
import 'package:dashboard/screens/orders/domain/repos/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final ApiService apiService;

  OrdersRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<OrdersResponse>> getOrders({
    int? storeId,
    int? supplierId,
    String? status,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      final response = await apiService.getOrders(
        storeId: storeId,
        supplierId: supplierId,
        status: status,
        fromDate: fromDate,
        toDate: toDate,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> updateOrderStatus({
    required int id,
    required String status,
    String? notes,
  }) async {
    try {
      await apiService.updateOrderStatus(id, {
        'status': status,
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      });

      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
