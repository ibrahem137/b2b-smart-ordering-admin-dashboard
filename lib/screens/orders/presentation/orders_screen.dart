import 'package:dashboard/core/di/injection.dart';
import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:dashboard/screens/orders/presentation/components/orders_header.dart';
import 'package:dashboard/screens/orders/presentation/components/orders_table.dart';
import 'package:dashboard/screens/orders/presentation/components/orders_toolbar.dart';
import 'package:dashboard/screens/orders/presentation/cubit/orders_cubit.dart';
import 'package:dashboard/screens/orders/presentation/cubit/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersCubit>(
      create: (_) => getIt<OrdersCubit>()..getOrders(),
      child: const _OrdersView(),
    );
  }
}

class _OrdersView extends StatefulWidget {
  const _OrdersView();

  @override
  State<_OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<_OrdersView> {
  String selectedFilter = 'All';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrdersHeader(),

            const SizedBox(height: 24),

            OrdersToolbar(
              selectedFilter: selectedFilter,
              onSearch: (value) {
                setState(() {
                  searchQuery = value.trim();
                });
              },
              onFilterChanged: (filter) {
                setState(() {
                  selectedFilter = filter;
                });

                context.read<OrdersCubit>().getOrders(
                  status: _statusFromFilter(filter),
                );
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is OrdersFailure) {
                    return _buildFailure(context, state);
                  }

                  if (state is OrdersSuccess) {
                    final orders = _filterLocally(state.orders);

                    if (orders.isEmpty) {
                      return _buildEmptyState(context);
                    }

                    return OrdersTable(
                      orders: orders,
                      onView: (order) {
                        _showOrderDetails(context, order);
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: .10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: colors.primary,
              size: 36,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'No orders found',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            searchQuery.isNotEmpty || selectedFilter != 'All'
                ? 'Try changing your search or filter.'
                : 'Orders will appear here once they are available.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFailure(BuildContext context, OrdersFailure state) {
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
            'Unable to load orders',
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
              context.read<OrdersCubit>().getOrders(
                status: _statusFromFilter(selectedFilter),
              );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
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
            width: 100,
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

  List<OrderModel> _filterLocally(List<OrderModel> orders) {
    final query = searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return orders;
    }

    return orders.where((order) {
      final orderNumber = 'po-${order.id}'.toLowerCase();

      final store = order.store?.name.toLowerCase() ?? '';

      final supplier = order.supplier?.name.toLowerCase() ?? '';

      final status = order.status.toLowerCase();

      final notes = order.notes?.toLowerCase() ?? '';

      return orderNumber.contains(query) ||
          store.contains(query) ||
          supplier.contains(query) ||
          status.contains(query) ||
          notes.contains(query);
    }).toList();
  }

  void _showOrderDetails(BuildContext context, OrderModel order) {
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
                  'Order #${order.id}',
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
                _detail(context, 'Store', order.store?.name ?? '—'),
                _detail(context, 'Supplier', order.supplier?.name ?? '—'),
                _detail(context, 'Status', _statusLabel(order.status)),
                _detail(context, 'Total Buy', '\$${order.totalBuy}'),
                _detail(
                  context,
                  'Total Sell',
                  order.totalSell == null ? '—' : '\$${order.totalSell}',
                ),
                _detail(context, 'Notes', order.notes ?? '—'),
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

  String? _statusFromFilter(String filter) {
    switch (filter) {
      case 'Draft':
        return 'draft';

      case 'Submitted':
        return 'submitted';

      case 'Received':
        return 'received';

      case 'Cancelled':
        return 'cancelled';

      default:
        return null;
    }
  }

  String _statusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'draft':
        return 'Draft';
      case 'submitted':
        return 'Submitted';
      case 'received':
        return 'Received';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }
}
