import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../../data/models/create_category_request.dart';
import '../providers/category_providers.dart';
import '../viewmodels/category_viewmodel.dart';

class AddCategoryPage extends ConsumerStatefulWidget {
  final String type; // INCOME or EXPENSE

  const AddCategoryPage({super.key, required this.type});

  @override
  ConsumerState<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  String? _selectedColor;
  String? _selectedIcon;
  String? _parentCategoryId;

  final List<CategoryColorOption> _colors = [
    CategoryColorOption('Primary', '#6366F1'),
    CategoryColorOption('Green', '#10B981'),
    CategoryColorOption('Orange', '#F59E0B'),
    CategoryColorOption('Red', '#EF4444'),
    CategoryColorOption('Purple', '#8B5CF6'),
    CategoryColorOption('Pink', '#EC4899'),
    CategoryColorOption('Teal', '#14B8A6'),
    CategoryColorOption('Blue', '#2196F3'),
  ];

  final List<String> _icons = [
    '💼', '💻', '📈', '🎁', '💰', // Income
    '🍽️', '🚗', '🛍️', '🎬', '📄', // Expense
    '🏥', '📚', '🏠', '💇', '✈️',
    '☕', '🎮', '📱', '🏋️', '🎵',
  ];

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors[0].hex;
    _selectedIcon = _icons[0];
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final request = CreateCategoryRequest(
      name: _nameController.text.trim(),
      type: widget.type,
      color: _selectedColor,
      icon: _selectedIcon,
      parentCategoryId: _parentCategoryId,
    );

    final success = await ref
        .read(categoryViewModelProvider.notifier)
        .createCategory(request);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Category created successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    } else {
      final error = ref.read(categoryViewModelProvider).errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Failed to create category'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryViewModelProvider);
    final categories = widget.type == 'INCOME'
        ? ref.watch(incomeCategoriesDetailedProvider)
        : ref.watch(expenseCategoriesDetailedProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add ${widget.type} Category'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.space16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Category Name
              TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    validator: (value) =>
                        Validators.required(value, fieldName: 'Category name'),
                    decoration: const InputDecoration(
                      labelText: 'Category Name',
                      hintText: 'e.g., Groceries',
                      prefixIcon: Icon(Icons.edit_outlined),
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 600.ms)
                  .slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space24),

              // Parent Category (Optional)
              if (categories.isNotEmpty) ...[
                DropdownButtonFormField<String>(
                      initialValue: _parentCategoryId,
                      decoration: const InputDecoration(
                        labelText: 'Parent Category (Optional)',
                        hintText: 'Select parent category',
                        prefixIcon: Icon(Icons.folder_outlined),
                      ),
                      items: [
                        const DropdownMenuItem(
                          value: null,
                          child: Text('None (Top Level)'),
                        ),
                        ...categories.map((cat) {
                          return DropdownMenuItem(
                            value: cat.id,
                            child: Text(cat.name),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _parentCategoryId = value;
                        });
                      },
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideX(begin: -0.2, end: 0),
                const SizedBox(height: AppDimensions.space24),
              ],

              // Color Picker
              Text(
                'Color',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
              const SizedBox(height: AppDimensions.space12),
              Wrap(
                spacing: AppDimensions.space12,
                runSpacing: AppDimensions.space12,
                children: _colors.map((colorOption) {
                  final isSelected = _selectedColor == colorOption.hex;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedColor = colorOption.hex;
                      });
                    },
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusMedium,
                    ),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(
                          int.parse(colorOption.hex.replaceFirst('#', '0xFF')),
                        ),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMedium,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.grey900
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: isSelected
                          ? const Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }).toList(),
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

              const SizedBox(height: AppDimensions.space24),

              // Icon Picker
              Text(
                'Icon',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
              const SizedBox(height: AppDimensions.space12),
              Wrap(
                spacing: AppDimensions.space8,
                runSpacing: AppDimensions.space8,
                children: _icons.map((icon) {
                  final isSelected = _selectedIcon == icon;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withValues(alpha: 0.1)
                            : AppColors.grey100,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMedium,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.grey200,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(icon, style: const TextStyle(fontSize: 24)),
                      ),
                    ),
                  );
                }).toList(),
              ).animate().fadeIn(delay: 600.ms, duration: 600.ms),

              const SizedBox(height: AppDimensions.space32),

              // Submit Button
              ElevatedButton(
                    onPressed: state.isLoading ? null : _handleSubmit,
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          )
                        : const Text('Create Category'),
                  )
                  .animate()
                  .fadeIn(delay: 700.ms, duration: 600.ms)
                  .slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryColorOption {
  final String name;
  final String hex;

  CategoryColorOption(this.name, this.hex);
}
