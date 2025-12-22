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

    return Scaffold(
      backgroundColor: AppColors.grey50,
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
                  backgroundColor: AppColors.primary,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Gradient Background
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.primary,
                                Color(0xFF3F51B5), // Deep Indigo
                              ],
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
                                  backgroundColor: AppColors.grey200,
                                  child: Text(
                                    user.fullName[0].toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 40,
                                      color: AppColors.primary,
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
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                .animate()
                                .fadeIn(delay: 200.ms)
                                .slideY(begin: 0.2),
                            const SizedBox(height: 4),
                            Text(
                                  user.email,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    fontSize: 14,
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
                      _buildSectionHeader('FINANCE'),
                      _buildMenuContainer([
                        _buildMenuItem(
                          context,
                          'Categories',
                          'Manage your income and expense categories',
                          Icons.category_rounded,
                          AppColors.primary,
                          () => context.push('/categories'),
                        ),
                        _buildMenuItem(
                          context,
                          'Budgeting',
                          'Set and track your monthly budget',
                          Icons.account_balance_wallet_rounded,
                          const Color(0xFF4CAF50), // Green
                          () => context.push('/budgets'),
                        ),
                        _buildMenuItem(
                          context,
                          'Financial Goals',
                          'Track your savings and spending goals',
                          Icons.flag_rounded,
                          const Color(0xFFFF9800), // Orange
                          () => context.push('/goals'),
                        ),
                        _buildMenuItem(
                          context,
                          'Reports & Analytics',
                          'Visual insights of your wallet activity',
                          Icons.analytics_rounded,
                          const Color(0xFF9C27B0), // Purple
                          () => context.push('/analytics'),
                        ),
                      ]),
                      const SizedBox(height: 24),
                      _buildSectionHeader('PREFERENCES'),
                      _buildMenuContainer([
                        _buildMenuItem(
                          context,
                          'App Settings',
                          'Language, currency, and theme preferences',
                          Icons.settings_rounded,
                          AppColors.grey700,
                          () => context.push('/settings'),
                        ),
                        _buildMenuItem(
                          context,
                          'Notifications',
                          'Manage your alerts and daily reminders',
                          Icons.notifications_rounded,
                          const Color(0xFF2196F3), // Blue
                          () => context.push('/settings'),
                        ),
                      ]),
                      const SizedBox(height: 24),
                      _buildSectionHeader('GENERAL'),
                      _buildMenuContainer([
                        _buildMenuItem(
                          context,
                          'Help & Support',
                          'Get help or contact our support team',
                          Icons.help_outline_rounded,
                          AppColors.grey700,
                          () {},
                        ),
                        _buildMenuItem(
                          context,
                          'Logout',
                          'Sign out of your account securely',
                          Icons.logout_rounded,
                          AppColors.error,
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
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.grey500,
          letterSpacing: 1.2,
        ),
      ),
    ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1);
  }

  Widget _buildMenuContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: isDestructive ? AppColors.error : AppColors.grey800,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: isDestructive
              ? AppColors.error.withValues(alpha: 0.6)
              : AppColors.grey500,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.grey400,
        size: 20,
      ),
    );
  }
}
