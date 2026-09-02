import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/supplier_products/data/models/create_supplier_product_request.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_products_response.dart';
import 'package:dashboard/screens/supplier_products/data/models/update_supplier_product_request.dart';
import 'package:dashboard/screens/supplier_products/domain/repos/supplier_products_repository.dart';

class SupplierProductsRepositoryImpl implements SupplierProductsRepository {
  final ApiService apiService;

  SupplierProductsRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<dynamic>> createSupplierProduct(
    CreateSupplierProductRequest request,
  ) async {
    try {
      final response = await apiService.createSupplierProduct(
        request.supplierId,
        request.productId,
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
  Future<ApiResult<void>> deleteSupplierProduct(int id) async {
    try {
      await apiService.deleteSupplierProduct(id);

      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SupplierProductsResponse>> getSupplierProducts({
    int? supplierId,
    int? productId,
    String? status,
  }) async {
    try {
      final response = await apiService.getSupplierProducts(
        supplierId: supplierId,
        productId: productId,
        status: status,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> updateSupplierProduct(
    UpdateSupplierProductRequest request,
  ) async {
    try {
      final response = await apiService.updateSupplierProduct(
        request.id,
        'PATCH',
        request.supplierId,
        request.productId,
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
