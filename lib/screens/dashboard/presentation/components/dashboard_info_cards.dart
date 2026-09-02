import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_info_card.dart';
import 'package:flutter/material.dart';

class DashboardInfoCards extends StatelessWidget {
  final DashboardOverviewData overview;

  const DashboardInfoCards({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final dashboardColors = Theme.of(context).extension<DashboardColors>()!;

    final sales = overview.sales;

    final cards = <Widget>[
      DashboardInfoCard(
        title: 'Total Products',
        value: overview.productsTotal.toString(),
        icon: Icons.view_in_ar_rounded,
        iconColor: colors.onPrimary,
        avatarColor: colors.primary,
      ),

      DashboardInfoCard(
        title: 'Supplier Offers',
        value: overview.supplierProductsTotal.toString(),
        icon: Icons.shopping_cart_outlined,
        iconColor: colors.onSecondary,
        avatarColor: colors.secondary,
      ),

      DashboardInfoCard(
        title: 'Total Suppliers',
        value: overview.suppliersTotal.toString(),
        icon: Icons.people_alt_outlined,
        iconColor: colors.onSecondary,
        avatarColor: colors.secondary,
      ),

      DashboardInfoCard(
        title: 'Total Orders',
        value: overview.ordersTotal.toString(),
        icon: Icons.shopping_cart_outlined,
        iconColor: colors.surface,
        avatarColor: dashboardColors.warning,
      ),

      DashboardInfoCard(
        title: 'Total Sales',
        value: (sales?.totalCount ?? 0).toString(),
        icon: Icons.trending_up_sharp,
        iconColor: colors.surface,
        avatarColor: dashboardColors.success,
      ),

      DashboardInfoCard(
        title: 'Total Revenue',
        value: '\$${(sales?.paidTotal ?? 0).toStringAsFixed(2)}',
        icon: Icons.monetization_on_outlined,
        iconColor: colors.surface,
        avatarColor: dashboardColors.success,
      ),

      DashboardInfoCard(
        title: 'Total Profit',
        value: '\$${(sales?.paidProfit ?? 0).toStringAsFixed(2)}',
        icon: Icons.trending_up_sharp,
        iconColor: colors.surface,
        avatarColor: dashboardColors.success,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 16.0;

        final columns = _columnCount(constraints.maxWidth);

        final cardWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: cards
              .map(
                (card) => SizedBox(width: cardWidth, height: 145, child: card),
              )
              .toList(),
        );
      },
    );
  }

  int _columnCount(double width) {
    if (width >= 1600) {
      return 7;
    }

    if (width >= 1200) {
      return 4;
    }

    if (width >= 850) {
      return 3;
    }

    if (width >= 550) {
      return 2;
    }

    return 1;
  }
}
