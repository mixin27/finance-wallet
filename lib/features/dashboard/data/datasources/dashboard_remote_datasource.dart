import 'package:dio/dio.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../models/dashboard_overview.dart';
import '../models/statistics.dart';

class DashboardRemoteDatasource {
  final Dio _dio;

  DashboardRemoteDatasource(this._dio);

  /// Get dashboard overview (current month)
  Future<DashboardOverview> getDashboardOverview() async {
    try {
      final response = await _dio.get(ApiConfig.dashboard);

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return DashboardOverview.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch dashboard',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Get statistics for custom date range
  Future<Statistics> getStatistics({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await _dio.get(
        ApiConfig.dashboardStatistics,
        queryParameters: {'startDate': startDate, 'endDate': endDate},
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Statistics.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch statistics',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Get this month's statistics
  Future<Statistics> getThisMonthStatistics() async {
    try {
      final response = await _dio.get(
        '${ApiConfig.dashboardStatistics}/this-month',
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Statistics.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch statistics',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Get last month's statistics
  Future<Statistics> getLastMonthStatistics() async {
    try {
      final response = await _dio.get(
        '${ApiConfig.dashboardStatistics}/last-month',
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Statistics.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch statistics',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Get this year's statistics
  Future<Statistics> getThisYearStatistics() async {
    try {
      final response = await _dio.get(
        '${ApiConfig.dashboardStatistics}/this-year',
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Statistics.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch statistics',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }
}
