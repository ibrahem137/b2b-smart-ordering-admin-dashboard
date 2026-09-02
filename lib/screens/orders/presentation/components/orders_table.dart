import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:dashboard/screens/orders/presentation/components/order_row.dart';
import 'package:flutter/material.dart';

class OrdersTable extends StatelessWidget {
  final List<OrderModel> orders;
  final void Function(OrderModel order)? onView;

  const OrdersTable({super.key, required this.orders, this.onView});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: orders.isEmpty
                ? Center(
                    child: Text(
                      'No orders found.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: orders.length,
                    separatorBuilder: (_, _) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: colors.outlineVariant,
                      );
                    },
                    itemBuilder: (context, index) {
                      final order = orders[index];

                      return OrderRow(
                        order: order,
                        onView: () {
                          onView?.call(order);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final headerStyle = theme.textTheme.bodySmall?.copyWith(
      color: colors.onSurfaceVariant,
      fontWeight: FontWeight.w700,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        border: Border(bottom: BorderSide(color: colors.outlineVariant)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Order', style: headerStyle)),
          Expanded(flex: 2, child: Text('Store', style: headerStyle)),
          Expanded(flex: 2, child: Text('Supplier', style: headerStyle)),
          Expanded(child: Text('Total Buy', style: headerStyle)),
          Expanded(child: Text('Total Sell', style: headerStyle)),
          Expanded(flex: 2, child: Text('Status', style: headerStyle)),
          Expanded(flex: 2, child: Text('Notes', style: headerStyle)),
          Expanded(child: Text('Date', style: headerStyle)),
          SizedBox(
            width: 70,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('Actions', style: headerStyle),
            ),
          ),
        ],
      ),
    );
  }
}
