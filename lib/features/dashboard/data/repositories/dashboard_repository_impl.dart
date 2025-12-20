import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, DashboardOverview>> getDashboardOverview() async {
    try {
      final overview = await _remoteDatasource.getDashboardOverview();
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
  }) async {
    try {
      final statistics = await _remoteDatasource.getStatistics(
        startDate: startDate,
        endDate: endDate,
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
  Future<Either<Failure, Statistics>> getThisMonthStatistics() async {
    try {
      final statistics = await _remoteDatasource.getThisMonthStatistics();
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
  Future<Either<Failure, Statistics>> getLastMonthStatistics() async {
    try {
      final statistics = await _remoteDatasource.getLastMonthStatistics();
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
  Future<Either<Failure, Statistics>> getThisYearStatistics() async {
    try {
      final statistics = await _remoteDatasource.getThisYearStatistics();
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
