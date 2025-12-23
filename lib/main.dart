import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/network/api_client.dart';
import 'features/auth/presentation/providers/auth_providers.dart';
import 'features/user_preferences/presentation/viewmodels/user_preference_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Initialize API Client
  ApiClient().init();

  // Create provider container
  final container = ProviderContainer();

  // Initialize auth service and load preferences
  final authService = container.read(authServiceProvider);
  await authService.initialize();

  // Load user preferences
  await container
      .read(userPreferenceViewModelProvider.notifier)
      .loadUserPreferences();

  runApp(
    UncontrolledProviderScope(container: container, child: FinanceWalletApp()),
  );
}
