import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/master_products/data/models/create_product_request.dart';
import 'package:dashboard/screens/master_products/data/models/products_response.dart';
import 'package:dashboard/screens/master_products/data/models/update_product_request.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ApiService apiService;

  ProductsRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<dynamic>> createProduct(CreateProductRequest request) async {
    try {
      final response = await apiService.createProduct(
        request.supplierId,
        request.categoryId,
        request.name,
        request.description,
        request.buyPrice,
        request.stockQuantity,
        request.status,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> deleteProduct(int id) async {
    try {
      await apiService.deleteProduct(id);

      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ProductsResponse>> getProducts({
    int? supplierId,
    int? categoryId,
    String? status,
    String? search,
  }) async {
    try {
      final response = await apiService.getProducts(
        supplierId: supplierId,
        categoryId: categoryId,
        status: status,
        search: search,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> updateProduct(UpdateProductRequest request) async {
    try {
      final response = await apiService.updateProduct(
        request.id,
        'PATCH',
        request.supplierId,
        request.categoryId,
        request.name,
        request.description,
        request.buyPrice,
        request.stockQuantity,
        request.status,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
