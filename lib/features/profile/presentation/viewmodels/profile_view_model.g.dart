// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileViewModel)
const profileViewModelProvider = ProfileViewModelProvider._();

final class ProfileViewModelProvider
    extends $AsyncNotifierProvider<ProfileViewModel, User> {
  const ProfileViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileViewModelHash();

  @$internal
  @override
  ProfileViewModel create() => ProfileViewModel();
}

String _$profileViewModelHash() => r'0e42b07238288943ba6575be1a37f87e260bc9cf';

abstract class _$ProfileViewModel extends $AsyncNotifier<User> {
  FutureOr<User> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User>, User>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User>, User>,
              AsyncValue<User>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
