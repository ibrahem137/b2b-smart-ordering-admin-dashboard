// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesPagination _$CategoriesPaginationFromJson(
  Map<String, dynamic> json,
) => _CategoriesPagination(
  currentPage: (json['current_page'] as num).toInt(),
  categories: (json['data'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$CategoriesPaginationToJson(
  _CategoriesPagination instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.categories,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'total': instance.total,
};

_CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    _CategoriesResponse(
      data: json['data'] == null
          ? null
          : CategoriesPagination.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      errors: json['errors'],
    );

Map<String, dynamic> _$CategoriesResponseToJson(_CategoriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'errors': instance.errors,
    };
