import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/dashboard_overview.dart';
import '../../data/models/statistics.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardOverview>> getDashboardOverview({
    bool forceRefresh,
  });

  Future<Either<Failure, Statistics>> getStatistics({
    required String startDate,
    required String endDate,
    bool forceRefresh,
  });

  Future<Either<Failure, Statistics>> getThisMonthStatistics({
    bool forceRefresh,
  });
  Future<Either<Failure, Statistics>> getLastMonthStatistics({
    bool forceRefresh,
  });
  Future<Either<Failure, Statistics>> getThisYearStatistics({
    bool forceRefresh,
  });
  Future<Either<Failure, void>> changeDefaultCurrency(String currencyId);
}
