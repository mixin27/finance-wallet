import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/user_preferences/presentation/viewmodels/user_preference_viewmodel.dart';
import '../../../core/providers/biometric_providers.dart';
import '../../theme/app_colors.dart';

class BiometricGuard extends ConsumerStatefulWidget {
  final Widget child;

  const BiometricGuard({super.key, required this.child});

  @override
  ConsumerState<BiometricGuard> createState() => _BiometricGuardState();
}

class _BiometricGuardState extends ConsumerState<BiometricGuard>
    with WidgetsBindingObserver {
  bool _isLocked = false;
  bool _isAuthenticating = false;
  bool _hasCheckedInitial = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Ensure preferences are loaded on startup for the biometric check
    Future.microtask(() {
      ref.read(userPreferenceViewModelProvider.notifier).loadUserPreferences();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Trigger authentication only if the app is already locked and not already authenticating
      if (_isLocked && !_isAuthenticating) {
        _authenticate();
      }
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // Lock the app as soon as it goes to background
      final prefs = ref.read(userPreferenceViewModelProvider).userPreference;
      if (prefs?.enableBiometric ?? false) {
        if (!_isLocked) {
          setState(() => _isLocked = true);
        }
      }
    }
  }

  Future<void> _authenticate() async {
    if (_isAuthenticating || !_isLocked) return;

    try {
      setState(() => _isAuthenticating = true);

      // Add a small delay to allow system UI to settle, especially after cancellation or app resume
      await Future.delayed(const Duration(milliseconds: 200));

      final authenticated = await ref
          .read(biometricServiceProvider)
          .authenticate(
            localizedReason: 'Please authenticate to access Finance Wallet',
          );

      if (authenticated) {
        setState(() => _isLocked = false);
      }
    } catch (e) {
      debugPrint('Biometric authentication error: $e');
    } finally {
      if (mounted) {
        setState(() => _isAuthenticating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen for the initial preferences load to lock the app if needed
    ref.listen(userPreferenceViewModelProvider, (previous, next) {
      if (!_hasCheckedInitial && next.userPreference != null) {
        setState(() {
          _hasCheckedInitial = true;
          if (next.userPreference!.enableBiometric) {
            _isLocked = true;
            _authenticate();
          }
        });
      }
    });

    if (!_isLocked) return widget.child;

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 80, color: AppColors.primary),
            const SizedBox(height: 24),
            Text(
              'Finance Wallet Locked',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const Text(
              'Please authenticate to proceed',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: _authenticate,
              icon: const Icon(Icons.fingerprint),
              label: const Text('Unlock with Biometrics'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
