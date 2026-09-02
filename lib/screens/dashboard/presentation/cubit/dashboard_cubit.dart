import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';
import 'package:dashboard/screens/dashboard/domain/repos/dashboard_repository.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository repository;

  DashboardCubit(this.repository) : super(const DashboardInitial());

  Future<void> getDashboard() async {
    emit(const DashboardLoading());

    //
    // نبدأ كل requests مع بعض بدل انتظار كل واحد
    // قبل تشغيل الثاني.
    //
    final overviewFuture = repository.getOverview();

    final salesTrendFuture = repository.getSalesTrend();

    final topStoresFuture = repository.getTopStores();

    final lowStockFuture = repository.getLowStock();

    //
    // Overview أساسي للـ Dashboard.
    //
    final overviewResult = await overviewFuture;

    DashboardOverviewData? overview;
    String? overviewError;

    overviewResult.when(
      success: (response) {
        overview = response.data;
      },
      failure: (error) {
        overviewError = error.message ?? 'Failed to load dashboard overview.';
      },
    );

    if (overview == null) {
      emit(DashboardFailure(overviewError ?? 'Failed to load dashboard.'));

      return;
    }

    //
    // باقي الأقسام ثانوية.
    // إذا واحد فشل ما منهد كامل Dashboard.
    //
    final salesTrendResult = await salesTrendFuture;

    final topStoresResult = await topStoresFuture;

    final lowStockResult = await lowStockFuture;

    var salesTrend = <SalesTrendItem>[];

    var topStores = <TopStoreItem>[];

    var lowStock = const LowStockData();

    final warnings = <String>[];

    salesTrendResult.when(
      success: (response) {
        salesTrend = response.data;
      },
      failure: (error) {
        warnings.add(error.message ?? 'Failed to load sales trend.');
      },
    );

    topStoresResult.when(
      success: (response) {
        topStores = response.data;
      },
      failure: (error) {
        warnings.add(error.message ?? 'Failed to load top stores.');
      },
    );

    lowStockResult.when(
      success: (response) {
        lowStock = response.data ?? const LowStockData();
      },
      failure: (error) {
        warnings.add(error.message ?? 'Failed to load low stock data.');
      },
    );

    emit(
      DashboardSuccess(
        overview: overview!,
        salesTrend: salesTrend,
        topStores: topStores,
        lowStock: lowStock,
        warnings: warnings,
      ),
    );
  }
}
