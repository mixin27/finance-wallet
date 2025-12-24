import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerHighest.withValues(
        alpha: 0.3,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => _handleRefresh(ref),
        child: userAsync.when(
          data: (user) {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // Custom Header
                SliverAppBar(
                  expandedHeight: 280,
                  pinned: true,
                  stretch: true,
                  backgroundColor: colorScheme.primary,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Gradient Background
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: AppColors.primaryGradient,
                            ),
                          ),
                        ),
                        // Decorative circles
                        Positioned(
                          top: -50,
                          right: -50,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.05),
                            ),
                          ),
                        ),
                        // User Profile Info
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            Hero(
                              tag: 'profile-image',
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.2),
                                  child: Text(
                                    user.fullName[0].toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ).animate().scale(
                              duration: 400.ms,
                              curve: Curves.easeOutBack,
                            ),
                            const SizedBox(height: AppDimensions.space16),
                            Text(
                                  user.fullName,
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                                .animate()
                                .fadeIn(delay: 200.ms)
                                .slideY(begin: 0.2),
                            const SizedBox(height: 4),
                            Text(
                                  user.email,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                )
                                .animate()
                                .fadeIn(delay: 300.ms)
                                .slideY(begin: 0.2),
                            const SizedBox(height: AppDimensions.space16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildHeaderAction(
                                  context,
                                  'Edit Profile',
                                  Icons.edit_outlined,
                                  () => context.push('/edit-profile'),
                                ),
                                const SizedBox(width: 12),
                                _buildHeaderAction(
                                  context,
                                  'Security',
                                  Icons.security_outlined,
                                  () => context.push('/change-password'),
                                ),
                              ],
                            ).animate().fadeIn(delay: 400.ms),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Menu Options
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildSectionHeader(context, 'FINANCE'),
                      _buildMenuContainer(context, [
                        _buildMenuItem(
                          context,
                          'Categories',
                          'Manage your income and expense categories',
                          Icons.category_rounded,
                          colorScheme.primary,
                          () => context.push('/categories'),
                        ),
                        _buildMenuItem(
                          context,
                          'Budgeting',
                          'Set and track your monthly budget',
                          Icons.account_balance_wallet_rounded,
                          AppColors.success,
                          () => context.push('/budgets'),
                        ),
                        _buildMenuItem(
                          context,
                          'Financial Goals',
                          'Track your savings and spending goals',
                          Icons.flag_rounded,
                          AppColors.accentDark,
                          () => context.push('/goals'),
                        ),
                        _buildMenuItem(
                          context,
                          'Reports & Analytics',
                          'Visual insights of your wallet activity',
                          Icons.analytics_rounded,
                          AppColors.secondary,
                          () => context.push('/analytics'),
                        ),
                      ]),
                      const SizedBox(height: 24),
                      _buildSectionHeader(context, 'PREFERENCES'),
                      _buildMenuContainer(context, [
                        _buildMenuItem(
                          context,
                          'App Settings',
                          'Language, currency, and theme preferences',
                          Icons.settings_rounded,
                          colorScheme.onSurfaceVariant,
                          () => context.push('/settings'),
                        ),
                        _buildMenuItem(
                          context,
                          'Notifications',
                          'Manage your alerts and daily reminders',
                          Icons.notifications_rounded,
                          AppColors.info,
                          () => context.push('/settings'),
                        ),
                      ]),
                      const SizedBox(height: 24),
                      _buildSectionHeader(context, 'GENERAL'),
                      _buildMenuContainer(context, [
                        _buildMenuItem(
                          context,
                          'Help & Support',
                          'Get help or contact our support team',
                          Icons.help_outline_rounded,
                          colorScheme.onSurfaceVariant,
                          () {},
                        ),
                        _buildMenuItem(
                          context,
                          'Logout',
                          'Sign out of your account securely',
                          Icons.logout_rounded,
                          colorScheme.error,
                          () => _handleLogout(context, ref),
                          isDestructive: true,
                        ),
                      ]),
                    ]),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                const SizedBox(height: 16),
                const Text('Something went wrong'),
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

  Widget _buildHeaderAction(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: theme.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1);
  }

  Widget _buildMenuContainer(BuildContext context, List<Widget> children) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: isDestructive
              ? theme.colorScheme.error
              : theme.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isDestructive
              ? theme.colorScheme.error.withValues(alpha: 0.6)
              : theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
        size: 20,
      ),
    );
  }
}
