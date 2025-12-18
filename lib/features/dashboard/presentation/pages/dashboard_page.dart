import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.primary,
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
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.all(AppDimensions.space16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Balance Card
                _buildBalanceCard(context)
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
                        // Navigate to transactions
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ).animate().fadeIn(delay: 300.ms, duration: 600.ms),

                const SizedBox(height: AppDimensions.space16),

                // Recent Transactions List
                _buildRecentTransactions(context)
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),
              ]),
            ),
          ),
        ],
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

  Widget _buildBalanceCard(BuildContext context) {
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
          Text(
            'Total Balance',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: AppDimensions.space8),
          Text(
            '\$12,345.67',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.space24),
          Row(
            children: [
              Expanded(
                child: _buildBalanceItem(
                  context,
                  'Income',
                  '\$8,234.50',
                  Icons.arrow_downward,
                  AppColors.success,
                ),
              ),
              const SizedBox(width: AppDimensions.space16),
              Expanded(
                child: _buildBalanceItem(
                  context,
                  'Expense',
                  '\$3,456.78',
                  Icons.arrow_upward,
                  AppColors.error,
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
  ) {
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
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
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
            () {},
          ),
        ),
        const SizedBox(width: AppDimensions.space12),
        Expanded(
          child: _buildQuickActionButton(
            context,
            'Add Expense',
            Icons.remove_circle_outline,
            AppColors.error,
            () {},
          ),
        ),
        const SizedBox(width: AppDimensions.space12),
        Expanded(
          child: _buildQuickActionButton(
            context,
            'Transfer',
            Icons.swap_horiz,
            AppColors.info,
            () {},
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

  Widget _buildRecentTransactions(BuildContext context) {
    // Placeholder for recent transactions
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
    );
  }
}
