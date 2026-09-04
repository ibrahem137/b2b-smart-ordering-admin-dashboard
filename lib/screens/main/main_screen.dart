import 'package:dashboard/screens/categories/presentation/categories_screen.dart';
import 'package:dashboard/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:dashboard/screens/main/components/side_bar.dart';
import 'package:dashboard/screens/master_products/presentation/master_products_screen.dart';
import 'package:dashboard/screens/orders/presentation/orders_screen.dart';
import 'package:dashboard/screens/sales/presentation/sales_screen.dart';
import 'package:dashboard/screens/settings/presentation/settings_screen.dart';
import 'package:dashboard/screens/stores/presentation/stores_screen.dart';
import 'package:dashboard/screens/supplier_offers/presentation/supplier_offers_screen.dart';
import 'package:dashboard/screens/supplier_products/presentation/supplier_products_screen.dart';
import 'package:dashboard/screens/suppliers/presentation/suppliers_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final List<Widget> _screens = const [
    DashboardScreen(),
    SuppliersScreen(),
    CategoriesScreen(),
    MasterProductsScreen(),
    SupplierProductsScreen(),
    SupplierOffersScreen(),
    StoresScreen(),
    OrdersScreen(),
    SalesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        centerTitle: true,

        // App name
        title: Text(
          'app_name'.tr(),
          style: theme.textTheme.titleLarge?.copyWith(
            color: colors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),

        leadingWidth: 150,

        // Admin Panel
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'main.admin_panel'.tr(),
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: colors.outlineVariant),
        ),
      ),
      body: Row(
        children: [
          SideBar(controller: _controller),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final index = _controller.selectedIndex;

                if (index < 0 || index >= _screens.length) {
                  return const SizedBox.shrink();
                }

                return _screens[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
