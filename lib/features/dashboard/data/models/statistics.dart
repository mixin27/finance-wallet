import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed
abstract class Statistics with _$Statistics {
  const factory Statistics({
    required String startDate,
    required String endDate,
    required double totalIncome,
    required double totalExpenses,
    required double netIncome,
    required double avgDailyIncome,
    required double avgDailyExpense,
    required List<CategorySummary> expensesByCategory,
    required List<CategorySummary> incomeByCategory,
    required List<DailyTrend> dailyTrends,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}

@freezed
abstract class CategorySummary with _$CategorySummary {
  const factory CategorySummary({
    required String categoryId,
    required String categoryName,
    required double amount,
    String? color,
    String? icon,
  }) = _CategorySummary;

  factory CategorySummary.fromJson(Map<String, dynamic> json) =>
      _$CategorySummaryFromJson(json);
}

@freezed
abstract class DailyTrend with _$DailyTrend {
  const factory DailyTrend({
    required String date,
    required double income,
    required double expenses,
    required double net,
  }) = _DailyTrend;

  factory DailyTrend.fromJson(Map<String, dynamic> json) =>
      _$DailyTrendFromJson(json);
}
