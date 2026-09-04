import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:dashboard/screens/stores/presentation/components/store_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StoresTable extends StatelessWidget {
  final List<StoreModel> stores;
  final void Function(StoreModel store)? onView;
  final void Function(StoreModel store)? onToggleStatus;
  final void Function(StoreModel store)? onDelete;

  const StoresTable({
    super.key,
    required this.stores,
    this.onView,
    this.onToggleStatus,
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
            child: stores.isEmpty
                ? Center(
                    child: Text(
                      'stores.no_stores_found'.tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: stores.length,
                    separatorBuilder: (_, _) => Divider(
                      height: 1,
                      thickness: 1,
                      color: colors.outlineVariant,
                    ),
                    itemBuilder: (context, index) {
                      final store = stores[index];

                      return StoreRow(
                        store: store,
                        onView: () {
                          onView?.call(store);
                        },
                        onToggleStatus: () {
                          onToggleStatus?.call(store);
                        },
                        onDelete: () {
                          onDelete?.call(store);
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
          Expanded(
            flex: 3,
            child: Text('stores.columns.store'.tr(), style: headerStyle),
          ),
          Expanded(
            flex: 2,
            child: Text('stores.columns.owner'.tr(), style: headerStyle),
          ),
          Expanded(
            flex: 2,
            child: Text('stores.columns.phone'.tr(), style: headerStyle),
          ),
          Expanded(
            flex: 3,
            child: Text('stores.columns.email'.tr(), style: headerStyle),
          ),
          Expanded(
            flex: 2,
            child: Text('common.status'.tr(), style: headerStyle),
          ),
          SizedBox(
            width: 140,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('common.actions'.tr(), style: headerStyle),
            ),
          ),
        ],
      ),
    );
  }
}
