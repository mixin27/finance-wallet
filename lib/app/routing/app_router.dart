import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/accounts/presentation/pages/account_detail_page.dart';
import '../../features/accounts/presentation/pages/accounts_page.dart';
import '../../features/accounts/presentation/pages/add_account_page.dart';
import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/auth/presentation/pages/change_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/budgets/presentation/pages/add_budget_page.dart';
import '../../features/budgets/presentation/pages/budget_detail_page.dart';
import '../../features/budgets/presentation/pages/budgets_page.dart';
import '../../features/categories/presentation/pages/add_category_page.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/goals/presentation/pages/add_goal_page.dart';
import '../../features/goals/presentation/pages/goal_detail_page.dart';
import '../../features/goals/presentation/pages/goals_page.dart';
import '../../features/profile/presentation/pages/edit_profile_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/user_preferences/presentation/pages/settings_page.dart';
import '../../features/transactions/presentation/pages/add_transaction_page.dart';
import '../../features/transactions/presentation/pages/transaction_detail_page.dart';
import '../../features/transactions/presentation/pages/transactions_page.dart';
import '../../features/transactions/presentation/pages/transfer_page.dart';
import '../presentation/pages/main_screen.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final publicRoutes = ["/splash", "/onboarding", "/terms"];

@riverpod
GoRouter goRouter(Ref ref) {
  final authService = ref.watch(authServiceProvider);

  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/auth/login',
    refreshListenable: GoRouterRefreshStream(authService.authStateStream),
    redirect: (context, state) {
      final isOnPublicRoute =
          publicRoutes.contains(state.matchedLocation) ||
          state.matchedLocation.startsWith('/auth');

      final isAuthenticated = authService.isAuthenticated;

      // If not authenticated and not on public route, redirect to login
      if (!isAuthenticated && !isOnPublicRoute) {
        return '/auth/login';
      }

      // If authenticated and on login page, redirect to home
      if (isAuthenticated && state.matchedLocation == '/auth/login') {
        return '/dashboard'; // Redirect to home or dashboard
      }

      return null;
    },
    routes: [
      // Splash Screen
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),

      // Auth Routes
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterPage(),
      ),

      // Main App with Bottom Navigation (Shell Route)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          // Dashboard Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dashboard',
                name: 'dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),

          // Accounts Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/accounts',
                builder: (context, state) => const AccountsPage(),
              ),
            ],
          ),

          // Transactions Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/transactions',
                builder: (context, state) => const TransactionsPage(),
              ),
            ],
          ),

          // Profile Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // Account Routes
      GoRoute(
        path: '/add-account',
        builder: (context, state) => const AddAccountPage(),
      ),

      GoRoute(
        path: '/account-detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return AccountDetailPage(accountId: id);
        },
      ),

      GoRoute(
        path: '/add-transaction',
        builder: (context, state) => const AddTransactionPage(),
      ),

      GoRoute(
        path: '/transfer',
        builder: (context, state) => const TransferPage(),
      ),

      // Transaction Detail Route
      GoRoute(
        path: '/transaction-detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return TransactionDetailPage(transactionId: id);
        },
      ),

      // Category Routes
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesPage(),
      ),
      GoRoute(
        path: '/add-category',
        builder: (context, state) {
          final type = state.uri.queryParameters['type'] ?? 'EXPENSE';
          return AddCategoryPage(type: type);
        },
      ),

      // Goal Routes
      GoRoute(path: '/goals', builder: (context, state) => const GoalsPage()),
      GoRoute(
        path: '/add-goal',
        builder: (context, state) => const AddGoalPage(),
      ),
      GoRoute(
        path: '/goal-detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return GoalDetailPage(goalId: id);
        },
      ),

      // Budgets
      GoRoute(
        path: '/budgets',
        builder: (context, state) => const BudgetsPage(),
      ),
      GoRoute(
        path: '/add-budget',
        builder: (context, state) => const AddBudgetPage(),
      ),
      GoRoute(
        path: '/budget-detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return BudgetDetailPage(budgetId: id);
        },
      ),

      // Analytics Route
      GoRoute(
        path: '/analytics',
        builder: (context, state) => const AnalyticsPage(),
      ),

      // Profile & Settings
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/change-password',
        builder: (context, state) => const ChangePasswordPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Helper class to refresh GoRouter when auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((state) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
