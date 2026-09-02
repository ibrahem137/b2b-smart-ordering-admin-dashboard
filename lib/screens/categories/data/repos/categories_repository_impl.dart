import 'package:dashboard/core/networking/api_error_handler.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/core/networking/api_service.dart';
import 'package:dashboard/screens/categories/data/models/categories_response.dart';
import 'package:dashboard/screens/categories/data/models/create_category_request.dart';
import 'package:dashboard/screens/categories/data/models/update_category_request.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';
import 'package:flutter/foundation.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final ApiService apiService;

  CategoriesRepositoryImpl(this.apiService);

  @override
  Future<ApiResult<dynamic>> createCategory(
    CreateCategoryRequest request,
  ) async {
    try {
      debugPrint('========== CREATE CATEGORY ==========');
      debugPrint('NAME: ${request.name}');
      debugPrint('COLOR: ${request.color}');

      final response = await apiService.createCategory({
        'name': request.name,
        'color': request.color,
      });

      debugPrint('CREATE CATEGORY RESPONSE: $response');

      return ApiResult.success(response);
    } catch (error) {
      debugPrint('CREATE CATEGORY ERROR: $error');

      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> deleteCategory(int id) async {
    try {
      debugPrint('========== DELETE CATEGORY ==========');
      debugPrint('CATEGORY ID: $id');

      await apiService.deleteCategory(id);

      return const ApiResult.success(null);
    } catch (error) {
      debugPrint('DELETE CATEGORY ERROR: $error');

      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CategoriesResponse>> getCategories({String? search}) async {
    try {
      final response = await apiService.getCategories(
        search: search,
        perPage: 15,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<dynamic>> updateCategory(
    UpdateCategoryRequest request,
  ) async {
    try {
      debugPrint('========== UPDATE CATEGORY ==========');
      debugPrint('ID: ${request.id}');
      debugPrint('NAME: ${request.name}');
      debugPrint('COLOR: ${request.color}');

      final response = await apiService.updateCategory(request.id, {
        if (request.name != null) 'name': request.name,
        if (request.color != null) 'color': request.color,
      });

      debugPrint('UPDATE CATEGORY RESPONSE: $response');

      return ApiResult.success(response);
    } catch (error) {
      debugPrint('UPDATE CATEGORY ERROR: $error');

      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
