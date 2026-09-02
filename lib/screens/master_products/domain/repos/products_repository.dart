import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/master_products/data/models/create_product_request.dart';
import 'package:dashboard/screens/master_products/data/models/products_response.dart';
import 'package:dashboard/screens/master_products/data/models/update_product_request.dart';

abstract class ProductsRepository {
  Future<ApiResult<dynamic>> createProduct(CreateProductRequest request);
  Future<ApiResult<void>> deleteProduct(int id);
  Future<ApiResult<ProductsResponse>> getProducts({
    int? supplierId,
    int? categoryId,
    String? status,
    String? search,
  });

  Future<ApiResult<dynamic>> updateProduct(UpdateProductRequest request);
}
