import 'package:dio/dio.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../models/category_detailed.dart';
import '../models/create_category_request.dart';
import '../models/update_category_request.dart';

class CategoryRemoteDatasource {
  final Dio _dio;

  CategoryRemoteDatasource(this._dio);

  Future<List<CategoryDetailed>> getCategories({String? type}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (type != null) queryParams['type'] = type;

      final response = await _dio.get(
        ApiConfig.categories,
        queryParameters: queryParams.isEmpty ? null : queryParams,
      );

      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => json as List<dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return apiResponse.data!
            .map(
              (json) => CategoryDetailed.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch categories',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<CategoryDetailed> getCategoryById(String id) async {
    try {
      final response = await _dio.get('${ApiConfig.categories}/$id');

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return CategoryDetailed.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch category',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<CategoryDetailed> createCategory(CreateCategoryRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.categories,
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return CategoryDetailed.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to create category',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<CategoryDetailed> updateCategory(
    String id,
    UpdateCategoryRequest request,
  ) async {
    try {
      final response = await _dio.put(
        '${ApiConfig.categories}/$id',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return CategoryDetailed.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to update category',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _dio.delete('${ApiConfig.categories}/$id');
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to delete category',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }
}
