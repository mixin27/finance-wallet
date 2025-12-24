import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/utils/date_formatter.dart';
import '../providers/account_providers.dart';
import '../viewmodels/account_list_viewmodel.dart';

class AccountDetailPage extends ConsumerWidget {
  final String accountId;

  const AccountDetailPage({super.key, required this.accountId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider);

    if (account == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Account Details')),
        body: const Center(child: Text('Account not found')),
      );
    }

    final accountColor = _parseColor(account.color);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with Account Color
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: accountColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(account.name),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accountColor, accountColor.withValues(alpha: 0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getAccountIcon(account.accountType.name),
                        size: 48,
                        color: Colors.white,
                      ),
                      const SizedBox(height: AppDimensions.space8),
                      Text(
                        CurrencyFormatter.format(
                          account.currentBalance,
                          symbol: account.currency.symbol,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 20),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
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
                  if (value == 'edit') {
                    // todo(mixin27): Navigate to edit page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Edit functionality coming soon!'),
                      ),
                    );
                  } else if (value == 'delete') {
                    _showDeleteDialog(context, ref, account.id);
                  }
                },
              ),
            ],
          ),

          // Account Details
          SliverPadding(
            padding: const EdgeInsets.all(AppDimensions.space16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Info Card
                Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimensions.space16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account Information',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: AppDimensions.space16),
                            _buildInfoRow(
                              context,
                              'Account Type',
                              account.accountType.name,
                              Icons.category_outlined,
                            ),
                            const Divider(),
                            _buildInfoRow(
                              context,
                              'Currency',
                              '${account.currency.code} (${account.currency.symbol})',
                              Icons.currency_exchange,
                            ),
                            const Divider(),
                            _buildInfoRow(
                              context,
                              'Initial Balance',
                              CurrencyFormatter.format(
                                account.initialBalance,
                                symbol: account.currency.symbol,
                              ),
                              Icons.monetization_on_outlined,
                            ),
                            const Divider(),
                            _buildInfoRow(
                              context,
                              'Current Balance',
                              CurrencyFormatter.format(
                                account.currentBalance,
                                symbol: account.currency.symbol,
                              ),
                              Icons.account_balance_wallet_outlined,
                            ),
                            if (account.description != null) ...[
                              const Divider(),
                              _buildInfoRow(
                                context,
                                'Description',
                                account.description!,
                                Icons.notes_outlined,
                              ),
                            ],
                            const Divider(),
                            _buildInfoRow(
                              context,
                              'Included in Total',
                              account.isIncludedInTotal ? 'Yes' : 'No',
                              account.isIncludedInTotal
                                  ? Icons.check_circle_outline
                                  : Icons.cancel_outlined,
                            ),
                            const Divider(),
                            _buildInfoRow(
                              context,
                              'Created',
                              DateFormatter.format(account.createdAt),
                              Icons.calendar_today,
                            ),
                            const Divider(),
                            _buildInfoRow(
                              context,
                              'Last Updated',
                              DateFormatter.formatRelative(account.updatedAt),
                              Icons.update,
                            ),
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: AppDimensions.space16),

                // Transactions Section (Placeholder)
                Card(
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimensions.space16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Transactions',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                                TextButton(
                                  onPressed: () {
                                    // todo(mixin27): Navigate to transactions filtered by this account
                                  },
                                  child: const Text('See All'),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimensions.space16),
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.receipt_long_outlined,
                                    size: 48,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.3),
                                  ),
                                  const SizedBox(height: AppDimensions.space8),
                                  Text(
                                    'No transactions yet',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
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
                          ],
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),
              ]),
            ),
          ),
        ],
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

  void _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    String accountId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete this account? This action cannot be undone.\n\nNote: You can only delete accounts with zero balance.',
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
                  .read(accountListViewModelProvider.notifier)
                  .deleteAccount(accountId);

              if (!context.mounted) return;

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account deleted successfully'),
                    backgroundColor: AppColors.success,
                  ),
                );
                context.pop();
              } else {
                final error = ref
                    .read(accountListViewModelProvider)
                    .errorMessage;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error ?? 'Failed to delete account'),
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

  IconData _getAccountIcon(String accountType) {
    switch (accountType.toUpperCase()) {
      case 'BANK':
        return Icons.account_balance;
      case 'CASH':
        return Icons.payments;
      case 'CREDIT_CARD':
        return Icons.credit_card;
      case 'INVESTMENT':
        return Icons.trending_up;
      case 'SAVINGS':
        return Icons.savings;
      case 'WALLET':
        return Icons.account_balance_wallet;
      case 'LOAN':
        return Icons.request_quote;
      default:
        return Icons.account_balance_wallet;
    }
  }
}
