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
          border: Border(right: BorderSide(color: colors.outlineVariant)),
        ),
        textStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: colors.onSurfaceVariant, size: 22),
        hoverColor: colors.primary.withValues(alpha: .08),
        hoverTextStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.primary,
          fontWeight: FontWeight.w600,
        ),
        hoverIconTheme: IconThemeData(color: colors.primary, size: 22),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemDecoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        selectedTextStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onPrimary,
          fontWeight: FontWeight.w700,
        ),
        selectedIconTheme: IconThemeData(color: colors.onPrimary, size: 22),
      ),
      extendedTheme: SidebarXTheme(
        width: 250,
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(right: BorderSide(color: colors.outlineVariant)),
        ),
      ),
      items: const [
        SidebarXItem(icon: Icons.home_outlined, label: 'Dashboard'),
        SidebarXItem(icon: Icons.people_alt_outlined, label: 'Suppliers'),
        SidebarXItem(icon: Icons.menu_book_outlined, label: 'Categories'),
        SidebarXItem(icon: Icons.view_in_ar_rounded, label: 'Master Products'),
        SidebarXItem(
          icon: Icons.inventory_2_outlined,
          label: 'Supplier Products',
        ),
        SidebarXItem(icon: Icons.shopping_cart_outlined, label: 'Orders'),
        SidebarXItem(icon: Icons.trending_up, label: 'Sales'),
        SidebarXItem(icon: Icons.settings_outlined, label: 'Settings'),
      ],
    );
  }
}
