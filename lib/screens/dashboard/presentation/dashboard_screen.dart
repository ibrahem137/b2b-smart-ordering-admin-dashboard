import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_analytics.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_charts.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_info_cards.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_sales_section.dart';
import 'package:dashboard/screens/dashboard/presentation/components/recent_purchase_orders.dart';
import 'package:dashboard/screens/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:dashboard/screens/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:dashboard/screens/orders/presentation/cubit/orders_cubit.dart';
import 'package:dashboard/screens/orders/presentation/cubit/orders_state.dart';
import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:dashboard/screens/sales/presentation/cubit/sales_cubit.dart';
import 'package:dashboard/screens/sales/presentation/cubit/sales_state.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardCubit>(
          create: (_) => getIt<DashboardCubit>()..getDashboard(),
        ),
        BlocProvider<OrdersCubit>(
          create: (_) => getIt<OrdersCubit>()..getOrders(),
        ),
        BlocProvider<SalesCubit>(
          create: (_) => getIt<SalesCubit>()..getSales(),
        ),
        BlocProvider<SupplierProductsCubit>(
          create: (_) => getIt<SupplierProductsCubit>()..getSupplierProducts(),
        ),
      ],
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          if (state is DashboardFailure) {
            return _buildDashboardFailure(context, state);
          }

          if (state is DashboardSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  DashboardInfoCards(overview: state.overview),

                  const SizedBox(height: 24),

                  DashboardCharts(
                    overview: state.overview,
                    salesTrend: state.salesTrend,
                    onRefresh: () {
                      context.read<DashboardCubit>().getDashboard();
                    },
                  ),

                  const SizedBox(height: 24),

                  DashboardAnalytics(
                    topStores: state.topStores,
                    lowStock: state.lowStock,
                    onRefresh: () {
                      context.read<DashboardCubit>().getDashboard();
                    },
                  ),

                  const SizedBox(height: 24),

                  _buildRecentOrders(),

                  const SizedBox(height: 24),

                  _buildSalesSection(),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDashboardFailure(BuildContext context, DashboardFailure state) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: colors.error, size: 42),

            const SizedBox(height: 12),

            Text(
              state.message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 16),

            FilledButton.icon(
              onPressed: () {
                _refreshAll(context);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentOrders() {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final colors = theme.colorScheme;

        if (state is OrdersLoading) {
          return SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(color: colors.primary),
            ),
          );
        }

        if (state is OrdersFailure) {
          return SizedBox(
            height: 300,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, color: colors.error, size: 36),

                  const SizedBox(height: 10),

                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextButton.icon(
                    onPressed: () {
                      context.read<OrdersCubit>().getOrders();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is OrdersSuccess) {
          final recentOrders = state.orders.take(5).toList();

          return SizedBox(
            height: 520,
            child: RecentPurchaseOrders(
              orders: recentOrders,
              onRefresh: () {
                context.read<OrdersCubit>().getOrders();
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSalesSection() {
    return BlocBuilder<SalesCubit, SalesState>(
      builder: (context, salesState) {
        return BlocBuilder<SupplierProductsCubit, SupplierProductsState>(
          builder: (context, productsState) {
            final colors = Theme.of(context).colorScheme;

            if (salesState is SalesLoading ||
                productsState is SupplierProductsLoading) {
              return SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(color: colors.primary),
                ),
              );
            }

            final sales = salesState is SalesSuccess
                ? salesState.sales
                : <SaleModel>[];

            final products = productsState is SupplierProductsSuccess
                ? productsState.supplierProducts
                : <SupplierProductModel>[];

            return DashboardSalesSection(
              sales: sales,
              supplierProducts: products,
              onRefreshSales: () {
                context.read<SalesCubit>().getSales();
              },
              onRefreshSupplierProducts: () {
                context.read<SupplierProductsCubit>().getSupplierProducts();
              },
            );
          },
        );
      },
    );
  }

  void _refreshAll(BuildContext context) {
    context.read<DashboardCubit>().getDashboard();

    context.read<OrdersCubit>().getOrders();

    context.read<SalesCubit>().getSales();

    context.read<SupplierProductsCubit>().getSupplierProducts();
  }
}
