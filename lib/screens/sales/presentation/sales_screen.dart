import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:dashboard/screens/sales/presentation/components/sales_header.dart';
import 'package:dashboard/screens/sales/presentation/components/sales_summary_cards.dart';
import 'package:dashboard/screens/sales/presentation/components/sales_table.dart';
import 'package:dashboard/screens/sales/presentation/components/sales_toolbar.dart';
import 'package:dashboard/screens/sales/presentation/cubit/sales_cubit.dart';
import 'package:dashboard/screens/sales/presentation/cubit/sales_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SalesCubit>(
      create: (_) => getIt<SalesCubit>()..getSales(),
      child: const _SalesView(),
    );
  }
}

class _SalesView extends StatefulWidget {
  const _SalesView();

  @override
  State<_SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<_SalesView> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<SalesCubit, SalesState>(
          builder: (context, state) {
            if (state is SalesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SalesFailure) {
              return _buildFailure(context, state);
            }

            if (state is SalesSuccess) {
              final sales = state.sales;

              final filteredSales = _filterSales(sales);

              final totalRevenue = sales.fold<double>(
                0.0,
                (sum, sale) => sum + (double.tryParse(sale.total) ?? 0.0),
              );

              final totalProfit = sales.fold<double>(
                0.0,
                (sum, sale) => sum + (double.tryParse(sale.profit) ?? 0.0),
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SalesHeader(),

                  const SizedBox(height: 24),

                  SalesSummaryCards(
                    totalRevenue: totalRevenue,
                    totalSales: sales.length,
                    totalProfit: totalProfit,
                  ),

                  const SizedBox(height: 24),

                  SalesToolbar(
                    onSearch: (value) {
                      setState(() {
                        searchQuery = value.trim();
                      });
                    },
                  ),

                  const SizedBox(height: 24),

                  Expanded(
                    child: SalesTable(
                      sales: filteredSales,
                      onView: (sale) {
                        _showSaleDetails(context, sale);
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildFailure(BuildContext context, SalesFailure state) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: colors.error.withValues(alpha: .10),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.error_outline, size: 34, color: colors.error),
          ),

          const SizedBox(height: 16),

          Text(
            'Unable to load sales',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            state.message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: () {
              context.read<SalesCubit>().getSales();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final normalized = status.toLowerCase();

    Color statusColor;

    switch (normalized) {
      case 'completed':
      case 'paid':
        statusColor = colors.primary;
        break;

      case 'cancelled':
        statusColor = colors.error;
        break;

      default:
        statusColor = colors.onSurfaceVariant;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _formatStatus(status),
        style: theme.textTheme.bodySmall?.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _detail(BuildContext context, String title, String value) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$title:',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<SaleModel> _filterSales(List<SaleModel> sales) {
    final query = searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return sales;
    }

    return sales.where((sale) {
      final saleNumber = 'sale-${sale.id}'.toLowerCase();

      final storeName = sale.store?.name.toLowerCase() ?? '';

      final customerName = sale.customer?.name.toLowerCase() ?? '';

      final status = sale.status.toLowerCase();

      final notes = sale.notes?.toLowerCase() ?? '';

      return saleNumber.contains(query) ||
          storeName.contains(query) ||
          customerName.contains(query) ||
          status.contains(query) ||
          notes.contains(query);
    }).toList();
  }

  String _formatStatus(String status) {
    if (status.isEmpty) {
      return '—';
    }

    return status
        .split('_')
        .map(
          (word) => word.isEmpty
              ? ''
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  void _showSaleDetails(BuildContext context, SaleModel sale) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: colors.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: colors.outlineVariant),
          ),
          title: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.receipt_long_outlined,
                  color: colors.primary,
                  size: 22,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  'Sale #${sale.id}',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detail(context, 'Store', sale.store?.name ?? '—'),

                _detail(context, 'Customer', sale.customer?.name ?? '—'),

                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          'Status:',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      _buildStatusChip(context, sale.status),
                    ],
                  ),
                ),

                _detail(context, 'Total', '\$${sale.total}'),

                _detail(context, 'Cost', '\$${sale.totalCost}'),

                _detail(context, 'Profit', '\$${sale.profit}'),

                _detail(context, 'Paid', '\$${sale.paidAmount}'),

                _detail(
                  context,
                  'Notes',
                  sale.notes?.trim().isNotEmpty == true ? sale.notes! : '—',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
