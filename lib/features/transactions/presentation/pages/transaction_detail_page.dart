import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../providers/transaction_providers.dart';
import '../viewmodels/transaction_list_viewmodel.dart';

class TransactionDetailPage extends ConsumerWidget {
  final String transactionId;

  const TransactionDetailPage({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transaction = ref.watch(selectedTransactionProvider);

    if (transaction == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Transaction Details')),
        body: const Center(child: Text('Transaction not found')),
      );
    }

    final isIncome = transaction.type == 'INCOME';
    final isExpense = transaction.type == 'EXPENSE';
    final isTransfer = transaction.type == 'TRANSFER';

    Color typeColor = AppColors.grey600;
    IconData typeIcon = Icons.swap_horiz;
    String typeLabel = 'Transfer';

    if (isIncome) {
      typeColor = AppColors.success;
      typeIcon = Icons.arrow_downward;
      typeLabel = 'Income';
    } else if (isExpense) {
      typeColor = AppColors.error;
      typeIcon = Icons.arrow_upward;
      typeLabel = 'Expense';
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Transaction Type Color
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            backgroundColor: typeColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [typeColor, typeColor.withValues(alpha: 0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          transaction.category?.icon != null
                              ? _getCategoryIcon(transaction.category!.icon!)
                              : typeIcon,
                          size: 48,
                          color: Colors.white,
                        ),
                      ).animate().scale(
                        delay: 100.ms,
                        duration: 600.ms,
                        curve: Curves.elasticOut,
                      ),
                      const SizedBox(height: 16),
                      Text(
                            '${isExpense
                                ? '-'
                                : isIncome
                                ? '+'
                                : ''}${CurrencyFormatter.format(transaction.amount, symbol: transaction.currency.symbol)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 600.ms)
                          .slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          typeLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              if (!isTransfer) // Can't edit transfers
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Edit functionality coming soon!'),
                      ),
                    );
                  },
                ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 20, color: AppColors.error),
                        SizedBox(width: 8),
                        Text(
                          'Delete',
                          style: TextStyle(color: AppColors.error),
                        ),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'delete') {
                    _showDeleteDialog(context, ref, transaction.id);
                  }
                },
              ),
            ],
          ),

          // Transaction Details
          SliverPadding(
            padding: const EdgeInsets.all(AppDimensions.space16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Basic Info Card
                _buildInfoCard(context, 'Transaction Information', [
                      _buildInfoRow(
                        context,
                        'Description',
                        transaction.description,
                        Icons.description_outlined,
                      ),
                      if (transaction.category != null) ...[
                        const Divider(),
                        _buildInfoRow(
                          context,
                          'Category',
                          transaction.category!.name,
                          Icons.category_outlined,
                        ),
                      ],
                      const Divider(),
                      _buildInfoRow(
                        context,
                        'Date',
                        DateFormatter.format(transaction.transactionDate),
                        Icons.calendar_today,
                      ),
                      if (transaction.payee != null) ...[
                        const Divider(),
                        _buildInfoRow(
                          context,
                          'Payee',
                          transaction.payee!,
                          Icons.person_outline,
                        ),
                      ],
                      if (transaction.note != null) ...[
                        const Divider(),
                        _buildInfoRow(
                          context,
                          'Note',
                          transaction.note!,
                          Icons.notes_outlined,
                        ),
                      ],
                    ])
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Account Info Card
                _buildInfoCard(context, 'Account Information', [
                      _buildInfoRow(
                        context,
                        isTransfer ? 'From Account' : 'Account',
                        transaction.account.name,
                        Icons.account_balance_wallet_outlined,
                      ),
                      const Divider(),
                      _buildInfoRow(
                        context,
                        'Account Type',
                        transaction.account.accountType.name,
                        Icons.category_outlined,
                      ),
                      const Divider(),
                      _buildInfoRow(
                        context,
                        'Currency',
                        '${transaction.currency.code} (${transaction.currency.symbol})',
                        Icons.currency_exchange,
                      ),
                      if (isTransfer && transaction.toAccount != null) ...[
                        const Divider(thickness: 2),
                        _buildInfoRow(
                          context,
                          'To Account',
                          transaction.toAccount!.name,
                          Icons.account_balance_wallet,
                        ),
                        const Divider(),
                        _buildInfoRow(
                          context,
                          'To Account Type',
                          transaction.toAccount!.accountType.name,
                          Icons.category_outlined,
                        ),
                        if (transaction.exchangeRate != null) ...[
                          const Divider(),
                          _buildInfoRow(
                            context,
                            'Exchange Rate',
                            transaction.exchangeRate!.toStringAsFixed(4),
                            Icons.sync_alt,
                          ),
                        ],
                        if (transaction.convertedAmount != null) ...[
                          const Divider(),
                          _buildInfoRow(
                            context,
                            'Converted Amount',
                            CurrencyFormatter.format(
                              transaction.convertedAmount!,
                              symbol: transaction.toAccount!.currency.symbol,
                            ),
                            Icons.attach_money,
                          ),
                        ],
                      ],
                    ])
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Tags (if any)
                if (transaction.tags.isNotEmpty)
                  _buildTagsCard(context, transaction.tags)
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 600.ms)
                      .slideY(begin: 0.2, end: 0),

                if (transaction.tags.isNotEmpty)
                  const SizedBox(height: AppDimensions.space16),

                // Location (if available)
                if (transaction.location != null)
                  _buildInfoCard(context, 'Location', [
                        _buildInfoRow(
                          context,
                          'Location',
                          transaction.location!,
                          Icons.location_on_outlined,
                        ),
                        if (transaction.latitude != null &&
                            transaction.longitude != null) ...[
                          const Divider(),
                          _buildInfoRow(
                            context,
                            'Coordinates',
                            '${transaction.latitude}, ${transaction.longitude}',
                            Icons.gps_fixed,
                          ),
                        ],
                      ])
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 600.ms)
                      .slideY(begin: 0.2, end: 0),

                if (transaction.location != null)
                  const SizedBox(height: AppDimensions.space16),

                // Metadata Card
                _buildInfoCard(context, 'Metadata', [
                      _buildInfoRow(
                        context,
                        'Status',
                        transaction.status,
                        Icons.info_outline,
                      ),
                      const Divider(),
                      _buildInfoRow(
                        context,
                        'Created',
                        DateFormatter.format(transaction.createdAt),
                        Icons.access_time,
                      ),
                      const Divider(),
                      _buildInfoRow(
                        context,
                        'Last Updated',
                        DateFormatter.formatRelative(transaction.updatedAt),
                        Icons.update,
                      ),
                    ])
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: AppDimensions.space48),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppDimensions.space16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          const SizedBox(width: AppDimensions.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsCard(BuildContext context, List tags) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tags',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppDimensions.space12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) {
                return Chip(
                  label: Text('#${tag.name}'),
                  backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                  labelStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  side: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    String transactionId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text(
          'Are you sure you want to delete this transaction? This action cannot be undone.\n\nNote: Account balances will be automatically updated.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              final success = await ref
                  .read(transactionListViewModelProvider.notifier)
                  .deleteTransaction(transactionId);

              if (!context.mounted) return;

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Transaction deleted successfully'),
                    backgroundColor: AppColors.success,
                  ),
                );
                context.pop();
              } else {
                final error = ref
                    .read(transactionListViewModelProvider)
                    .errorMessage;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error ?? 'Failed to delete transaction'),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
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
