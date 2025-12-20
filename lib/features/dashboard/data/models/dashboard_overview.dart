import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_overview.freezed.dart';
part 'dashboard_overview.g.dart';

@freezed
abstract class DashboardOverview with _$DashboardOverview {
  const factory DashboardOverview({
    required double totalBalance,
    required double monthIncome,
    required double monthExpenses,
    required double savings,
    required double incomeChange,
    required double expenseChange,
    required List<CategoryBreakdown> categoryBreakdown,
    required int recentTransactionsCount,
    required int activeBudgetsCount,
    required String currentMonth,
  }) = _DashboardOverview;

  factory DashboardOverview.fromJson(Map<String, dynamic> json) =>
      _$DashboardOverviewFromJson(json);
}

@freezed
abstract class CategoryBreakdown with _$CategoryBreakdown {
  const factory CategoryBreakdown({
    required String categoryId,
    required String categoryName,
    required double amount,
    String? color,
    String? icon,
  }) = _CategoryBreakdown;

  factory CategoryBreakdown.fromJson(Map<String, dynamic> json) =>
      _$CategoryBreakdownFromJson(json);
}
