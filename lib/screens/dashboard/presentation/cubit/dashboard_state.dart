import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';

class DashboardFailure extends DashboardState {
  final String message;

  const DashboardFailure(this.message);
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

sealed class DashboardState {
  const DashboardState();
}

class DashboardSuccess extends DashboardState {
  final DashboardOverviewData overview;
  final List<SalesTrendItem> salesTrend;
  final List<TopStoreItem> topStores;
  final LowStockData lowStock;

  /// إذا فشل endpoint ثانوي، منقدر نعرض Dashboard
  /// ونحتفظ برسالة التحذير بدل إخفاء الخطأ بالكامل.
  final List<String> warnings;

  const DashboardSuccess({
    required this.overview,
    required this.salesTrend,
    required this.topStores,
    required this.lowStock,
    this.warnings = const [],
  });
}
