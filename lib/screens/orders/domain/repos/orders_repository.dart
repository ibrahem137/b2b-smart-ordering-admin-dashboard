import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/orders/data/models/orders_response.dart';

abstract class OrdersRepository {
  Future<ApiResult<OrdersResponse>> getOrders({
    int? storeId,
    int? supplierId,
    String? status,
    String? fromDate,
    String? toDate,
  });

  Future<ApiResult<void>> updateOrderStatus({
    required int id,
    required String status,
    String? notes,
  });
}
