import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/categories/data/models/categories_response.dart';
import 'package:dashboard/screens/categories/data/models/create_category_request.dart';
import 'package:dashboard/screens/categories/data/models/update_category_request.dart';

abstract class CategoriesRepository {
  Future<ApiResult<dynamic>> createCategory(CreateCategoryRequest request);

  Future<ApiResult<void>> deleteCategory(int id);
  Future<ApiResult<CategoriesResponse>> getCategories({String? search});
  Future<ApiResult<dynamic>> updateCategory(UpdateCategoryRequest request);
}
