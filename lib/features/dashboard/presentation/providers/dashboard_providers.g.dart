// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardRemoteDataSource)
const dashboardRemoteDataSourceProvider = DashboardRemoteDataSourceProvider._();

final class DashboardRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          DashboardRemoteDatasource,
          DashboardRemoteDatasource,
          DashboardRemoteDatasource
        >
    with $Provider<DashboardRemoteDatasource> {
  const DashboardRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<DashboardRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardRemoteDatasource create(Ref ref) {
    return dashboardRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardRemoteDatasource>(value),
    );
  }
}

String _$dashboardRemoteDataSourceHash() =>
    r'affb1bb38f543dc05b998af90b4cd2e529a0670a';

@ProviderFor(dashboardRepository)
const dashboardRepositoryProvider = DashboardRepositoryProvider._();

final class DashboardRepositoryProvider
    extends
        $FunctionalProvider<
          DashboardRepository,
          DashboardRepository,
          DashboardRepository
        >
    with $Provider<DashboardRepository> {
  const DashboardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<DashboardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardRepository create(Ref ref) {
    return dashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardRepository>(value),
    );
  }
}

String _$dashboardRepositoryHash() =>
    r'8d70de5b55e7d51f4a78de53719ca7c9a7757638';
