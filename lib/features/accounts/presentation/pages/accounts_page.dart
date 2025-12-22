import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/presentation/widgets/currency_selector_sheet.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../user_preferences/presentation/viewmodels/user_preference_viewmodel.dart';
import '../../data/models/account.dart';
import '../../data/models/account_summary.dart';
import '../providers/account_providers.dart';
import '../viewmodels/account_list_viewmodel.dart';

class AccountsPage extends ConsumerStatefulWidget {
  const AccountsPage({super.key});

  @override
  ConsumerState<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends ConsumerState<AccountsPage> {
  @override
  void initState() {
    super.initState();
    // Load accounts on page load
    Future.microtask(() {
      ref.read(userPreferenceViewModelProvider.notifier).loadUserPreferences();
      ref.read(accountListViewModelProvider.notifier).loadAccounts();
      ref.read(accountListViewModelProvider.notifier).loadAccountSummary();
    });
  }

  Future<void> _onRefresh() async {
    await ref.read(accountListViewModelProvider.notifier).refreshAccounts();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountListViewModelProvider);
    final accounts = ref.watch(accountsProvider);
    final summary = ref.watch(accountSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // todo(mixin27): Show filter options
            },
          ),
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: _onRefresh,
        child: state.isLoading && accounts.isEmpty
            ? _buildLoadingState()
            : accounts.isEmpty
            ? _buildEmptyState()
            : _buildAccountsList(accounts, summary),
      ),
      floatingActionButton:
          FloatingActionButton.extended(
            heroTag: 'fab-accounts',
            onPressed: () {
              context.push('/add-account');
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Account'),
            backgroundColor: AppColors.primary,
          ).animate().scale(
            delay: 300.ms,
            duration: 400.ms,
            curve: Curves.elasticOut,
          ),
    );
  }

  Widget _buildAccountsList(List<Account> accounts, AccountSummary? summary) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.space16),
      children: [
        // Summary Card
        if (summary != null)
          _buildSummaryCard(summary)
              .animate()
              .fadeIn(delay: 100.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0),

        const SizedBox(height: AppDimensions.space24),

        // Accounts Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Accounts',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '${accounts.length} ${accounts.length == 1 ? 'Account' : 'Accounts'}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey500),
            ),
          ],
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

        const SizedBox(height: AppDimensions.space16),

        // Accounts List
        ...List.generate(
          accounts.length,
          (index) => _buildAccountCard(accounts[index], index)
              .animate()
              .fadeIn(delay: (300 + (index * 50)).ms, duration: 600.ms)
              .slideX(begin: 0.2, end: 0),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(AccountSummary summary) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.space20),
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
          GestureDetector(
            onTap: () async {
              final changed = await CurrencySelectorSheet.show(context);
              if (changed == true) {
                ref
                    .read(accountListViewModelProvider.notifier)
                    .refreshAccounts();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  CurrencyFormatter.format(
                    summary.totalBalance,
                    symbol:
                        ref
                            .watch(userPreferenceViewModelProvider)
                            .userPreference
                            ?.defaultCurrencySymbol ??
                        '',
                  ),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: AppDimensions.space8),
                Icon(
                  Icons.expand_more,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.space16),
          Divider(color: Colors.white.withValues(alpha: 0.2)),
          const SizedBox(height: AppDimensions.space16),
          Row(
            spacing: AppDimensions.space4,
            children: [
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Accounts',
                  summary.activeAccounts.toString(),
                  Icons.account_balance_wallet_outlined,
                ),
              ),
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Currencies',
                  summary.balanceByCurrency.length.toString(),
                  Icons.currency_exchange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.space12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: AppDimensions.space8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCard(Account account, int index) {
    final accountColor = _parseColor(account.color);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.space12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: InkWell(
        onTap: () {
          ref.read(selectedAccountProvider.notifier).state = account;
          context.push('/account-detail/${account.id}');
        },
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.space16),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: accountColor, width: 4)),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(AppDimensions.space12),
                decoration: BoxDecoration(
                  color: accountColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusMedium,
                  ),
                ),
                child: Icon(
                  _getAccountIcon(account.accountType.name),
                  color: accountColor,
                  size: 28,
                ),
              ),

              const SizedBox(width: AppDimensions.space16),

              // Account Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${account.accountType.name} • ${account.currency.code}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.grey500),
                    ),
                  ],
                ),
              ),

              // Balance
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    CurrencyFormatter.format(
                      account.currentBalance,
                      symbol: account.currency.symbol,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: account.currentBalance >= 0
                          ? AppColors.grey900
                          : AppColors.error,
                    ),
                  ),
                  if (!account.isIncludedInTotal)
                    Text(
                      'Not in total',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.grey400,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.space16),
      children: [
        _buildShimmerCard(height: 150),
        const SizedBox(height: AppDimensions.space16),
        ...List.generate(5, (index) => _buildShimmerCard(height: 80)),
      ],
    );
  }

  Widget _buildShimmerCard({required double height}) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey200,
      highlightColor: AppColors.grey100,
      child: Container(
        height: height,
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
              Icons.account_balance_wallet_outlined,
              size: 100,
              color: AppColors.grey300,
            ).animate().scale(
              delay: 100.ms,
              duration: 600.ms,
              curve: Curves.elasticOut,
            ),

            const SizedBox(height: AppDimensions.space24),

            Text(
              'No Accounts Yet',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: AppColors.grey600),
            ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

            const SizedBox(height: AppDimensions.space8),

            Text(
              'Create your first account to start\nmanaging your finances',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey400),
            ).animate().fadeIn(delay: 300.ms, duration: 600.ms),

            const SizedBox(height: AppDimensions.space32),

            ElevatedButton.icon(
                  onPressed: () {
                    context.push('/add-account');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Create Account'),
                )
                .animate()
                .fadeIn(delay: 400.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
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
