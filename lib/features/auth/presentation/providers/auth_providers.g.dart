// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authLocalDatasource)
const authLocalDatasourceProvider = AuthLocalDatasourceProvider._();

final class AuthLocalDatasourceProvider
    extends
        $FunctionalProvider<
          AuthLocalDatasource,
          AuthLocalDatasource,
          AuthLocalDatasource
        >
    with $Provider<AuthLocalDatasource> {
  const AuthLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthLocalDatasource create(Ref ref) {
    return authLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthLocalDatasource>(value),
    );
  }
}

String _$authLocalDatasourceHash() =>
    r'413daba300bf6ace55c27223f07ff684f7a982d5';

@ProviderFor(financeAuthRepository)
const financeAuthRepositoryProvider = FinanceAuthRepositoryProvider._();

final class FinanceAuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  const FinanceAuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'financeAuthRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$financeAuthRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return financeAuthRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$financeAuthRepositoryHash() =>
    r'7d79a61b5a3c96fa4cf3e3540e089c9d2052caa0';

@ProviderFor(authService)
const authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends
        $FunctionalProvider<
          FinanceAuthService,
          FinanceAuthService,
          FinanceAuthService
        >
    with $Provider<FinanceAuthService> {
  const AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<FinanceAuthService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FinanceAuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FinanceAuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FinanceAuthService>(value),
    );
  }
}

String _$authServiceHash() => r'0f993f34e007849f8eea833ae1d4138867cfdfb4';
