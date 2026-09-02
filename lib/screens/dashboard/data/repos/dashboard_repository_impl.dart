import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';
import 'package:dashboard/screens/dashboard/domain/repos/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final ApiService apiService;

  DashboardRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<LowStockResponse>> getLowStock() async {
    try {
      final response = await apiService.getDashboardLowStock();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<DashboardOverviewResponse>> getOverview() async {
    try {
      final response = await apiService.getDashboardOverview();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SalesTrendResponse>> getSalesTrend() async {
    try {
      final response = await apiService.getDashboardSalesTrend();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TopStoresResponse>> getTopStores() async {
    try {
      final response = await apiService.getDashboardTopStores();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
