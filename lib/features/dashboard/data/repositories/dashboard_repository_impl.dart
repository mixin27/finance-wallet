import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/dashboard_overview.dart';
import '../models/statistics.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDatasource _remoteDatasource;

  DashboardRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, DashboardOverview>> getDashboardOverview({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedDashboardOverviewKey = 'cached_dashboard_overview';

    try {
      final cachedData = prefs.getString(cachedDashboardOverviewKey);
      if (cachedData != null && !forceRefresh) {
        final Map<String, dynamic> decodedJson =
            jsonDecode(cachedData) as Map<String, dynamic>;
        final overview = DashboardOverview.fromJson(decodedJson);
        return Right(overview);
      }

      final overview = await _remoteDatasource.getDashboardOverview();
      await prefs.setString(
        cachedDashboardOverviewKey,
        jsonEncode(overview.toJson()),
      );

      return Right(overview);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getStatistics({
    required String startDate,
    required String endDate,
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedStatisticsKey = 'cached_statistics_${startDate}_$endDate';

    try {
      final cachedData = prefs.getString(cachedStatisticsKey);
      if (cachedData != null && !forceRefresh) {
        final Map<String, dynamic> decodedJson =
            jsonDecode(cachedData) as Map<String, dynamic>;
        final statistics = Statistics.fromJson(decodedJson);
        return Right(statistics);
      }

      final statistics = await _remoteDatasource.getStatistics(
        startDate: startDate,
        endDate: endDate,
      );
      await prefs.setString(
        cachedStatisticsKey,
        jsonEncode(statistics.toJson()),
      );

      return Right(statistics);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getThisMonthStatistics({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedThisMonthStatisticsKey = 'cached_this_month_statistics';

    try {
      final cachedData = prefs.getString(cachedThisMonthStatisticsKey);
      if (cachedData != null && !forceRefresh) {
        final Map<String, dynamic> decodedJson =
            jsonDecode(cachedData) as Map<String, dynamic>;
        final statistics = Statistics.fromJson(decodedJson);
        return Right(statistics);
      }

      final statistics = await _remoteDatasource.getThisMonthStatistics();
      await prefs.setString(
        cachedThisMonthStatisticsKey,
        jsonEncode(statistics.toJson()),
      );
      return Right(statistics);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getLastMonthStatistics({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedLastMonthStatisticsKey = 'cached_last_month_statistics';

    try {
      final cachedData = prefs.getString(cachedLastMonthStatisticsKey);
      if (cachedData != null && !forceRefresh) {
        final Map<String, dynamic> decodedJson =
            jsonDecode(cachedData) as Map<String, dynamic>;
        final statistics = Statistics.fromJson(decodedJson);
        return Right(statistics);
      }

      final statistics = await _remoteDatasource.getLastMonthStatistics();
      await prefs.setString(
        cachedLastMonthStatisticsKey,
        jsonEncode(statistics.toJson()),
      );
      return Right(statistics);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getThisYearStatistics({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedThisYearStatisticsKey = 'cached_this_year_statistics';

    try {
      final cachedData = prefs.getString(cachedThisYearStatisticsKey);
      if (cachedData != null && !forceRefresh) {
        final Map<String, dynamic> decodedJson =
            jsonDecode(cachedData) as Map<String, dynamic>;
        final statistics = Statistics.fromJson(decodedJson);
        return Right(statistics);
      }

      final statistics = await _remoteDatasource.getThisYearStatistics();
      await prefs.setString(
        cachedThisYearStatisticsKey,
        jsonEncode(statistics.toJson()),
      );
      return Right(statistics);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
