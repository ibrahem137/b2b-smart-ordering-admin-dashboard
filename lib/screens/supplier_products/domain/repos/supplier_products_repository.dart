import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_products/data/models/create_supplier_product_request.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_products_response.dart';
import 'package:dashboard/screens/supplier_products/data/models/update_supplier_product_request.dart';

abstract class SupplierProductsRepository {
  Future<ApiResult<dynamic>> createSupplierProduct(
    CreateSupplierProductRequest request,
  );
  Future<ApiResult<void>> deleteSupplierProduct(int id);
  Future<ApiResult<SupplierProductsResponse>> getSupplierProducts({
    int? supplierId,
    int? productId,
    String? status,
  });

  Future<ApiResult<dynamic>> updateSupplierProduct(
    UpdateSupplierProductRequest request,
  );
}
