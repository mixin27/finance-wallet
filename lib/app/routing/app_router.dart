import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/accounts/presentation/pages/account_detail_page.dart';
import '../../features/accounts/presentation/pages/accounts_page.dart';
import '../../features/accounts/presentation/pages/add_account_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/categories/presentation/pages/add_category_page.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/goals/presentation/pages/add_goal_page.dart';
import '../../features/goals/presentation/pages/goal_detail_page.dart';
import '../../features/goals/presentation/pages/goals_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/transactions/presentation/pages/add_transaction_page.dart';
import '../../features/transactions/presentation/pages/transaction_detail_page.dart';
import '../../features/transactions/presentation/pages/transactions_page.dart';
import '../../features/transactions/presentation/pages/transfer_page.dart';
import '../presentation/pages/main_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      // Splash Screen
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),

      // Auth Routes
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
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
                path: '/main',
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
    ],
  );
}
