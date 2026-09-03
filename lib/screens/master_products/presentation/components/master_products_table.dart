import 'package:dashboard/screens/master_products/data/models/master_product_model.dart';
import 'package:dashboard/screens/master_products/presentation/components/master_product_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MasterProductsTable extends StatelessWidget {
  final List<MasterProductModel> products;
  final void Function(MasterProductModel product)? onEdit;
  final void Function(MasterProductModel product)? onDelete;

  const MasterProductsTable({
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
                      'master_products.no_products_found_period'
                          .tr(),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(
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

                      return MasterProductRow(
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        border: Border(
          bottom: BorderSide(color: colors.outlineVariant),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'master_products.table_product_name'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'master_products.table_category'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'master_products.table_description'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'master_products.table_supplier'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'master_products.table_status'.tr(),
              style: headerStyle,
            ),
          ),
          SizedBox(
            width: 90,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'common.actions'.tr(),
                style: headerStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
