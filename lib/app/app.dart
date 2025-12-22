import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/widgets/biometric_guard.dart';
import 'routing/app_router.dart';
import 'theme/app_theme.dart';

class FinanceWalletApp extends ConsumerWidget {
  const FinanceWalletApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finance Wallet',

      // Theming
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      // Routing
      routerConfig: router,

      // Builder for global overlays
      builder: (context, child) {
        return BiometricGuard(
          child: GestureDetector(
            onTap: () {
              // Dismiss keyboard when tapping outside
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: child!,
          ),
        );
      },
    );
  }
}
