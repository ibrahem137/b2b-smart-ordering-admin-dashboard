import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';
import 'package:dashboard/screens/dashboard/presentation/components/low_stock_card.dart';
import 'package:dashboard/screens/dashboard/presentation/components/top_stores_card.dart';
import 'package:flutter/material.dart';

class DashboardAnalytics extends StatelessWidget {
  final List<TopStoreItem> topStores;
  final LowStockData lowStock;
  final VoidCallback? onRefresh;

  const DashboardAnalytics({
    super.key,
    required this.topStores,
    required this.lowStock,
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
                height: 380,
                child: TopStoresCard(stores: topStores, onRefresh: onRefresh),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 380,
                child: LowStockCard(data: lowStock, onRefresh: onRefresh),
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 380,
                child: TopStoresCard(stores: topStores, onRefresh: onRefresh),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SizedBox(
                height: 380,
                child: LowStockCard(data: lowStock, onRefresh: onRefresh),
              ),
            ),
          ],
        );
      },
    );
  }
}
