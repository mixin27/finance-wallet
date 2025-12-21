import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../viewmodels/profile_view_model.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    if (!context.mounted) return;

    try {
      final viewModel = ref.read(profileViewModelProvider.notifier);
      await viewModel.logout();
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to logout: ${e.toString()}')),
      );
    }
  }

  Future<void> _handleRefresh(WidgetRef ref) async {
    final viewModel = ref.read(profileViewModelProvider.notifier);
    await viewModel.refresh();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(profileViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: RefreshIndicator.adaptive(
        onRefresh: () => _handleRefresh(ref),
        child: userAsync.when(
          data: (user) {
            return ListView(
              padding: const EdgeInsets.all(AppDimensions.space16),
              children: [
                // User Info Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.space16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.primary,
                          child: Text(
                            user.fullName[0].toUpperCase(),
                            style: const TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppDimensions.space16),
                        Text(
                          user.fullName,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppDimensions.space4),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.grey600),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppDimensions.space24),

                // Finance Section
                _buildMenuItem(
                  context,
                  'Categories',
                  Icons.category_outlined,
                  () {
                    context.push('/categories');
                  },
                ),
                _buildMenuItem(context, 'Goals', Icons.flag_outlined, () {
                  context.push('/goals');
                }),
                _buildMenuItem(
                  context,
                  'Budgets',
                  Icons.account_balance_wallet_outlined,
                  () {
                    context.push('/budgets');
                  },
                ),
                _buildMenuItem(
                  context,
                  'Analytics & Reports',
                  Icons.analytics_outlined,
                  () {
                    context.push('/analytics');
                  },
                ),

                const SizedBox(height: AppDimensions.space16),

                // Settings
                _buildMenuItem(
                  context,
                  'Settings',
                  Icons.settings_outlined,
                  () {},
                ),
                _buildMenuItem(
                  context,
                  'Notifications',
                  Icons.notifications_outlined,
                  () {},
                ),
                _buildMenuItem(
                  context,
                  'Security',
                  Icons.security_outlined,
                  () {},
                ),
                _buildMenuItem(
                  context,
                  'Help & Support',
                  Icons.help_outline,
                  () {},
                ),

                const SizedBox(height: AppDimensions.space16),

                // Logout
                _buildMenuItem(
                  context,
                  'Logout',
                  Icons.logout,
                  () => _handleLogout(context, ref),
                  isDestructive: true,
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: ${error.toString()}'),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(profileViewModelProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? AppColors.error : AppColors.grey600,
        ),
        title: Text(
          title,
          style: TextStyle(color: isDestructive ? AppColors.error : null),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
