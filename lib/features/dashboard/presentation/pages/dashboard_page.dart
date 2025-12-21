import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';
import '../../../transactions/presentation/viewmodels/transaction_list_viewmodel.dart';
import '../providers/dashboard_providers.dart';
import '../viewmodels/dashboard_viewmodel.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // Load dashboard data on page load
    Future.microtask(() {
      ref.read(dashboardViewModelProvider.notifier).loadDashboard();
      // Load recent transactions for the list
      ref.read(transactionListViewModelProvider.notifier).loadTransactions();
    });
  }

  Future<void> _onRefresh() async {
    await ref.read(dashboardViewModelProvider.notifier).refreshDashboard();
    await ref
        .read(transactionListViewModelProvider.notifier)
        .refreshTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardViewModelProvider);
    final overview = ref.watch(dashboardOverviewProvider);
    final transactions = ref.watch(transactionsProvider).take(5).toList();

    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              expandedHeight: 120,
              floating: false,
              pinned: true,
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Dashboard'),
                titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.bar_chart),
                  onPressed: () {
                    context.push('/analytics');
                  },
                ),
              ],
            ),

            // Content
            if (state.isLoading && overview == null)
              SliverPadding(
                padding: const EdgeInsets.all(AppDimensions.space16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildShimmerCard(height: 200),
                    const SizedBox(height: 16),
                    _buildShimmerCard(height: 120),
                    const SizedBox(height: 16),
                    _buildShimmerCard(height: 300),
                  ]),
                ),
              )
            else if (overview != null)
              SliverPadding(
                padding: const EdgeInsets.all(AppDimensions.space16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Balance Card
                    _buildBalanceCard(context, overview)
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppDimensions.space24),

                    // Quick Actions
                    _buildQuickActions(context)
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppDimensions.space24),

                    // Spending Breakdown
                    if (overview.categoryBreakdown.isNotEmpty) ...[
                      _buildSpendingBreakdown(context, overview)
                          .animate()
                          .fadeIn(delay: 300.ms, duration: 600.ms)
                          .slideY(begin: 0.2, end: 0),
                      const SizedBox(height: AppDimensions.space24),
                    ],

                    // Recent Transactions Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            context.push('/transactions');
                          },
                          child: const Text('See All'),
                        ),
                      ],
                    ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

                    const SizedBox(height: AppDimensions.space16),

                    // Recent Transactions List
                    transactions.isEmpty
                        ? _buildEmptyTransactions(context)
                        : _buildRecentTransactionsList(context, transactions),
                  ]),
                ),
              )
            else
              SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.space24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: AppColors.grey400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.errorMessage ?? 'Failed to load dashboard',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(dashboardViewModelProvider.notifier)
                                .loadDashboard();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton.extended(
                heroTag: 'fab-dashboard',
                onPressed: () {
                  context.push('/add-transaction');
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Transaction'),
                backgroundColor: AppColors.primary,
              )
              .animate()
              .scale(delay: 500.ms, duration: 400.ms, curve: Curves.elasticOut)
              .shimmer(delay: 900.ms, duration: 1000.ms),
    );
  }

  Widget _buildBalanceCard(BuildContext context, overview) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.space24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  overview.currentMonth,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(
            CurrencyFormatter.format(overview.totalBalance),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Savings: ${CurrencyFormatter.format(overview.savings)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppDimensions.space24),
          Row(
            children: [
              Expanded(
                child: _buildBalanceItem(
                  context,
                  'Income',
                  CurrencyFormatter.format(overview.monthIncome),
                  Icons.arrow_downward,
                  AppColors.success,
                  overview.incomeChange,
                ),
              ),
              const SizedBox(width: AppDimensions.space16),
              Expanded(
                child: _buildBalanceItem(
                  context,
                  'Expense',
                  CurrencyFormatter.format(overview.monthExpenses),
                  Icons.arrow_upward,
                  AppColors.error,
                  overview.expenseChange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem(
    BuildContext context,
    String label,
    String amount,
    IconData icon,
    Color color,
    double change,
  ) {
    final isPositive = change >= 0;
    final changeColor = isPositive ? AppColors.success : AppColors.error;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.space12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                size: 12,
                color: changeColor,
              ),
              const SizedBox(width: 2),
              Text(
                '${change.abs().toStringAsFixed(1)}%',
                style: TextStyle(
                  color: changeColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildQuickActionButton(
            context,
            'Add Income',
            Icons.add_circle_outline,
            AppColors.success,
            () {
              context.push('/add-transaction');
            },
          ),
        ),
        const SizedBox(width: AppDimensions.space12),
        Expanded(
          child: _buildQuickActionButton(
            context,
            'Add Expense',
            Icons.remove_circle_outline,
            AppColors.error,
            () {
              context.push('/add-transaction');
            },
          ),
        ),
        const SizedBox(width: AppDimensions.space12),
        Expanded(
          child: _buildQuickActionButton(
            context,
            'Transfer',
            Icons.swap_horiz,
            AppColors.info,
            () {
              context.push('/transfer');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.space16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          border: Border.all(color: AppColors.grey200),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimensions.space8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: AppDimensions.space8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpendingBreakdown(BuildContext context, overview) {
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
            const SizedBox(height: AppDimensions.space16),
            ...overview.categoryBreakdown.take(5).map((category) {
              final percentage =
                  (category.amount / overview.monthExpenses * 100);
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
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
                            Text(
                              category.categoryName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Text(
                          CurrencyFormatter.format(category.amount),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: percentage / 100,
                      backgroundColor: AppColors.grey200,
                      valueColor: AlwaysStoppedAnimation(
                        _parseColor(category.color),
                      ),
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

  Widget _buildRecentTransactionsList(BuildContext context, transactions) {
    return Column(
      children: transactions.map<Widget>((transaction) {
        final isIncome = transaction.type == 'INCOME';
        final isExpense = transaction.type == 'EXPENSE';
        final color = isIncome
            ? AppColors.success
            : isExpense
            ? AppColors.error
            : AppColors.info;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isIncome
                    ? Icons.arrow_downward
                    : isExpense
                    ? Icons.arrow_upward
                    : Icons.swap_horiz,
                color: color,
                size: 20,
              ),
            ),
            title: Text(
              transaction.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              transaction.account.name,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.grey500),
            ),
            trailing: Text(
              '${isExpense
                  ? '-'
                  : isIncome
                  ? '+'
                  : ''}${CurrencyFormatter.format(transaction.amount, symbol: transaction.currency.symbol)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            onTap: () {
              ref.read(selectedTransactionProvider.notifier).state =
                  transaction;
              context.push('/transaction-detail/${transaction.id}');
            },
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 500.ms, duration: 600.ms).slideY(begin: 0.2, end: 0);
  }

  Widget _buildEmptyTransactions(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          children: [
            const Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: AppColors.grey300,
            ),
            const SizedBox(height: AppDimensions.space16),
            Text(
              'No transactions yet',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.grey600),
            ),
            const SizedBox(height: AppDimensions.space8),
            Text(
              'Start adding your income and expenses',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.grey400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 500.ms, duration: 600.ms);
  }

  Widget _buildShimmerCard({required double height}) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey200,
      highlightColor: AppColors.grey100,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
      ),
    );
  }

  Color _parseColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return AppColors.primary;
    }

    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppColors.primary;
    }
  }
}
