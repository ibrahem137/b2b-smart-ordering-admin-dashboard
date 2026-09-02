import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response.freezed.dart';
part 'categories_response.g.dart';

@freezed
abstract class CategoriesPagination with _$CategoriesPagination {
  const factory CategoriesPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<CategoryModel> categories,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _CategoriesPagination;

  factory CategoriesPagination.fromJson(Map<String, dynamic> json) =>
      _$CategoriesPaginationFromJson(json);
}

@freezed
abstract class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({
    CategoriesPagination? data,
    String? message,
    dynamic errors,
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}
