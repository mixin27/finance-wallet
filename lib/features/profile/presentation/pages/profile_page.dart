import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../auth/presentation/providers/auth_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
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
                      user?.fullName[0].toUpperCase() ?? 'U',
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space16),
                  Text(
                    user?.fullName ?? 'User',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppDimensions.space4),
                  Text(
                    user?.email ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppDimensions.space24),

          // Settings
          _buildMenuItem(context, 'Settings', Icons.settings_outlined, () {}),
          _buildMenuItem(
            context,
            'Notifications',
            Icons.notifications_outlined,
            () {},
          ),
          _buildMenuItem(context, 'Security', Icons.security_outlined, () {}),
          _buildMenuItem(context, 'Help & Support', Icons.help_outline, () {}),

          const SizedBox(height: AppDimensions.space16),

          // Logout
          _buildMenuItem(context, 'Logout', Icons.logout, () async {
            await ref.read(authRepositoryProvider).logout();
            ref.read(currentUserProvider.notifier).state = null;
            ref.read(authStateProvider.notifier).state = false;
            if (context.mounted) {
              context.go('/login');
            }
          }, isDestructive: true),
        ],
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
