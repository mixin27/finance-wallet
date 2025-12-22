import 'env.dart';

class ApiConfig {
  // Change this to your backend URL
  // static const String baseUrl = 'http://10.0.2.2:8080/api'; // Android emulator
  // static const String baseUrl = 'http://localhost:8080/api'; // iOS simulator
  // For Real Device (use your computer's IP)
  // static const String baseUrl = 'http://192.168.100.113:8080/api';
  static final String baseUrl = Env.apiUrl; // Production

  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000;

  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String currentUser = '/auth/me';
  static const String logout = '/auth/logout';
  static const String forgotPassword = '/auth/forgot-password';
  static const String changePassword = '/auth/change-password';

  static const String dashboard = '/dashboard';
  static const String dashboardStatistics = '/dashboard/statistics';

  static const String accounts = '/accounts';
  static const String accountTypes = '/accounts/types';
  static const String accountSummary = '/accounts/summary';

  static const String transactions = '/transactions';
  static const String transfer = '/transactions/transfer';

  static const String currencies = '/currencies';
  static const String categories = '/categories';
  static const String goals = '/goals';
  static const String budgets = '/budgets';

  static const String userPreferences = '/user/preferences';
  static const String userPreferencesReset = '/user/preferences/reset';
}
