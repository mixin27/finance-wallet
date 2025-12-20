import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../dashboard/data/models/dashboard_overview.dart';
import '../../../dashboard/data/models/statistics.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../dashboard/presentation/viewmodels/dashboard_viewmodel.dart';

class AnalyticsPage extends ConsumerStatefulWidget {
  const AnalyticsPage({super.key});

  @override
  ConsumerState<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends ConsumerState<AnalyticsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(dashboardViewModelProvider.notifier).loadDashboard();
      ref.read(dashboardViewModelProvider.notifier).loadThisMonthStatistics();
    });
  }

  @override
  Widget build(BuildContext context) {
    final overview = ref.watch(dashboardOverviewProvider);
    final statistics = ref.watch(statisticsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () {
              // todo(mixin27): Date range selector
            },
          ),
        ],
      ),
      body: overview == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await ref
                    .read(dashboardViewModelProvider.notifier)
                    .refreshDashboard();
              },
              child: ListView(
                padding: const EdgeInsets.all(AppDimensions.space16),
                children: [
                  // Income vs Expense Card
                  _buildIncomeExpenseCard(
                    overview,
                  ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 16),

                  // Category Spending Pie Chart
                  if (overview.categoryBreakdown.isNotEmpty)
                    _buildCategoryPieChart(overview)
                        .animate()
                        .fadeIn(delay: 200.ms)
                        .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 16),

                  // Spending Trend (if statistics available)
                  if (statistics != null && statistics.dailyTrends.isNotEmpty)
                    _buildSpendingTrendChart(statistics)
                        .animate()
                        .fadeIn(delay: 300.ms)
                        .slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 16),

                  // Top Categories List
                  if (overview.categoryBreakdown.isNotEmpty)
                    _buildTopCategoriesList(overview)
                        .animate()
                        .fadeIn(delay: 400.ms)
                        .slideY(begin: 0.2, end: 0),
                ],
              ),
            ),
    );
  }

  Widget _buildIncomeExpenseCard(DashboardOverview overview) {
    final total = overview.monthIncome + overview.monthExpenses;
    final incomePercentage = total > 0
        ? (overview.monthIncome / total * 100)
        : 0;
    final expensePercentage = total > 0
        ? (overview.monthExpenses / total * 100)
        : 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Income vs Expense',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: AppColors.success,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Income',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        CurrencyFormatter.format(overview.monthIncome),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${incomePercentage.toStringAsFixed(1)}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: AppColors.error,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Expense',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        CurrencyFormatter.format(overview.monthExpenses),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.error,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${expensePercentage.toStringAsFixed(1)}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Savings', style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  CurrencyFormatter.format(overview.savings),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: overview.savings >= 0
                        ? AppColors.success
                        : AppColors.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryPieChart(DashboardOverview overview) {
    final categories = overview.categoryBreakdown.take(5).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending by Category',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: categories.asMap().entries.map((entry) {
                    final index = entry.key;
                    final category = entry.value;
                    final percentage =
                        (category.amount / overview.monthExpenses * 100);
                    final color = _parseColor(category.color, index);

                    return PieChartSectionData(
                      value: category.amount,
                      title: '${percentage.toStringAsFixed(0)}%',
                      color: color,
                      radius: 80,
                      titleStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...categories.map((category) {
              final color = _parseColor(
                category.color,
                categories.indexOf(category),
              );
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(category.categoryName)),
                    Text(
                      CurrencyFormatter.format(category.amount),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSpendingTrendChart(Statistics statistics) {
    final trends = statistics.dailyTrends.take(30).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Spending Trend',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    // Expenses line
                    LineChartBarData(
                      spots: trends.asMap().entries.map((entry) {
                        return FlSpot(
                          entry.key.toDouble(),
                          entry.value.expenses,
                        );
                      }).toList(),
                      isCurved: true,
                      color: AppColors.error,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.error.withValues(alpha: 0.1),
                      ),
                    ),
                    // Income line
                    LineChartBarData(
                      spots: trends.asMap().entries.map((entry) {
                        return FlSpot(entry.key.toDouble(), entry.value.income);
                      }).toList(),
                      isCurved: true,
                      color: AppColors.success,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.success.withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem('Income', AppColors.success),
                const SizedBox(width: 24),
                _buildLegendItem('Expense', AppColors.error),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 3,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildTopCategoriesList(DashboardOverview overview) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Spending Categories',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...overview.categoryBreakdown.take(5).map((category) {
              final percentage =
                  (category.amount / overview.monthExpenses * 100);
              final color = _parseColor(
                category.color,
                overview.categoryBreakdown.indexOf(category),
              );

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (category.icon != null)
                              Text(
                                category.icon!,
                                style: const TextStyle(fontSize: 20),
                              ),
                            if (category.icon != null) const SizedBox(width: 8),
                            Text(category.categoryName),
                          ],
                        ),
                        Text(
                          CurrencyFormatter.format(category.amount),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: AppColors.grey200,
                      valueColor: AlwaysStoppedAnimation(color),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Color _parseColor(String? colorString, int fallbackIndex) {
    if (colorString != null && colorString.isNotEmpty) {
      try {
        return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
      } catch (e) {
        // Fallback
      }
    }

    // Fallback colors
    final colors = [
      AppColors.primary,
      AppColors.success,
      AppColors.error,
      AppColors.warning,
      AppColors.info,
    ];
    return colors[fallbackIndex % colors.length];
  }
}
