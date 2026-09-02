import 'package:dashboard/core/router/routes.dart';
import 'package:dashboard/screens/auth/presentation/admin_login_screen.dart';
import 'package:dashboard/screens/categories/presentation/categories_screen.dart';
import 'package:dashboard/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:dashboard/screens/main/main_screen.dart';
import 'package:dashboard/screens/master_products/presentation/master_products_screen.dart';
import 'package:dashboard/screens/orders/presentation/orders_screen.dart';
import 'package:dashboard/screens/sales/presentation/sales_screen.dart';
import 'package:dashboard/screens/settings/presentation/settings_screen.dart';
import 'package:dashboard/screens/supplier_products/presentation/supplier_products_screen.dart';
import 'package:dashboard/screens/suppliers/presentation/suppliers_screen.dart';
import 'package:flutter/material.dart';

class DashRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.masterProductsScreen:
        return MaterialPageRoute(builder: (_) => const MasterProductsScreen());
      case Routes.ordersScreen:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case Routes.salesScreen:
        return MaterialPageRoute(builder: (_) => const SalesScreen());
      case Routes.suppliersScreen:
        return MaterialPageRoute(builder: (_) => const SuppliersScreen());
      case Routes.supplierProductsScreen:
        return MaterialPageRoute(
          builder: (_) => const SupplierProductsScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const AdminLoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('Page Not Found'))),
        );
    }
  }
}
