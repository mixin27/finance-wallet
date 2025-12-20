import 'package:dio/dio.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../models/currency.dart';

class CurrencyRemoteDatasource {
  final Dio _dio;

  CurrencyRemoteDatasource(this._dio);

  Future<List<Currency>> getCurrencies() async {
    try {
      final response = await _dio.get(ApiConfig.currencies);

      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => json as List<dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        final currencies = apiResponse.data!
            .map((json) => Currency.fromJson(json as Map<String, dynamic>))
            .toList();

        return currencies;
      } else {
        throw ServerException(apiResponse.message);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          e.response!.data['message'] ?? 'Failed to fetch currencies',
          statusCode: e.response!.statusCode,
        );
      } else {
        throw NetworkException('No internet connection');
      }
    }
  }
}
