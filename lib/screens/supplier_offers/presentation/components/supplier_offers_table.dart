import 'package:dashboard/screens/supplier_offers/data/models/supplier_offer_model.dart';
import 'package:dashboard/screens/supplier_offers/presentation/components/supplier_offer_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupplierOffersTable extends StatelessWidget {
  final List<SupplierOfferModel> offers;
  final void Function(SupplierOfferModel offer)? onEdit;
  final void Function(SupplierOfferModel offer)? onDelete;

  const SupplierOffersTable({
    super.key,
    required this.offers,
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
            child: offers.isEmpty
                ? Center(
                    child: Text(
                      'supplier_offers.no_offers_found'.tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: offers.length,
                    separatorBuilder: (_, _) {
                      return Divider(
                        height: 1,
                        thickness: 1,
                        color: colors.outlineVariant,
                      );
                    },
                    itemBuilder: (context, index) {
                      final offer = offers[index];

                      return SupplierOfferRow(
                        offer: offer,
                        onEdit: () {
                          onEdit?.call(offer);
                        },
                        onDelete: () {
                          onDelete?.call(offer);
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
            child: Text(
              'supplier_offers.columns.product'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'supplier_offers.columns.supplier'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'supplier_offers.columns.offer_price'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            child: Text(
              'supplier_offers.columns.stock'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'supplier_offers.columns.status'.tr(),
              style: headerStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'supplier_offers.columns.expires_at'.tr(),
              style: headerStyle,
            ),
          ),
          SizedBox(
            width: 90,
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
