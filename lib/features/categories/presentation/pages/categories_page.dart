import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../data/models/category_detailed.dart';
import '../providers/category_providers.dart';
import '../viewmodels/category_viewmodel.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load categories on page load
    Future.microtask(() {
      ref.read(categoryViewModelProvider.notifier).loadCategories();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await ref.read(categoryViewModelProvider.notifier).refreshCategories();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryViewModelProvider);
    final incomeCategories = ref.watch(incomeCategoriesDetailedProvider);
    final expenseCategories = ref.watch(expenseCategoriesDetailedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Income'),
            Tab(text: 'Expense'),
          ],
        ),
      ),
      body:
          state.isLoading &&
              incomeCategories.isEmpty &&
              expenseCategories.isEmpty
          ? _buildLoadingState()
          : RefreshIndicator.adaptive(
              onRefresh: _onRefresh,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildCategoryList(incomeCategories, 'INCOME'),
                  _buildCategoryList(expenseCategories, 'EXPENSE'),
                ],
              ),
            ),
      floatingActionButton:
          FloatingActionButton.extended(
            onPressed: () {
              final type = _tabController.index == 0 ? 'INCOME' : 'EXPENSE';
              context.push('/add-category?type=$type');
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Category'),
            backgroundColor: AppColors.primary,
          ).animate().scale(
            delay: 300.ms,
            duration: 400.ms,
            curve: Curves.elasticOut,
          ),
    );
  }

  Widget _buildCategoryList(List<CategoryDetailed> categories, String type) {
    if (categories.isEmpty) {
      return _buildEmptyState(type);
    }

    // Separate system and custom categories
    final systemCategories = categories.where((c) => c.isSystem).toList();
    final customCategories = categories.where((c) => !c.isSystem).toList();

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.space16),
      children: [
        // System Categories
        if (systemCategories.isNotEmpty) ...[
          Text(
            'System Categories',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ).animate().fadeIn(delay: 100.ms, duration: 600.ms),
          const SizedBox(height: AppDimensions.space12),
          ...systemCategories.asMap().entries.map((entry) {
            return _buildCategoryCard(entry.value, entry.key, isSystem: true);
          }),
          const SizedBox(height: AppDimensions.space24),
        ],

        // Custom Categories
        if (customCategories.isNotEmpty) ...[
          Text(
            'Custom Categories',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
          const SizedBox(height: AppDimensions.space12),
          ...customCategories.asMap().entries.map((entry) {
            return _buildCategoryCard(
              entry.value,
              entry.key + systemCategories.length,
            );
          }),
        ] else if (systemCategories.isNotEmpty) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.space16),
              child: Column(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 48,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                  const SizedBox(height: AppDimensions.space8),
                  Text(
                    'No custom categories yet',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.space4),
                  Text(
                    'Create your own categories',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
        ],
      ],
    );
  }

  Widget _buildCategoryCard(
    CategoryDetailed category,
    int index, {
    bool isSystem = false,
  }) {
    final color = _parseColor(category.color);

    return Card(
          margin: const EdgeInsets.only(bottom: AppDimensions.space12),
          child: InkWell(
            onTap: isSystem
                ? null
                : () {
                    ref.read(selectedCategoryProvider.notifier).state =
                        category;
                    context.push('/category-detail/${category.id}');
                  },
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.space16),
              child: Row(
                children: [
                  // Icon/Color Indicator
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.space12),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMedium,
                      ),
                    ),
                    child: category.icon != null
                        ? Text(
                            category.icon!,
                            style: const TextStyle(fontSize: 24),
                          )
                        : Icon(Icons.category, color: color, size: 24),
                  ),

                  const SizedBox(width: AppDimensions.space16),

                  // Category Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                category.name,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            if (isSystem)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.info.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'System',
                                  style: TextStyle(
                                    color: AppColors.info,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (category.subCategories.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            '${category.subCategories.length} ${category.subCategories.length == 1 ? 'subcategory' : 'subcategories'}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Arrow or Actions
                  if (!isSystem)
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(delay: (100 + index * 50).ms, duration: 500.ms)
        .slideX(begin: 0.2, end: 0);
  }

  Widget _buildLoadingState() {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.space16),
      children: List.generate(
        8,
        (index) => Shimmer.fromColors(
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
        ),
      ),
    );
  }

  Widget _buildEmptyState(String type) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.space32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.category_outlined,
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
              'No Categories',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ).animate().fadeIn(delay: 200.ms, duration: 600.ms),

            const SizedBox(height: AppDimensions.space8),

            Text(
              'No $type categories found',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
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
}
