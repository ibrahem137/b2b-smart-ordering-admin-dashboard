class ApiConstants {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // ================= AUTH =================

  static const String adminLogin = '/admin/login';
  static const String storeLogin = '/store/login';

  // ================= DASHBOARD =================

  static const String dashboardOverview = '/admin/stats/overview';

  static const String dashboardSalesTrend = '/admin/stats/sales-trend';

  static const String dashboardTopStores = '/admin/stats/top-stores';

  static const String dashboardLowStock = '/admin/stats/low-stock';

  // ================= SUPPLIERS =================

  static const String suppliers = '/admin/suppliers';

  // ================= CATEGORIES =================

  static const String categories = '/admin/categories';

  // ================= MASTER PRODUCTS =================

  static const String products = '/admin/products';

  // ================= SUPPLIER PRODUCTS =================

  static const String supplierProducts = '/admin/supplier-products';

  // ================= SUPPLIER OFFERS =================

  static const String supplierOffers = '/admin/supplier-offers';

  // ================= ADMIN STORES =================

  static const String adminStores = '/admin/stores';

  // ================= ORDERS =================

  static const String adminOrders = '/admin/orders';
  static const String storeOrders = '/store/orders';

  // ================= SALES =================

  static const String adminSales = '/admin/sales';
  static const String storeSales = '/store/sales';

  // ================= STORE =================

  static const String storeCatalog = '/store/catalog';
  static const String storeOffers = '/store/offers';
  static const String storeInventory = '/store/inventory';

  ApiConstants._();
}
