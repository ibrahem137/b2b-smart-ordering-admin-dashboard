import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/sales/data/models/sales_response.dart';
import 'package:dashboard/screens/sales/domain/repos/sales_repository.dart';

class SalesRepositoryImpl implements SalesRepository {
  final ApiService apiService;

  SalesRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<SalesResponse>> getSales({
    int? storeId,
    int? customerId,
    String? status,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      final response = await apiService.getSales(
        storeId: storeId,
        customerId: customerId,
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
}
