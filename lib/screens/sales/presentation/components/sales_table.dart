import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:dashboard/screens/sales/presentation/components/sale_row.dart';
import 'package:flutter/material.dart';

class SalesTable extends StatelessWidget {
  final List<SaleModel> sales;
  final void Function(SaleModel sale)? onView;

  const SalesTable({super.key, required this.sales, this.onView});

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
            child: sales.isEmpty
                ? Center(
                    child: Text(
                      'No sales found.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: sales.length,
                    separatorBuilder: (_, _) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: colors.outlineVariant,
                      );
                    },
                    itemBuilder: (context, index) {
                      final sale = sales[index];

                      return SaleRow(
                        sale: sale,
                        onView: () {
                          onView?.call(sale);
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
          Expanded(flex: 2, child: Text('Sale', style: headerStyle)),
          Expanded(flex: 2, child: Text('Store', style: headerStyle)),
          Expanded(flex: 2, child: Text('Customer', style: headerStyle)),
          Expanded(child: Text('Total', style: headerStyle)),
          Expanded(child: Text('Cost', style: headerStyle)),
          Expanded(flex: 2, child: Text('Profit', style: headerStyle)),
          Expanded(child: Text('Paid', style: headerStyle)),
          Expanded(flex: 2, child: Text('Status', style: headerStyle)),
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
