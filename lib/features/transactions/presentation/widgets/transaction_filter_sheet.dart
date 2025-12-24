import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../providers/transaction_providers.dart';
import '../viewmodels/transaction_list_viewmodel.dart';

class TransactionFilterSheet extends ConsumerWidget {
  const TransactionFilterSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeFilter = ref.watch(transactionTypeFilterProvider);
    final categoryFilter = ref.watch(categoryIdFilterProvider);
    final dateRange = ref.watch(dateRangeFilterProvider);
    final categories = ref.watch(allCategoriesProvider);

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
                  'Filters',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(transactionListViewModelProvider.notifier)
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
                // Type Filter
                _buildSectionTitle(context, 'Transaction Type'),
                const SizedBox(height: AppDimensions.space8),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildFilterChip(
                      context,
                      label: 'All',
                      isSelected: typeFilter == null,
                      onTap: () => ref
                          .read(transactionListViewModelProvider.notifier)
                          .filterByType(null),
                    ),
                    _buildFilterChip(
                      context,
                      label: 'Income',
                      isSelected: typeFilter == 'INCOME',
                      color: AppColors.success,
                      onTap: () => ref
                          .read(transactionListViewModelProvider.notifier)
                          .filterByType('INCOME'),
                    ),
                    _buildFilterChip(
                      context,
                      label: 'Expense',
                      isSelected: typeFilter == 'EXPENSE',
                      color: AppColors.error,
                      onTap: () => ref
                          .read(transactionListViewModelProvider.notifier)
                          .filterByType('EXPENSE'),
                    ),
                    _buildFilterChip(
                      context,
                      label: 'Transfer',
                      isSelected: typeFilter == 'TRANSFER',
                      color: AppColors.info,
                      onTap: () => ref
                          .read(transactionListViewModelProvider.notifier)
                          .filterByType('TRANSFER'),
                    ),
                  ],
                ),

                const SizedBox(height: AppDimensions.space24),

                // Category Filter
                if (categories.isNotEmpty) ...[
                  _buildSectionTitle(context, 'Category'),
                  const SizedBox(height: AppDimensions.space8),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: _buildFilterChip(
                              context,
                              label: 'All Categories',
                              isSelected: categoryFilter == null,
                              onTap: () => ref
                                  .read(
                                    transactionListViewModelProvider.notifier,
                                  )
                                  .filterByCategory(null),
                            ),
                          );
                        }
                        final category = categories[index - 1];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _buildFilterChip(
                            context,
                            label: category.name,
                            isSelected: categoryFilter == category.id,
                            onTap: () => ref
                                .read(transactionListViewModelProvider.notifier)
                                .filterByCategory(category.id),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space24),
                ],

                // Date Range Filter
                _buildSectionTitle(context, 'Date Range'),
                const SizedBox(height: AppDimensions.space8),
                InkWell(
                  onTap: () async {
                    final picked = await showDateRangePicker(
                      context: context,
                      initialDateRange: dateRange != null
                          ? DateTimeRange(
                              start: dateRange.start,
                              end: dateRange.end,
                            )
                          : null,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: Theme.of(context).colorScheme.copyWith(
                              primary: AppColors.primary,
                              onPrimary: Colors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      ref
                          .read(transactionListViewModelProvider.notifier)
                          .filterByDateRange(
                            DateTimeRange(start: picked.start, end: picked.end),
                          );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppDimensions.space16),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.1),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: AppDimensions.space12),
                        Text(
                          dateRange == null
                              ? 'Select date range'
                              : '${DateFormatter.format(dateRange.start)} - ${DateFormatter.format(dateRange.end)}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        if (dateRange != null)
                          IconButton(
                            icon: const Icon(Icons.close, size: 16),
                            onPressed: () {
                              ref
                                  .read(
                                    transactionListViewModelProvider.notifier,
                                  )
                                  .filterByDateRange(null);
                            },
                          )
                        else
                          const Icon(Icons.chevron_right, size: 20),
                      ],
                    ),
                  ),
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

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TransactionFilterSheet(),
    );
  }
}

// Helper class to match the DateTimeRange expected by the viewmodel if it differs from material one
// Actually the provider uses a custom DateTimeRange class, I should use that or align it.
// Let's check transaction_providers.dart again.
// It has:
// class DateTimeRange {
//   final DateTime start;
//   final DateTime end;
//   DateTimeRange(this.start, this.end);
// }
// Material has:
// class DateTimeRange with Diagnosticable {
//   DateTimeRange({required this.start, required this.end});
//   final DateTime start;
//   final DateTime end;
// }

typedef DateTimeRangeProxy = DateTimeRange;
