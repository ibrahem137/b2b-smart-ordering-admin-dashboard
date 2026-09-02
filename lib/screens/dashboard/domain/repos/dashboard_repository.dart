import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';

abstract class DashboardRepository {
  Future<ApiResult<LowStockResponse>> getLowStock();

  Future<ApiResult<DashboardOverviewResponse>> getOverview();

  Future<ApiResult<SalesTrendResponse>> getSalesTrend();

  Future<ApiResult<TopStoresResponse>> getTopStores();
}
