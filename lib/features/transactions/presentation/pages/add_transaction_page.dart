import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../accounts/presentation/providers/account_providers.dart';
import '../../../accounts/presentation/viewmodels/account_list_viewmodel.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../../data/models/create_transaction_request.dart';
import '../viewmodels/transaction_form_viewmodel.dart';

class AddTransactionPage extends ConsumerStatefulWidget {
  const AddTransactionPage({super.key});

  @override
  ConsumerState<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends ConsumerState<AddTransactionPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  final _payeeController = TextEditingController();
  final _tagsController = TextEditingController();

  String _selectedType = 'EXPENSE';
  String? _selectedAccountId;
  String? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();

  late AnimationController _typeAnimationController;

  @override
  void initState() {
    super.initState();
    _typeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Load form data
    Future.microtask(() {
      ref.read(transactionFormViewModelProvider.notifier).loadCategories();
      // Load accounts if not already loaded
      final accounts = ref.read(accountsProvider);
      if (accounts.isEmpty) {
        ref.read(accountListViewModelProvider.notifier).loadAccounts();
      }
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    _payeeController.dispose();
    _tagsController.dispose();
    _typeAnimationController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedAccountId == null) {
      _showError('Please select an account');
      return;
    }

    // Parse tags
    final tags = _tagsController.text
        .split(' ')
        .where((t) => t.isNotEmpty)
        .map((t) => t.replaceAll('#', ''))
        .toList();

    final request = CreateTransactionRequest(
      accountId: _selectedAccountId!,
      type: _selectedType,
      amount: double.parse(_amountController.text),
      categoryId: _selectedCategoryId,
      transactionDate: _selectedDate,
      description: _descriptionController.text.trim(),
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
      payee: _payeeController.text.trim().isEmpty
          ? null
          : _payeeController.text.trim(),
      tags: tags.isEmpty ? null : tags,
    );

    final success = await ref
        .read(transactionFormViewModelProvider.notifier)
        .createTransaction(request);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transaction created successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    } else {
      final error = ref.read(transactionFormViewModelProvider).errorMessage;
      _showError(error ?? 'Failed to create transaction');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionFormViewModelProvider);
    final accounts = ref.watch(accountsProvider);
    final categories = _selectedType == 'INCOME'
        ? ref.watch(incomeCategoriesDetailedProvider)
        : ref.watch(expenseCategoriesDetailedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: state.isLoadingData
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.space16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Type Selector
                    _buildTypeSelector()
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 600.ms)
                        .slideY(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space24),

                    // Amount (Big and Bold)
                    _buildAmountField()
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1)),

                    const SizedBox(height: AppDimensions.space24),

                    // Account Selection
                    DropdownButtonFormField<String>(
                          initialValue: _selectedAccountId,
                          decoration: const InputDecoration(
                            labelText: 'Account',
                            hintText: 'Select account',
                            prefixIcon: Icon(
                              Icons.account_balance_wallet_outlined,
                            ),
                          ),
                          validator: (value) =>
                              value == null ? 'Please select account' : null,
                          items: accounts.map((account) {
                            return DropdownMenuItem(
                              value: account.id,
                              child: Text(
                                '${account.name} (${account.currency.symbol}${account.currentBalance.toStringAsFixed(2)})',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedAccountId = value;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Category Selection
                    DropdownButtonFormField<String>(
                          initialValue: _selectedCategoryId,
                          decoration: InputDecoration(
                            labelText: 'Category (Optional)',
                            hintText: 'Select category',
                            prefixIcon: const Icon(Icons.category_outlined),
                            suffixIcon: _selectedCategoryId != null
                                ? IconButton(
                                    icon: const Icon(Icons.clear, size: 20),
                                    onPressed: () {
                                      setState(() {
                                        _selectedCategoryId = null;
                                      });
                                    },
                                  )
                                : null,
                          ),
                          items: categories.map((category) {
                            return DropdownMenuItem(
                              value: category.id,
                              child: Text(category.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategoryId = value;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Description
                    TextFormField(
                          controller: _descriptionController,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          validator: (value) => Validators.required(
                            value,
                            fieldName: 'Description',
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Description',
                            hintText: 'e.g., Lunch at restaurant',
                            prefixIcon: Icon(Icons.description_outlined),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Date Picker
                    InkWell(
                          onTap: _selectDate,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMedium,
                          ),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Date',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            child: Text(
                              _formatDate(_selectedDate),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Payee (Optional)
                    TextFormField(
                          controller: _payeeController,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Payee (Optional)',
                            hintText: 'Who did you pay?',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 700.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Note (Optional)
                    TextFormField(
                          controller: _noteController,
                          textInputAction: TextInputAction.next,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Note (Optional)',
                            hintText: 'Add additional details',
                            prefixIcon: Icon(Icons.notes_outlined),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 800.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Tags
                    TextFormField(
                          controller: _tagsController,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Tags (Optional)',
                            hintText: '#food #lunch #restaurant',
                            prefixIcon: Icon(Icons.tag),
                            helperText: 'Separate tags with spaces',
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 900.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space32),

                    // Submit Button
                    ElevatedButton(
                          onPressed: state.isLoading ? null : _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: _selectedType == 'INCOME'
                                ? AppColors.success
                                : AppColors.error,
                          ),
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
                              : Text(
                                  'Add ${_selectedType == 'INCOME' ? 'Income' : 'Expense'}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        )
                        .animate()
                        .fadeIn(delay: 1000.ms, duration: 600.ms)
                        .slideY(begin: 0.2, end: 0)
                        .then()
                        .shimmer(
                          delay: 1500.ms,
                          duration: 1500.ms,
                          color: Colors.white.withValues(alpha: 0.3),
                        ),

                    const SizedBox(height: AppDimensions.space48),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTypeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeButton(
              label: 'Income',
              icon: Icons.add_circle_outline,
              isSelected: _selectedType == 'INCOME',
              color: AppColors.success,
              onTap: () {
                setState(() {
                  _selectedType = 'INCOME';
                  _selectedCategoryId = null; // Reset category
                });
                _typeAnimationController.forward(from: 0);
              },
            ),
          ),
          Expanded(
            child: _buildTypeButton(
              label: 'Expense',
              icon: Icons.remove_circle_outline,
              isSelected: _selectedType == 'EXPENSE',
              color: AppColors.error,
              onTap: () {
                setState(() {
                  _selectedType = 'EXPENSE';
                  _selectedCategoryId = null; // Reset category
                });
                _typeAnimationController.forward(from: 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Colors.white
                  : Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
              size: 22,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    final color = _selectedType == 'INCOME'
        ? AppColors.success
        : AppColors.error;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.space20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amount',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            validator: Validators.amount,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: '0.00',
              hintStyle: TextStyle(color: color.withValues(alpha: 0.3)),
              border: InputBorder.none,
              prefixIcon: Icon(
                _selectedType == 'INCOME' ? Icons.add : Icons.remove,
                color: color,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return 'Today';
    } else if (dateToCheck == yesterday) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
