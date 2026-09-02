import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/sales/data/models/sales_response.dart';

abstract class SalesRepository {
  Future<ApiResult<SalesResponse>> getSales({
    int? storeId,
    int? customerId,
    String? status,
    String? fromDate,
    String? toDate,
  });
}
