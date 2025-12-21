// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileLocalDatasource)
const profileLocalDatasourceProvider = ProfileLocalDatasourceProvider._();

final class ProfileLocalDatasourceProvider
    extends
        $FunctionalProvider<
          UserLocalDatasource,
          UserLocalDatasource,
          UserLocalDatasource
        >
    with $Provider<UserLocalDatasource> {
  const ProfileLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLocalDatasource create(Ref ref) {
    return profileLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocalDatasource>(value),
    );
  }
}

String _$profileLocalDatasourceHash() =>
    r'45fad17e75ab6e73105b2a2eb207168680d72a08';

@ProviderFor(profileRemoteDatasource)
const profileRemoteDatasourceProvider = ProfileRemoteDatasourceProvider._();

final class ProfileRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          UserRemoteDatasource,
          UserRemoteDatasource,
          UserRemoteDatasource
        >
    with $Provider<UserRemoteDatasource> {
  const ProfileRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserRemoteDatasource create(Ref ref) {
    return profileRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRemoteDatasource>(value),
    );
  }
}

String _$profileRemoteDatasourceHash() =>
    r'46a70d3721d6ce9dd5ba277f162490e7bf253164';

@ProviderFor(profileRepository)
const profileRepositoryProvider = ProfileRepositoryProvider._();

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  const ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'a4b39800778dbbce09c9d3bb3b4b03f1c4e1b56c';
