import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/data/models/create_supplier_request.dart';
import 'package:dashboard/screens/suppliers/data/models/suppliers_response.dart';
import 'package:dashboard/screens/suppliers/data/models/update_supplier_request.dart';

abstract class SuppliersRepository {
  Future<ApiResult<dynamic>> createSupplier(CreateSupplierRequest request);

  Future<ApiResult<dynamic>> deleteSupplier(int id);

  Future<ApiResult<List<int>>> getSupplierCategoryIds(int supplierId);

  Future<ApiResult<SuppliersResponse>> getSuppliers({
    String? search,
    String? status,
  });

  Future<ApiResult<dynamic>> updateSupplier(UpdateSupplierRequest request);

  Future<ApiResult<void>> updateSupplierCategories({
    required int supplierId,
    required List<int> categoryIds,
  });
}
