// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardOverview _$DashboardOverviewFromJson(Map<String, dynamic> json) =>
    _DashboardOverview(
      totalBalance: (json['totalBalance'] as num).toDouble(),
      monthIncome: (json['monthIncome'] as num).toDouble(),
      monthExpenses: (json['monthExpenses'] as num).toDouble(),
      savings: (json['savings'] as num).toDouble(),
      incomeChange: (json['incomeChange'] as num).toDouble(),
      expenseChange: (json['expenseChange'] as num).toDouble(),
      categoryBreakdown: (json['categoryBreakdown'] as List<dynamic>)
          .map((e) => CategoryBreakdown.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentTransactionsCount: (json['recentTransactionsCount'] as num).toInt(),
      activeBudgetsCount: (json['activeBudgetsCount'] as num).toInt(),
      currentMonth: json['currentMonth'] as String,
    );

Map<String, dynamic> _$DashboardOverviewToJson(_DashboardOverview instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
      'monthIncome': instance.monthIncome,
      'monthExpenses': instance.monthExpenses,
      'savings': instance.savings,
      'incomeChange': instance.incomeChange,
      'expenseChange': instance.expenseChange,
      'categoryBreakdown': instance.categoryBreakdown,
      'recentTransactionsCount': instance.recentTransactionsCount,
      'activeBudgetsCount': instance.activeBudgetsCount,
      'currentMonth': instance.currentMonth,
    };

_CategoryBreakdown _$CategoryBreakdownFromJson(Map<String, dynamic> json) =>
    _CategoryBreakdown(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      amount: (json['amount'] as num).toDouble(),
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CategoryBreakdownToJson(_CategoryBreakdown instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'amount': instance.amount,
      'color': instance.color,
      'icon': instance.icon,
    };
