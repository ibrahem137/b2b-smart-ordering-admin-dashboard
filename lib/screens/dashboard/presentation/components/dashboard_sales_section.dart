import 'package:dashboard/screens/dashboard/presentation/components/recent_sales.dart';
import 'package:dashboard/screens/dashboard/presentation/components/supplier_products.dart';
import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:flutter/material.dart';

class DashboardSalesSection extends StatelessWidget {
  final List<SaleModel> sales;
  final List<SupplierProductModel> supplierProducts;

  final VoidCallback? onRefreshSales;
  final VoidCallback? onRefreshSupplierProducts;

  const DashboardSalesSection({
    super.key,
    required this.sales,
    required this.supplierProducts,
    this.onRefreshSales,
    this.onRefreshSupplierProducts,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 1000;

        if (isNarrow) {
          return Column(
            children: [
              SizedBox(
                height: 600,
                child: RecentSales(sales: sales, onRefresh: onRefreshSales),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 600,
                child: SupplierProducts(
                  products: supplierProducts,
                  onRefresh: onRefreshSupplierProducts,
                ),
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 600,
                child: RecentSales(sales: sales, onRefresh: onRefreshSales),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: SizedBox(
                height: 600,
                child: SupplierProducts(
                  products: supplierProducts,
                  onRefresh: onRefreshSupplierProducts,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
