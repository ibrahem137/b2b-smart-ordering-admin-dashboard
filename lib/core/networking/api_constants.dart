class ApiConstants {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Auth
  static const String adminLogin = '/admin/login';

  static const String storeLogin = '/store/login';
  // Dashboard
  // Dashboard Stats
  static const String dashboardOverview = '/admin/stats/overview';

  static const String dashboardSalesTrend = '/admin/stats/sales-trend';

  static const String dashboardTopStores = '/admin/stats/top-stores';

  static const String dashboardLowStock = '/admin/stats/low-stock';

  // Suppliers
  static const String suppliers = '/admin/suppliers';

  // Categories
  static const String categories = '/admin/categories';

  // Master Products
  static const String products = '/admin/products';

  // Supplier Products
  static const String supplierProducts = '/admin/supplier-products';

  // Orders
  static const String adminOrders = '/admin/orders';

  static const String storeOrders = '/store/orders';
  // Sales
  static const String adminSales = '/admin/sales';

  static const String storeSales = '/store/sales';
  // Store
  static const String storeCatalog = '/store/catalog';

  static const String storeOffers = '/store/offers';
  static const String storeInventory = '/store/inventory';
  ApiConstants._();
}
