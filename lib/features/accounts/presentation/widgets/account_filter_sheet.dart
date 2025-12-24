import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../providers/account_providers.dart';
import '../viewmodels/account_list_viewmodel.dart';

class AccountFilterSheet extends ConsumerStatefulWidget {
  const AccountFilterSheet({super.key});

  @override
  ConsumerState<AccountFilterSheet> createState() => _AccountFilterSheetState();

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AccountFilterSheet(),
    );
  }
}

class _AccountFilterSheetState extends ConsumerState<AccountFilterSheet> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(accountListViewModelProvider.notifier).loadAccountTypes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(accountFilterProvider);
    final accountTypes = ref.watch(accountTypesProvider);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom + AppDimensions.space16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.space16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Filters',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(accountListViewModelProvider.notifier)
                        .clearFilters();
                    Navigator.pop(context);
                  },
                  child: const Text('Clear All'),
                ),
              ],
            ),
          ),

          const Divider(),

          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(AppDimensions.space16),
              children: [
                // Account Type Filter
                _buildSectionTitle(context, 'Account Type'),
                const SizedBox(height: AppDimensions.space8),
                if (accountTypes.isEmpty)
                  const Center(child: CircularProgressIndicator())
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildFilterChip(
                        context,
                        label: 'All',
                        isSelected: filter.accountType == null,
                        onTap: () => ref
                            .read(accountListViewModelProvider.notifier)
                            .updateFilter(filter.copyWith(accountType: null)),
                      ),
                      ...accountTypes.map((type) {
                        return _buildFilterChip(
                          context,
                          label: type.name,
                          isSelected: filter.accountType == type.name,
                          onTap: () => ref
                              .read(accountListViewModelProvider.notifier)
                              .updateFilter(
                                filter.copyWith(accountType: type.name),
                              ),
                        );
                      }),
                    ],
                  ),

                const SizedBox(height: AppDimensions.space24),

                // Include Inactive Toggle
                _buildSectionTitle(context, 'Status'),
                const SizedBox(height: AppDimensions.space8),
                SwitchListTile(
                  value: filter.includeInactive,
                  onChanged: (value) {
                    ref
                        .read(accountListViewModelProvider.notifier)
                        .updateFilter(filter.copyWith(includeInactive: value));
                  },
                  title: const Text('Show Inactive Accounts'),
                  subtitle: const Text(
                    'Include accounts that are marked as inactive',
                  ),
                  contentPadding: EdgeInsets.zero,
                  activeThumbColor: AppColors.primary,
                ),

                const SizedBox(height: AppDimensions.space32),

                // Apply Button
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().slideY(
      begin: 0.3,
      end: 0,
      duration: 300.ms,
      curve: Curves.easeOut,
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFilterChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    Color? color,
    required VoidCallback onTap,
  }) {
    final chipColor = color ?? AppColors.primary;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: Theme.of(
        context,
      ).colorScheme.onSurface.withValues(alpha: 0.1),
      selectedColor: chipColor.withValues(alpha: 0.2),
      checkmarkColor: chipColor,
      labelStyle: TextStyle(
        color: isSelected
            ? chipColor
            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected
            ? chipColor
            : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
        width: isSelected ? 2 : 1,
      ),
    );
  }
}
