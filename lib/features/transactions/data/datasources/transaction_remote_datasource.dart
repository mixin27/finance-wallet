import 'package:dio/dio.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/page.dart';
import '../models/category.dart';
import '../models/create_transaction_request.dart';
import '../models/transaction.dart';
import '../models/transaction_filter.dart';
import '../models/transfer_request.dart';

class TransactionRemoteDatasource {
  final Dio _dio;

  TransactionRemoteDatasource(this._dio);

  /// Get paginated list of transactions with filters
  Future<Page<Transaction>> getTransactions(TransactionFilter filter) async {
    try {
      final response = await _dio.get(
        ApiConfig.transactions,
        queryParameters: filter.toQueryParameters(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Page<Transaction>.fromJson(
          apiResponse.data!,
          (json) => Transaction.fromJson(json),
        );
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch transactions',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Get transaction by ID
  Future<Transaction> getTransactionById(String id) async {
    try {
      final response = await _dio.get('${ApiConfig.transactions}/$id');

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Transaction.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch transaction',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Create income or expense transaction
  Future<Transaction> createTransaction(
    CreateTransactionRequest request,
  ) async {
    try {
      final response = await _dio.post(
        ApiConfig.transactions,
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Transaction.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to create transaction',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Transfer money between accounts
  Future<Transaction> transfer(TransferRequest request) async {
    try {
      final response = await _dio.post(
        ApiConfig.transfer,
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Transaction.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to transfer',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Update transaction
  Future<Transaction> updateTransaction(
    String id,
    CreateTransactionRequest request,
  ) async {
    try {
      final response = await _dio.put(
        '${ApiConfig.transactions}/$id',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        return Transaction.fromJson(apiResponse.data!);
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to update transaction',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Delete transaction
  Future<void> deleteTransaction(String id) async {
    try {
      await _dio.delete('${ApiConfig.transactions}/$id');
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to delete transaction',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }

  /// Get all categories
  Future<List<Category>> getCategories({String? type}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (type != null) {
        queryParams['type'] = type;
      }

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
            .map((json) => Category.fromJson(json as Map<String, dynamic>))
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
}
