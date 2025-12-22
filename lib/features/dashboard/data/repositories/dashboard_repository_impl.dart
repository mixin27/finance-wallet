import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_datasource.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/dashboard_overview.dart';
import '../models/statistics.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDatasource _remoteDatasource;
  final DashboardLocalDatasource _localDatasource;
  final NetworkInfo _networkInfo;

  DashboardRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, DashboardOverview>> getDashboardOverview({
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final cachedOverview = await _localDatasource
            .getCachedDashboardOverview();
        if (cachedOverview != null) {
          return Right(cachedOverview);
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedOverview = await _localDatasource
            .getCachedDashboardOverview();
        if (cachedOverview == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedOverview);
      }

      final overview = await _remoteDatasource.getDashboardOverview();
      await _localDatasource.cacheDashboardOverview(overview);
      return Right(overview);
    } on ServerException catch (e) {
      final cachedOverview = await _localDatasource
          .getCachedDashboardOverview();
      if (cachedOverview != null) {
        return Right(cachedOverview);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedOverview = await _localDatasource
          .getCachedDashboardOverview();
      if (cachedOverview != null) {
        return Right(cachedOverview);
      }
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
    final cacheKey = 'statistics_${startDate}_$endDate';

    try {
      if (!forceRefresh) {
        final isCacheStale = await _localDatasource.isCacheStale(cacheKey, 60);
        if (!isCacheStale) {
          final cachedStats = await _localDatasource.getCachedStatistics(
            cacheKey,
          );
          if (cachedStats != null) {
            return Right(cachedStats);
          }
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedStats = await _localDatasource.getCachedStatistics(
          cacheKey,
        );
        if (cachedStats == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedStats);
      }

      final statistics = await _remoteDatasource.getStatistics(
        startDate: startDate,
        endDate: endDate,
      );
      await _localDatasource.cacheStatistics(cacheKey, statistics);
      return Right(statistics);
    } on ServerException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getThisMonthStatistics({
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'statistics_this_month';
    try {
      if (!forceRefresh) {
        final isCacheStale = await _localDatasource.isCacheStale(cacheKey, 60);
        if (!isCacheStale) {
          final cachedStats = await _localDatasource.getCachedStatistics(
            cacheKey,
          );
          if (cachedStats != null) {
            return Right(cachedStats);
          }
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedStats = await _localDatasource.getCachedStatistics(
          cacheKey,
        );
        if (cachedStats == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedStats);
      }

      final statistics = await _remoteDatasource.getThisMonthStatistics();
      await _localDatasource.cacheStatistics(cacheKey, statistics);
      return Right(statistics);
    } on ServerException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getLastMonthStatistics({
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'statistics_last_month';
    try {
      if (!forceRefresh) {
        final isCacheStale = await _localDatasource.isCacheStale(cacheKey, 60);
        if (!isCacheStale) {
          final cachedStats = await _localDatasource.getCachedStatistics(
            cacheKey,
          );
          if (cachedStats != null) {
            return Right(cachedStats);
          }
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedStats = await _localDatasource.getCachedStatistics(
          cacheKey,
        );
        if (cachedStats == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedStats);
      }

      final statistics = await _remoteDatasource.getLastMonthStatistics();
      await _localDatasource.cacheStatistics(cacheKey, statistics);
      return Right(statistics);
    } on ServerException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statistics>> getThisYearStatistics({
    bool forceRefresh = false,
  }) async {
    final cacheKey = 'statistics_this_year';
    try {
      if (!forceRefresh) {
        final isCacheStale = await _localDatasource.isCacheStale(cacheKey, 60);
        if (!isCacheStale) {
          final cachedStats = await _localDatasource.getCachedStatistics(
            cacheKey,
          );
          if (cachedStats != null) {
            return Right(cachedStats);
          }
        }
      }

      final isConnected = await _networkInfo.isConnected;
      if (!isConnected) {
        final cachedStats = await _localDatasource.getCachedStatistics(
          cacheKey,
        );
        if (cachedStats == null) {
          return Left(Failure.network('No internet connection'));
        }
        return Right(cachedStats);
      }

      final statistics = await _remoteDatasource.getThisYearStatistics();
      await _localDatasource.cacheStatistics(cacheKey, statistics);
      return Right(statistics);
    } on ServerException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.server(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      final cachedStats = await _localDatasource.getCachedStatistics(cacheKey);
      if (cachedStats != null) {
        return Right(cachedStats);
      }
      return Left(Failure.network(e.message));
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changeDefaultCurrency(String currencyId) async {
    throw UnimplementedError();
  }
}
