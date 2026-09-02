import 'package:dashboard/screens/auth/data/models/admin_login_response.dart';
import 'package:dashboard/screens/categories/data/models/categories_response.dart';
import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';
import 'package:dashboard/screens/master_products/data/models/products_response.dart';
import 'package:dashboard/screens/orders/data/models/orders_response.dart';
import 'package:dashboard/screens/sales/data/models/sales_response.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_products_response.dart';
import 'package:dashboard/screens/suppliers/data/models/suppliers_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  // ================= AUTH =================

  @MultiPart()
  @POST(ApiConstants.adminLogin)
  Future<AdminLoginResponse> adminLogin(
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
  );

  // ================= CATEGORIES =================

  @POST(ApiConstants.categories)
  Future<dynamic> createCategory(@Body() Map<String, dynamic> body);

  // ================= MASTER PRODUCTS =================

  @MultiPart()
  @POST(ApiConstants.products)
  Future<dynamic> createProduct(
    @Part(name: 'supplier_id') int supplierId,
    @Part(name: 'category_id') int categoryId,
    @Part(name: 'name') String name,
    @Part(name: 'description') String? description,
    @Part(name: 'buy_price') double buyPrice,
    @Part(name: 'stock_quantity') int stockQuantity,
    @Part(name: 'status') String status,
  );

  // ================= SUPPLIERS =================

  @MultiPart()
  @POST(ApiConstants.suppliers)
  Future<dynamic> createSupplier(
    @Part(name: 'name') String name,
    @Part(name: 'phone') String? phone,
    @Part(name: 'email') String? email,
    @Part(name: 'address') String? address,
    @Part(name: 'status') String status,
  );

  // ================= SUPPLIER PRODUCTS =================

  @MultiPart()
  @POST(ApiConstants.supplierProducts)
  Future<dynamic> createSupplierProduct(
    @Part(name: 'supplier_id') int supplierId,
    @Part(name: 'product_id') int productId,
    @Part(name: 'buy_price') double buyPrice,
    @Part(name: 'stock_quantity') int stockQuantity,
    @Part(name: 'status') String status,
  );

  @DELETE('${ApiConstants.categories}/{id}')
  Future<void> deleteCategory(@Path('id') int id);

  @DELETE('${ApiConstants.products}/{id}')
  Future<void> deleteProduct(@Path('id') int id);

  @DELETE('${ApiConstants.suppliers}/{id}')
  Future<dynamic> deleteSupplier(@Path('id') int id);

  @DELETE('${ApiConstants.supplierProducts}/{id}')
  Future<void> deleteSupplierProduct(@Path('id') int id);

  @GET(ApiConstants.categories)
  Future<CategoriesResponse> getCategories({
    @Query('search') String? search,
    @Query('per_page') int perPage = 15,
  });

  @GET(ApiConstants.dashboardLowStock)
  Future<LowStockResponse> getDashboardLowStock();

  // ================= DASHBOARD =================

  @GET(ApiConstants.dashboardOverview)
  Future<DashboardOverviewResponse> getDashboardOverview();

  @GET(ApiConstants.dashboardSalesTrend)
  Future<SalesTrendResponse> getDashboardSalesTrend();

  @GET(ApiConstants.dashboardTopStores)
  Future<TopStoresResponse> getDashboardTopStores();

  // ================= ORDERS =================

  @GET(ApiConstants.adminOrders)
  Future<OrdersResponse> getOrders({
    @Query('store_id') int? storeId,
    @Query('supplier_id') int? supplierId,
    @Query('status') String? status,
    @Query('from_date') String? fromDate,
    @Query('to_date') String? toDate,
    @Query('per_page') int perPage = 15,
  });

  @GET(ApiConstants.products)
  Future<ProductsResponse> getProducts({
    @Query('supplier_id') int? supplierId,
    @Query('category_id') int? categoryId,
    @Query('status') String? status,
    @Query('search') String? search,
    @Query('per_page') int perPage = 15,
  });

  // ================= SALES =================

  @GET(ApiConstants.adminSales)
  Future<SalesResponse> getSales({
    @Query('store_id') int? storeId,
    @Query('customer_id') int? customerId,
    @Query('status') String? status,
    @Query('from_date') String? fromDate,
    @Query('to_date') String? toDate,
    @Query('per_page') int perPage = 15,
  });

  @GET('${ApiConstants.suppliers}/{supplier}/categories')
  Future<dynamic> getSupplierCategories(@Path('supplier') int supplierId);

  @GET(ApiConstants.supplierProducts)
  Future<SupplierProductsResponse> getSupplierProducts({
    @Query('supplier_id') int? supplierId,
    @Query('product_id') int? productId,
    @Query('status') String? status,
    @Query('per_page') int perPage = 15,
  });

  @GET(ApiConstants.suppliers)
  Future<SuppliersResponse> getSuppliers({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('per_page') int perPage = 15,
  });

  @PATCH('${ApiConstants.categories}/{id}')
  Future<dynamic> updateCategory(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @MultiPart()
  @POST('${ApiConstants.products}/{id}')
  Future<dynamic> updateProduct(
    @Path('id') int id,
    @Part(name: '_method') String method,
    @Part(name: 'supplier_id') int supplierId,
    @Part(name: 'category_id') int categoryId,
    @Part(name: 'name') String name,
    @Part(name: 'description') String? description,
    @Part(name: 'buy_price') double buyPrice,
    @Part(name: 'stock_quantity') int stockQuantity,
    @Part(name: 'status') String status,
  );

  @MultiPart()
  @POST('${ApiConstants.suppliers}/{id}')
  Future<dynamic> updateSupplier(
    @Path('id') int id,
    @Part(name: '_method') String method,
    @Part(name: 'name') String? name,
    @Part(name: 'phone') String? phone,
    @Part(name: 'email') String? email,
    @Part(name: 'address') String? address,
    @Part(name: 'status') String? status,
  );

  @PUT('${ApiConstants.suppliers}/{supplier}/categories')
  Future<void> updateSupplierCategories(
    @Path('supplier') int supplierId,
    @Body() Map<String, dynamic> body,
  );

  @MultiPart()
  @POST('${ApiConstants.supplierProducts}/{id}')
  Future<dynamic> updateSupplierProduct(
    @Path('id') int id,
    @Part(name: '_method') String method,
    @Part(name: 'supplier_id') int supplierId,
    @Part(name: 'product_id') int productId,
    @Part(name: 'buy_price') double buyPrice,
    @Part(name: 'stock_quantity') int stockQuantity,
    @Part(name: 'status') String status,
  );
}
