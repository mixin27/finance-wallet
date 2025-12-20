import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../models/create_goal_request.dart';
import '../models/goal.dart';
import '../models/update_goal_request.dart';
import '../models/update_progress_request.dart';

class GoalRemoteDatasource {
  final Dio _dio;

  GoalRemoteDatasource(this._dio);

  Future<List<Goal>> getGoals({
    bool activeOnly = false,
    bool force = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedGoalsKey = activeOnly ? 'cached_active_goals' : 'cached_goals';
    try {
      final cachedData = prefs.getString(cachedGoalsKey);
      if (cachedData != null && !force) {
        final List<dynamic> jsonData = jsonDecode(cachedData);
        final goals = jsonData
            .map((json) => Goal.fromJson(json as Map<String, dynamic>))
            .toList();
        return goals;
      }

      final response = await _dio.get(
        ApiConfig.goals,
        queryParameters: activeOnly ? {'activeOnly': true} : null,
      );

      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => json as List<dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        final goals = apiResponse.data!
            .map((json) => Goal.fromJson(json as Map<String, dynamic>))
            .toList();

        // Cache the fetched goals
        await prefs.setString(
          cachedGoalsKey,
          jsonEncode(goals.map((e) => e.toJson()).toList()),
        );

        return goals;
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch goals',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<Goal> getGoalById(String id) async {
    try {
      final response = await _dio.get('${ApiConfig.goals}/$id');

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Goal.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch goal',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<Goal> createGoal(CreateGoalRequest request) async {
    try {
      final response = await _dio.post(ApiConfig.goals, data: request.toJson());

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Goal.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to create goal',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<Goal> updateGoal(String id, UpdateGoalRequest request) async {
    try {
      final response = await _dio.put(
        '${ApiConfig.goals}/$id',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Goal.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to update goal',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<Goal> updateProgress(String id, UpdateProgressRequest request) async {
    try {
      final response = await _dio.patch(
        '${ApiConfig.goals}/$id/progress',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Goal.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to update progress',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<Goal> completeGoal(String id) async {
    try {
      final response = await _dio.patch('${ApiConfig.goals}/$id/complete');

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Goal.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to complete goal',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  Future<void> deleteGoal(String id) async {
    try {
      await _dio.delete('${ApiConfig.goals}/$id');
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to delete goal',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }
}
