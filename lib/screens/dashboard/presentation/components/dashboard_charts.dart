import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_card.dart';
import 'package:dashboard/screens/dashboard/presentation/components/orders_status_chart.dart';
import 'package:dashboard/screens/dashboard/presentation/components/sales_over_time_chart.dart';
import 'package:flutter/material.dart';

class DashboardCharts extends StatelessWidget {
  final DashboardOverviewData overview;
  final List<SalesTrendItem> salesTrend;
  final VoidCallback? onRefresh;

  const DashboardCharts({
    super.key,
    required this.overview,
    required this.salesTrend,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 1000;

        if (isNarrow) {
          return Column(
            children: [
              SizedBox(
                height: 420,
                child: DashboardCard(
                  title: 'Sales Over Time',
                  icon: Icons.show_chart,
                  onRefresh: onRefresh,
                  child: SalesOverTimeChart(data: salesTrend),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 420,
                child: DashboardCard(
                  title: 'Orders by Status',
                  icon: Icons.shopping_cart_outlined,
                  onRefresh: onRefresh,
                  child: OrdersStatusChart(overview: overview),
                ),
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 420,
                child: DashboardCard(
                  title: 'Sales Over Time',
                  icon: Icons.show_chart,
                  onRefresh: onRefresh,
                  child: SalesOverTimeChart(data: salesTrend),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SizedBox(
                height: 420,
                child: DashboardCard(
                  title: 'Orders by Status',
                  icon: Icons.shopping_cart_outlined,
                  onRefresh: onRefresh,
                  child: OrdersStatusChart(overview: overview),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
