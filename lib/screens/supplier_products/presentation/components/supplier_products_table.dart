import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:dashboard/screens/supplier_products/presentation/components/supplier_product_row.dart';
import 'package:flutter/material.dart';

class SupplierProductsTable extends StatelessWidget {
  final List<SupplierProductModel> products;

  final void Function(SupplierProductModel product)? onEdit;

  final void Function(SupplierProductModel product)? onDelete;

  const SupplierProductsTable({
    super.key,
    required this.products,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Text(
                      'No supplier offers found.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: products.length,
                    separatorBuilder: (_, _) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: colors.outlineVariant,
                      );
                    },
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return SupplierProductRow(
                        product: product,
                        onEdit: () {
                          onEdit?.call(product);
                        },
                        onDelete: () {
                          onDelete?.call(product);
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
          Expanded(flex: 3, child: Text('Product', style: headerStyle)),
          Expanded(flex: 3, child: Text('Supplier', style: headerStyle)),
          Expanded(flex: 2, child: Text('Category', style: headerStyle)),
          Expanded(child: Text('Buy Price', style: headerStyle)),
          Expanded(child: Text('Stock', style: headerStyle)),
          Expanded(flex: 2, child: Text('Status', style: headerStyle)),
          Expanded(flex: 2, child: Text('Last Updated', style: headerStyle)),
          SizedBox(
            width: 90,
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
