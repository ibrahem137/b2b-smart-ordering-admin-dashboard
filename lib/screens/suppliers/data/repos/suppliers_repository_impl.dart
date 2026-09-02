import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/suppliers/data/models/create_supplier_request.dart';
import 'package:dashboard/screens/suppliers/data/models/suppliers_response.dart';
import 'package:dashboard/screens/suppliers/data/models/update_supplier_request.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';
import 'package:flutter/foundation.dart';

class SuppliersRepositoryImpl implements SuppliersRepository {
  final ApiService apiService;

  SuppliersRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<dynamic>> createSupplier(
    CreateSupplierRequest request,
  ) async {
    try {
      final response = await apiService.createSupplier(
        request.name,
        request.phone,
        request.email,
        request.address,
        request.status,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> deleteSupplier(int id) async {
    try {
      final response = await apiService.deleteSupplier(id);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<int>>> getSupplierCategoryIds(int supplierId) async {
    try {
      final response = await apiService.getSupplierCategories(supplierId);

      debugPrint('SUPPLIER CATEGORIES RESPONSE: $response');

      final data = response['data'];

      final List<int> categoryIds = [];

      if (data is List) {
        for (final item in data) {
          if (item is Map<String, dynamic>) {
            final id = item['id'];

            if (id is int) {
              categoryIds.add(id);
            }
          }
        }
      }

      debugPrint('SUPPLIER CATEGORY IDS: $categoryIds');

      return ApiResult.success(categoryIds);
    } catch (error) {
      debugPrint('GET SUPPLIER CATEGORIES ERROR: $error');

      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SuppliersResponse>> getSuppliers({
    String? search,
    String? status,
  }) async {
    try {
      final response = await apiService.getSuppliers(
        search: search,
        status: status,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> updateSupplier(
    UpdateSupplierRequest request,
  ) async {
    try {
      debugPrint('========== UPDATE SUPPLIER ==========');

      debugPrint('ID: ${request.id}');

      debugPrint('NAME: ${request.name}');

      debugPrint('PHONE: ${request.phone}');

      debugPrint('EMAIL: ${request.email}');

      debugPrint('ADDRESS: ${request.address}');

      debugPrint('STATUS: ${request.status}');

      final response = await apiService.updateSupplier(
        request.id,

        // Laravel method spoofing.
        'PATCH',

        request.name,
        request.phone,
        request.email,
        request.address,
        request.status,
      );

      debugPrint('UPDATE RESPONSE: $response');

      return ApiResult.success(response);
    } catch (error) {
      debugPrint('UPDATE ERROR: $error');

      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> updateSupplierCategories({
    required int supplierId,
    required List<int> categoryIds,
  }) async {
    try {
      debugPrint('========== SYNC SUPPLIER CATEGORIES ==========');
      debugPrint('SUPPLIER ID: $supplierId');
      debugPrint('CATEGORY IDS: $categoryIds');

      final body = <String, dynamic>{'category_ids': categoryIds};

      debugPrint('BODY: $body');

      await apiService.updateSupplierCategories(supplierId, body);

      debugPrint('SUPPLIER CATEGORIES SYNC SUCCESS');

      return const ApiResult.success(null);
    } catch (error) {
      debugPrint('SYNC CATEGORIES ERROR: $error');

      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
