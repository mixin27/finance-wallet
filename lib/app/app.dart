import 'package:flutter/material.dart';

import 'routing/app_router.dart';
import 'theme/app_theme.dart';

class FinanceWalletApp extends StatelessWidget {
  const FinanceWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finance Wallet',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
