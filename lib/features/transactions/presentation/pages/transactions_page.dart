import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../data/models/transaction.dart';
import '../providers/transaction_providers.dart';
import '../viewmodels/transaction_list_viewmodel.dart';
import '../widgets/transaction_filter_sheet.dart';

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load transactions and categories on page load
    Future.microtask(() {
      ref.read(transactionListViewModelProvider.notifier).loadTransactions();
      ref.read(transactionListViewModelProvider.notifier).loadCategories();
    });

    // Setup infinite scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(transactionListViewModelProvider.notifier).loadMore();
    }
  }

  Future<void> _onRefresh() async {
    await ref
        .read(transactionListViewModelProvider.notifier)
        .refreshTransactions();
  }

  void _showFilterSheet() {
    TransactionFilterSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionListViewModelProvider);
    final transactions = ref.watch(transactionsProvider);
    final typeFilter = ref.watch(transactionTypeFilterProvider);
    final dateRange = ref.watch(dateRangeFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          // Filter indicator
          if (typeFilter != null || dateRange != null)
            Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.filter_alt, size: 20),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(delay: 1000.ms, duration: 1500.ms),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterSheet,
          ),
        ],
      ),
      body: state.isLoading && transactions.isEmpty
          ? _buildLoadingState()
          : transactions.isEmpty
          ? _buildEmptyState()
          : _buildTransactionsList(transactions, state),
      floatingActionButton: _buildFAB().animate().scale(
        delay: 300.ms,
        duration: 400.ms,
        curve: Curves.elasticOut,
      ),
    );
  }

  Widget _buildTransactionsList(
    List<Transaction> transactions,
    TransactionListState state,
  ) {
    final groupedTransactions = _groupByDate(transactions);

    return RefreshIndicator.adaptive(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: const EdgeInsets.all(AppDimensions.space16),
        itemCount: groupedTransactions.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= groupedTransactions.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final entry = groupedTransactions.entries.elementAt(index);
          final date = entry.key;
          final dayTransactions = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimensions.space8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        date,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                      ),
                    ),
                    Text(
                      _getDayTotal(dayTransactions),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: _getDayTotalColor(dayTransactions),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(
                delay: (100 + index * 30).ms,
                duration: 400.ms,
              ),

              // Transactions for this date
              ...List.generate(
                dayTransactions.length,
                (i) => _buildTransactionCard(dayTransactions[i], index, i)
                    .animate()
                    .fadeIn(
                      delay: (150 + index * 30 + i * 20).ms,
                      duration: 500.ms,
                    )
                    .slideX(begin: 0.2, end: 0),
              ),

              const SizedBox(height: AppDimensions.space8),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTransactionCard(
    Transaction transaction,
    int groupIndex,
    int index,
  ) {
    final isIncome = transaction.type == 'INCOME';
    final isExpense = transaction.type == 'EXPENSE';
    final isTransfer = transaction.type == 'TRANSFER';

    Color typeColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.5);
    IconData typeIcon = Icons.swap_horiz;

    if (isIncome) {
      typeColor = AppColors.success;
      typeIcon = Icons.arrow_downward;
    } else if (isExpense) {
      typeColor = AppColors.error;
      typeIcon = Icons.arrow_upward;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.space8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: InkWell(
        onTap: () {
          ref.read(selectedTransactionProvider.notifier).state = transaction;
          context.push('/transaction-detail/${transaction.id}');
        },
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.space16),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: typeColor, width: 4)),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.space12),
                    decoration: BoxDecoration(
                      color: typeColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    child: Icon(
                      transaction.category?.icon != null
                          ? _getCategoryIcon(transaction.category!.icon!)
                          : typeIcon,
                      color: typeColor,
                      size: 24,
                    ),
                  ),

                  const SizedBox(width: AppDimensions.space16),

                  // Transaction Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.description,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // old here
                      ],
                    ),
                  ),

                  // Amount
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transaction.currency.symbol,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isIncome
                              ? AppColors.success
                              : isExpense
                              ? AppColors.error
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      Text(
                        '${isExpense
                            ? '-'
                            : isIncome
                            ? '+'
                            : ''}${transaction.amount}',
                        // : ''}${CurrencyFormatter.format(transaction.amount, symbol: transaction.currency.symbol)}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isIncome
                              ? AppColors.success
                              : isExpense
                              ? AppColors.error
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                      if (transaction.tags.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 4,
                          children: transaction.tags.take(2).map((tag) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '#${tag.name}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.6),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: const Divider(),
              ),

              Row(
                children: [
                  if (transaction.category != null) ...[
                    Text(
                      transaction.category!.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      ' • ',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                  Text(
                    transaction.account.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              if (isTransfer && transaction.toAccount != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      size: 12,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      transaction.toAccount!.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.4),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Transfer button
        FloatingActionButton(
          heroTag: 'transfer',
          onPressed: () {
            context.push('/transfer');
          },
          backgroundColor: AppColors.primary.withValues(alpha: 0.9),
          child: const Icon(Icons.swap_horiz),
        ),
        const SizedBox(height: 12),
        // Add transaction button
        FloatingActionButton.extended(
          heroTag: 'add',
          onPressed: () {
            context.push('/add-transaction');
          },
          icon: const Icon(Icons.add),
          label: const Text('Add'),
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.space16),
      children: List.generate(8, (index) => _buildShimmerCard()),
    );
  }

  Widget _buildShimmerCard() {
    final colorScheme = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest,
      highlightColor: colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.5,
      ),
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: AppDimensions.space12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
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
              'No Transactions Yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

            const SizedBox(height: AppDimensions.space8),

            Text(
              'Start tracking your income and expenses\nby adding your first transaction',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ).animate().fadeIn(delay: 300.ms, duration: 600.ms),

            const SizedBox(height: AppDimensions.space32),

            ElevatedButton.icon(
                  onPressed: () {
                    context.push('/add-transaction');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Transaction'),
                )
                .animate()
                .fadeIn(delay: 400.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    );
  }

  Map<String, List<Transaction>> _groupByDate(List<Transaction> transactions) {
    final grouped = <String, List<Transaction>>{};
    for (var transaction in transactions) {
      final dateKey = DateFormatter.format(transaction.transactionDate);
      grouped.putIfAbsent(dateKey, () => []).add(transaction);
    }
    return grouped;
  }

  String _getDayTotal(List<Transaction> transactions) {
    double total = 0;
    for (var t in transactions) {
      if (t.type == 'INCOME') {
        total += t.amount;
      } else if (t.type == 'EXPENSE') {
        total -= t.amount;
      }
    }
    return CurrencyFormatter.format(total.abs(), symbol: '');
  }

  Color _getDayTotalColor(List<Transaction> transactions) {
    double total = 0;
    for (var t in transactions) {
      if (t.type == 'INCOME') {
        total += t.amount;
      } else if (t.type == 'EXPENSE') {
        total -= t.amount;
      }
    }
    return total >= 0 ? AppColors.success : AppColors.error;
  }

  IconData _getCategoryIcon(String iconName) {
    final iconMap = {
      'restaurant': Icons.restaurant,
      'shopping_cart': Icons.shopping_cart,
      'directions_car': Icons.directions_car,
      'home': Icons.home,
      'local_hospital': Icons.local_hospital,
      'school': Icons.school,
      'work': Icons.work,
      'flight': Icons.flight,
      'local_movies': Icons.local_movies,
      'fitness_center': Icons.fitness_center,
      'shopping_bag': Icons.shopping_bag,
      'phone': Icons.phone,
      'lightbulb': Icons.lightbulb,
      'water_drop': Icons.water_drop,
      'wifi': Icons.wifi,
    };
    return iconMap[iconName] ?? Icons.category;
  }
}
