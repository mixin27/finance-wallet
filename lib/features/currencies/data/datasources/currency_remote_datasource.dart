import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_response.dart';
import '../models/currency.dart';

class CurrencyRemoteDatasource {
  final Dio _dio;

  CurrencyRemoteDatasource(this._dio);

  Future<List<Currency>> getCurrencies() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final cached = prefs.getString('_currencies');
      if (cached != null) {
        final List<dynamic> jsonList = jsonDecode(cached);
        return jsonList
            .map((json) => Currency.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      final response = await _dio.get(ApiConfig.currencies);

      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response.data,
        (json) => json as List<dynamic>,
      );

      if (apiResponse.success && apiResponse.data != null) {
        final currencies = apiResponse.data!
            .map((json) => Currency.fromJson(json as Map<String, dynamic>))
            .toList();

        await prefs.setString(
          '_currencies',
          jsonEncode(currencies.map((e) => e.toJson()).toList()),
        );

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
