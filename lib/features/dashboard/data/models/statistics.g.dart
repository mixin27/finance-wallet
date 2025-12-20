// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Statistics _$StatisticsFromJson(Map<String, dynamic> json) => _Statistics(
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
  totalIncome: (json['totalIncome'] as num).toDouble(),
  totalExpenses: (json['totalExpenses'] as num).toDouble(),
  netIncome: (json['netIncome'] as num).toDouble(),
  avgDailyIncome: (json['avgDailyIncome'] as num).toDouble(),
  avgDailyExpense: (json['avgDailyExpense'] as num).toDouble(),
  expensesByCategory: (json['expensesByCategory'] as List<dynamic>)
      .map((e) => CategorySummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  incomeByCategory: (json['incomeByCategory'] as List<dynamic>)
      .map((e) => CategorySummary.fromJson(e as Map<String, dynamic>))
      .toList(),
  dailyTrends: (json['dailyTrends'] as List<dynamic>)
      .map((e) => DailyTrend.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StatisticsToJson(_Statistics instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'totalIncome': instance.totalIncome,
      'totalExpenses': instance.totalExpenses,
      'netIncome': instance.netIncome,
      'avgDailyIncome': instance.avgDailyIncome,
      'avgDailyExpense': instance.avgDailyExpense,
      'expensesByCategory': instance.expensesByCategory,
      'incomeByCategory': instance.incomeByCategory,
      'dailyTrends': instance.dailyTrends,
    };

_CategorySummary _$CategorySummaryFromJson(Map<String, dynamic> json) =>
    _CategorySummary(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      amount: (json['amount'] as num).toDouble(),
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CategorySummaryToJson(_CategorySummary instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'amount': instance.amount,
      'color': instance.color,
      'icon': instance.icon,
    };

_DailyTrend _$DailyTrendFromJson(Map<String, dynamic> json) => _DailyTrend(
  date: json['date'] as String,
  income: (json['income'] as num).toDouble(),
  expenses: (json['expenses'] as num).toDouble(),
  net: (json['net'] as num).toDouble(),
);

Map<String, dynamic> _$DailyTrendToJson(_DailyTrend instance) =>
    <String, dynamic>{
      'date': instance.date,
      'income': instance.income,
      'expenses': instance.expenses,
      'net': instance.net,
    };
