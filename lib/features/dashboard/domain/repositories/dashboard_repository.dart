import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/dashboard_overview.dart';
import '../../data/models/statistics.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardOverview>> getDashboardOverview();

  Future<Either<Failure, Statistics>> getStatistics({
    required String startDate,
    required String endDate,
  });

  Future<Either<Failure, Statistics>> getThisMonthStatistics();
  Future<Either<Failure, Statistics>> getLastMonthStatistics();
  Future<Either<Failure, Statistics>> getThisYearStatistics();
}
