import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../data/models/goal.dart';
import '../providers/goal_providers.dart';
import '../viewmodels/goal_viewmodel.dart';

class GoalsPage extends ConsumerStatefulWidget {
  const GoalsPage({super.key});

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  bool _showActiveOnly = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(goalViewModelProvider.notifier).loadGoals(activeOnly: true);
    });
  }

  Future<void> _onRefresh() async {
    await ref
        .read(goalViewModelProvider.notifier)
        .refreshGoals(activeOnly: _showActiveOnly);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(goalViewModelProvider);
    final goals = ref.watch(goalsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Goals'),
        actions: [
          IconButton(
            icon: Icon(
              _showActiveOnly ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            onPressed: () {
              setState(() {
                _showActiveOnly = !_showActiveOnly;
              });
              ref
                  .read(goalViewModelProvider.notifier)
                  .loadGoals(activeOnly: _showActiveOnly);
            },
            tooltip: 'Active Only',
          ),
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: state.isLoading && goals.isEmpty
            ? _buildLoadingState()
            : goals.isEmpty
            ? _buildEmptyState()
            : _buildGoalsList(goals),
      ),
      floatingActionButton:
          FloatingActionButton.extended(
            onPressed: () => context.push('/add-goal'),
            icon: const Icon(Icons.add),
            label: const Text('New Goal'),
            backgroundColor: AppColors.primary,
          ).animate().scale(
            delay: 300.ms,
            duration: 400.ms,
            curve: Curves.elasticOut,
          ),
    );
  }

  Widget _buildGoalsList(List<Goal> goals) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.space16),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return _buildGoalCard(goal, index);
      },
    );
  }

  Widget _buildGoalCard(Goal goal, int index) {
    final color = _parseColor(goal.color);
    final daysLeft = goal.targetDate.difference(DateTime.now()).inDays;

    return Card(
          margin: const EdgeInsets.only(bottom: AppDimensions.space16),
          child: InkWell(
            onTap: () {
              ref.read(selectedGoalProvider.notifier).state = goal;
              context.push('/goal-detail/${goal.id}');
            },
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (goal.icon != null)
                        Text(goal.icon!, style: const TextStyle(fontSize: 32)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              goal.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            if (goal.description != null)
                              Text(
                                goal.description!,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.5),
                                    ),
                              ),
                          ],
                        ),
                      ),
                      if (goal.isCompleted)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '✓ Complete',
                            style: TextStyle(
                              color: AppColors.success,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.space16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        CurrencyFormatter.format(
                          goal.currentAmount,
                          symbol: goal.currencySymbol,
                        ),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: color,
                        ),
                      ),
                      Text(
                        CurrencyFormatter.format(
                          goal.targetAmount,
                          symbol: goal.currencySymbol,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: goal.percentageComplete / 100,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation(color),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${goal.percentageComplete.toStringAsFixed(1)}% complete',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      if (!goal.isCompleted)
                        Text(
                          daysLeft > 0 ? '$daysLeft days left' : 'Overdue',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: daysLeft > 0
                                    ? Theme.of(context).colorScheme.onSurface
                                          .withValues(alpha: 0.6)
                                    : AppColors.error,
                              ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: (100 + index * 50).ms, duration: 500.ms)
        .slideX(begin: 0.2, end: 0);
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.flag_outlined,
              size: 100,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
            ).animate().scale(
              delay: 100.ms,
              duration: 600.ms,
              curve: Curves.elasticOut,
            ),
            const SizedBox(height: AppDimensions.space24),
            Text(
              'No Goals Yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: AppDimensions.space8),
            Text(
              'Start setting financial goals\nto track your savings progress',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
            const SizedBox(height: AppDimensions.space32),
            ElevatedButton.icon(
              onPressed: () => context.push('/add-goal'),
              icon: const Icon(Icons.add),
              label: const Text('Create Goal'),
            ),
          ],
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
