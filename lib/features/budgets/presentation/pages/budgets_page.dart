import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../data/models/budget.dart';
import '../providers/budget_providers.dart';
import '../viewmodels/budget_viewmodel.dart';

class BudgetsPage extends ConsumerStatefulWidget {
  const BudgetsPage({super.key});

  @override
  ConsumerState<BudgetsPage> createState() => _BudgetsPageState();
}

class _BudgetsPageState extends ConsumerState<BudgetsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(budgetViewModelProvider.notifier)
          .loadActiveBudgetsWithProgress();
    });
  }

  Future<void> _onRefresh() async {
    await ref.read(budgetViewModelProvider.notifier).refreshBudgets();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(budgetViewModelProvider);
    final budgets = ref.watch(budgetProgressProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Budgets')),
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: state.isLoading && budgets.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : budgets.isEmpty
            ? _buildEmptyState()
            : _buildBudgetsList(budgets),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/add-budget'),
        icon: const Icon(Icons.add),
        label: const Text('New Budget'),
        backgroundColor: AppColors.primary,
      ).animate().scale(delay: 300.ms, curve: Curves.elasticOut),
    );
  }

  Widget _buildBudgetsList(List<BudgetProgress> budgets) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.space16),
      itemCount: budgets.length,
      itemBuilder: (context, index) {
        final budget = budgets[index];
        final color = _getBudgetColor(budget.percentageUsed);

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            budget.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          if (budget.categoryName != null)
                            Text(
                              budget.categoryName!,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.grey500),
                            ),
                        ],
                      ),
                    ),
                    if (budget.isOverBudget)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Over Budget',
                          style: TextStyle(
                            color: AppColors.error,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else if (budget.isNearLimit)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Near Limit',
                          style: TextStyle(
                            color: AppColors.warning,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      CurrencyFormatter.format(
                        budget.spent,
                        symbol: budget.currencySymbol,
                      ),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(
                        budget.amount,
                        symbol: budget.currencySymbol,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (budget.percentageUsed / 100).clamp(0.0, 1.0),
                  backgroundColor: AppColors.grey200,
                  valueColor: AlwaysStoppedAnimation(color),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${budget.percentageUsed.toStringAsFixed(1)}% used',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.grey600),
                    ),
                    Text(
                      '${budget.remaining >= 0 ? 'Remaining' : 'Over'}: ${CurrencyFormatter.format(budget.remaining.abs(), symbol: budget.currencySymbol)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: budget.remaining >= 0
                            ? AppColors.grey600
                            : AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ).animate().fadeIn(delay: (100 + index * 50).ms).slideX(begin: 0.2, end: 0);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_balance_wallet_outlined,
              size: 100,
              color: AppColors.grey300,
            ).animate().scale(delay: 100.ms, curve: Curves.elasticOut),
            const SizedBox(height: 24),
            Text(
              'No Budgets Yet',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: AppColors.grey600),
            ),
            const SizedBox(height: 8),
            Text(
              'Create budgets to track your spending',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey400),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.push('/add-budget'),
              icon: const Icon(Icons.add),
              label: const Text('Create Budget'),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBudgetColor(double percentage) {
    if (percentage >= 100) return AppColors.error;
    if (percentage >= 80) return AppColors.warning;
    return AppColors.success;
  }
}
