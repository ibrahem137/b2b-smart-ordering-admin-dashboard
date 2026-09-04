import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/core/networking/dio_factory.dart';
import 'package:dashboard/core/services/admin_session.dart';
import 'package:dashboard/core/services/token_storage.dart';
import 'package:dashboard/core/theme/cubit/theme_cubit.dart';
import 'package:dashboard/screens/auth/data/repos/auth_repository_impl.dart';
import 'package:dashboard/screens/auth/domain/repos/auth_repository.dart';
import 'package:dashboard/screens/auth/presentation/cubit/auth_cubit.dart';
import 'package:dashboard/screens/categories/data/repos/categories_repository_impl.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';
import 'package:dashboard/screens/categories/presentation/cubit/categories_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/create_category_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/delete_category_cubit.dart';
import 'package:dashboard/screens/categories/presentation/cubit/update_category_cubit.dart';
import 'package:dashboard/screens/dashboard/data/repos/dashboard_repository_impl.dart';
import 'package:dashboard/screens/dashboard/domain/repos/dashboard_repository.dart';
import 'package:dashboard/screens/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:dashboard/screens/master_products/data/repos/products_repository_impl.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/create_product_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/delete_product_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/products_cubit.dart';
import 'package:dashboard/screens/master_products/presentation/cubit/update_product_cubit.dart';
import 'package:dashboard/screens/orders/data/repos/orders_repository_impl.dart';
import 'package:dashboard/screens/orders/domain/repos/orders_repository.dart';
import 'package:dashboard/screens/orders/presentation/cubit/orders_cubit.dart';
import 'package:dashboard/screens/orders/presentation/cubit/update_order_status_cubit.dart';
import 'package:dashboard/screens/sales/data/repos/sales_repository_impl.dart';
import 'package:dashboard/screens/sales/domain/repos/sales_repository.dart';
import 'package:dashboard/screens/sales/presentation/cubit/sales_cubit.dart';
import 'package:dashboard/screens/settings/presentation/cubit/settings_cubit.dart';
import 'package:dashboard/screens/stores/data/repos/stores_repository_impl.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/create_store_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/delete_store_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/store_details_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/stores_cubit.dart';
import 'package:dashboard/screens/stores/presentation/cubit/update_store_status_cubit.dart';
import 'package:dashboard/screens/supplier_offers/data/repos/supplier_offers_repository_impl.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/create_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/delete_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offers_cubit.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/update_supplier_offer_cubit.dart';
import 'package:dashboard/screens/supplier_products/data/repos/supplier_products_repository_impl.dart';
import 'package:dashboard/screens/supplier_products/domain/repos/supplier_products_repository.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/create_supplier_product_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/delete_supplier_product_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/supplier_products_cubit.dart';
import 'package:dashboard/screens/supplier_products/presentation/cubit/update_supplier_product_cubit.dart';
import 'package:dashboard/screens/suppliers/data/repos/suppliers_repository_impl.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/create_supplier_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/delete_supplier_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/suppliers_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_supplier_categories_cubit.dart';
import 'package:dashboard/screens/suppliers/presentation/cubit/update_suppliers_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // ================= STORAGE =================

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  getIt.registerLazySingleton<TokenStorage>(
    () => TokenStorage(getIt<FlutterSecureStorage>()),
  );

  // ================= NETWORK =================

  getIt.registerLazySingleton<Dio>(
    () => DioFactory.create(getIt<TokenStorage>()),
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // ================= AUTH =================

  getIt.registerLazySingleton<AdminSession>(() => AdminSession());

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<ApiService>(),
      getIt<TokenStorage>(),
      getIt<AdminSession>(),
    ),
  );

  getIt.registerFactory<AdminLoginCubit>(
    () => AdminLoginCubit(getIt<AuthRepository>()),
  );

  // ================= DASHBOARD =================

  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<DashboardCubit>(
    () => DashboardCubit(getIt<DashboardRepository>()),
  );

  // ================= SUPPLIERS =================

  getIt.registerLazySingleton<SuppliersRepository>(
    () => SuppliersRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<SuppliersCubit>(
    () => SuppliersCubit(getIt<SuppliersRepository>()),
  );

  getIt.registerFactory<CreateSupplierCubit>(
    () => CreateSupplierCubit(getIt<SuppliersRepository>()),
  );

  getIt.registerFactory<UpdateSupplierCubit>(
    () => UpdateSupplierCubit(getIt<SuppliersRepository>()),
  );

  getIt.registerFactory<DeleteSupplierCubit>(
    () => DeleteSupplierCubit(getIt<SuppliersRepository>()),
  );

  getIt.registerFactory<UpdateSupplierCategoriesCubit>(
    () => UpdateSupplierCategoriesCubit(getIt<SuppliersRepository>()),
  );

  getIt.registerFactory<SupplierCategoriesCubit>(
    () => SupplierCategoriesCubit(getIt<SuppliersRepository>()),
  );

  // ================= CATEGORIES =================

  getIt.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepository>()),
  );

  getIt.registerFactory<CreateCategoryCubit>(
    () => CreateCategoryCubit(getIt<CategoriesRepository>()),
  );

  getIt.registerFactory<UpdateCategoryCubit>(
    () => UpdateCategoryCubit(getIt<CategoriesRepository>()),
  );

  getIt.registerFactory<DeleteCategoryCubit>(
    () => DeleteCategoryCubit(getIt<CategoriesRepository>()),
  );

  // ================= MASTER PRODUCTS =================

  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepository>()),
  );

  getIt.registerFactory<CreateProductCubit>(
    () => CreateProductCubit(getIt<ProductsRepository>()),
  );

  getIt.registerFactory<UpdateProductCubit>(
    () => UpdateProductCubit(getIt<ProductsRepository>()),
  );

  getIt.registerFactory<DeleteProductCubit>(
    () => DeleteProductCubit(getIt<ProductsRepository>()),
  );

  // ================= SUPPLIER PRODUCTS =================

  getIt.registerLazySingleton<SupplierProductsRepository>(
    () => SupplierProductsRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<SupplierProductsCubit>(
    () => SupplierProductsCubit(getIt<SupplierProductsRepository>()),
  );

  getIt.registerFactory<CreateSupplierProductCubit>(
    () => CreateSupplierProductCubit(getIt<SupplierProductsRepository>()),
  );

  getIt.registerFactory<UpdateSupplierProductCubit>(
    () => UpdateSupplierProductCubit(getIt<SupplierProductsRepository>()),
  );

  getIt.registerFactory<DeleteSupplierProductCubit>(
    () => DeleteSupplierProductCubit(getIt<SupplierProductsRepository>()),
  );

  // ================= SUPPLIER OFFERS =================

  getIt.registerLazySingleton<SupplierOffersRepository>(
    () => SupplierOffersRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<SupplierOffersCubit>(
    () => SupplierOffersCubit(getIt<SupplierOffersRepository>()),
  );

  getIt.registerFactory<CreateSupplierOfferCubit>(
    () => CreateSupplierOfferCubit(getIt<SupplierOffersRepository>()),
  );

  getIt.registerFactory<UpdateSupplierOfferCubit>(
    () => UpdateSupplierOfferCubit(getIt<SupplierOffersRepository>()),
  );

  getIt.registerFactory<DeleteSupplierOfferCubit>(
    () => DeleteSupplierOfferCubit(getIt<SupplierOffersRepository>()),
  );

  // ================= STORES =================

  getIt.registerLazySingleton<StoresRepository>(
    () => StoresRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<StoresCubit>(
    () => StoresCubit(getIt<StoresRepository>()),
  );

  getIt.registerFactory<StoreDetailsCubit>(
    () => StoreDetailsCubit(getIt<StoresRepository>()),
  );

  getIt.registerFactory<UpdateStoreStatusCubit>(
    () => UpdateStoreStatusCubit(getIt<StoresRepository>()),
  );

  getIt.registerFactory<CreateStoreCubit>(
    () => CreateStoreCubit(getIt<StoresRepository>()),
  );

  getIt.registerFactory<DeleteStoreCubit>(
    () => DeleteStoreCubit(getIt<StoresRepository>()),
  );

  // ================= ORDERS =================

  getIt.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<OrdersCubit>(
    () => OrdersCubit(getIt<OrdersRepository>()),
  );

  getIt.registerFactory<UpdateOrderStatusCubit>(
    () => UpdateOrderStatusCubit(getIt<OrdersRepository>()),
  );

  // ================= SALES =================

  getIt.registerLazySingleton<SalesRepository>(
    () => SalesRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<SalesCubit>(() => SalesCubit(getIt<SalesRepository>()));

  // ================= SETTINGS =================

  getIt.registerFactory<SettingsCubit>(
    () => SettingsCubit(getIt<TokenStorage>(), getIt<AdminSession>()),
  );

  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
