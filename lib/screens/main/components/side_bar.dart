import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  final SidebarXController controller;

  const SideBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SidebarX(
      controller: controller,
      showToggleButton: false,
      headerDivider: Divider(
        thickness: 1,
        height: 1,
        color: colors.outlineVariant,
      ),
      theme: SidebarXTheme(
        width: 250,
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(
            right: BorderSide(color: colors.outlineVariant),
          ),
        ),
        textStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: colors.onSurfaceVariant,
          size: 22,
        ),
        hoverColor: colors.primary.withValues(alpha: .08),
        hoverTextStyle: theme.textTheme.bodyMedium
            ?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            ),
        hoverIconTheme: IconThemeData(
          color: colors.primary,
          size: 22,
        ),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(
          left: 20,
        ),
        selectedItemDecoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        selectedTextStyle: theme.textTheme.bodyMedium
            ?.copyWith(
              color: colors.onPrimary,
              fontWeight: FontWeight.w700,
            ),
        selectedIconTheme: IconThemeData(
          color: colors.onPrimary,
          size: 22,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 250,
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(
            right: BorderSide(color: colors.outlineVariant),
          ),
        ),
      ),
      items: [
        SidebarXItem(
          icon: Icons.home_outlined,
          label: 'navigation.dashboard'.tr(),
        ),
        SidebarXItem(
          icon: Icons.people_alt_outlined,
          label: 'navigation.suppliers'.tr(),
        ),
        SidebarXItem(
          icon: Icons.menu_book_outlined,
          label: 'navigation.categories'.tr(),
        ),
        SidebarXItem(
          icon: Icons.view_in_ar_rounded,
          label: 'navigation.master_products'.tr(),
        ),
        SidebarXItem(
          icon: Icons.inventory_2_outlined,
          label: 'navigation.supplier_products'.tr(),
        ),
        SidebarXItem(
          icon: Icons.shopping_cart_outlined,
          label: 'navigation.orders'.tr(),
        ),
        SidebarXItem(
          icon: Icons.trending_up,
          label: 'navigation.sales'.tr(),
        ),
        SidebarXItem(
          icon: Icons.settings_outlined,
          label: 'navigation.settings'.tr(),
        ),
      ],
    );
  }
}
