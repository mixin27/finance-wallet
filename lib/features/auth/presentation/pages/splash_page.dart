import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Wait for splash animation
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    context.go('/dashboard');

    // final repository = ref.read(authRepositoryProvider);
    // final isLoggedIn = await repository.isLoggedIn();

    // if (!mounted) return;

    // if (isLoggedIn) {
    //   // Try to get current user
    //   final result = await repository.getCurrentUser();
    //   result.fold(
    //     (failure) {
    //       // Token might be expired, go to login
    //       context.go('/login');
    //     },
    //     (user) {
    //       // Set user and navigate to dashboard
    //       ref.read(currentUserProvider.notifier).state = user;
    //       ref.read(authStateProvider.notifier).state = true;
    //       context.go('/dashboard');
    //     },
    //   );
    // } else {
    //   context.go('/login');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_rounded,
                    size: 64,
                    color: AppColors.primary,
                  ),
                )
                .animate()
                .scale(duration: 600.ms, curve: Curves.elasticOut)
                .shimmer(delay: 600.ms, duration: 1000.ms),

            const SizedBox(height: 32),

            // App Name
            Text(
                  'Finance Wallet',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
                .animate()
                .fadeIn(delay: 300.ms, duration: 600.ms)
                .slideY(begin: 0.3, end: 0),

            const SizedBox(height: 8),

            Text(
                  'Manage your finances with ease',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                )
                .animate()
                .fadeIn(delay: 500.ms, duration: 600.ms)
                .slideY(begin: 0.3, end: 0),

            const SizedBox(height: 48),

            // Loading Indicator
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ).animate().fadeIn(delay: 700.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
