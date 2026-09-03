import 'package:dashboard/screens/suppliers/data/models/supplier_model.dart';
import 'package:dashboard/screens/suppliers/presentation/components/supplier_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SuppliersTable extends StatelessWidget {
  final List<SupplierModel> suppliers;
  final ValueChanged<SupplierModel>? onEdit;
  final ValueChanged<SupplierModel>? onDelete;

  const SuppliersTable({
    super.key,
    required this.suppliers,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: suppliers.isEmpty
          ? _buildEmptyState(context)
          : Column(
              children: [
                _buildHeader(context),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.outlineVariant,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: suppliers.length,
                    separatorBuilder: (_, _) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: colors.outlineVariant,
                      );
                    },
                    itemBuilder: (context, index) {
                      final supplier = suppliers[index];

                      return SupplierRow(
                        supplier: supplier,
                        onEdit: () {
                          onEdit?.call(supplier);
                        },
                        onDelete: () {
                          onDelete?.call(supplier);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.local_shipping_outlined,
              size: 48,
              color: colors.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'suppliers.no_suppliers'.tr(),
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'suppliers.no_suppliers_description'.tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final headerStyle = theme.textTheme.bodySmall?.copyWith(
      color: colors.onSurfaceVariant,
      fontWeight: FontWeight.w600,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      color: colors.surfaceContainerLow,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'suppliers.supplier'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'common.phone'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'common.email'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'common.address'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'common.status'.tr(),
              style: headerStyle,
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              'common.actions'.tr(),
              textAlign: TextAlign.center,
              style: headerStyle,
            ),
          ),
        ],
      ),
    );
  }
}
