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
import '../../../currencies/presentation/providers/currency_providers.dart';
import '../../data/models/create_goal_request.dart';
import '../viewmodels/goal_viewmodel.dart';

class AddGoalPage extends ConsumerStatefulWidget {
  const AddGoalPage({super.key});

  @override
  ConsumerState<AddGoalPage> createState() => _AddGoalPageState();
}

class _AddGoalPageState extends ConsumerState<AddGoalPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _targetAmountController = TextEditingController();
  final _initialAmountController = TextEditingController(text: '0');

  DateTime _targetDate = DateTime.now().add(const Duration(days: 365));
  String? _selectedCurrencyId;
  String? _selectedAccountId;
  String _selectedColor = '#4CAF50';
  String _selectedIcon = '💰';

  final List<GoalColorOption> _colors = [
    GoalColorOption('Green', '#4CAF50'),
    GoalColorOption('Blue', '#2196F3'),
    GoalColorOption('Orange', '#FF9800'),
    GoalColorOption('Purple', '#9C27B0'),
    GoalColorOption('Pink', '#E91E63'),
    GoalColorOption('Teal', '#009688'),
    GoalColorOption('Red', '#F44336'),
    GoalColorOption('Amber', '#FFC107'),
  ];

  final List<String> _icons = [
    '💰',
    '🏠',
    '🚗',
    '✈️',
    '💻',
    '📱',
    '🎓',
    '💍',
    '🎮',
    '📷',
    '🎸',
    '🏋️',
    '🌴',
    '🎯',
    '🎁',
    '⚽',
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final accounts = ref.read(accountsProvider);
      if (accounts.isEmpty) {
        ref.read(accountListViewModelProvider.notifier).loadAccounts();
      }
      final currencies = ref.read(currenciesProvider);
      if (currencies.isNotEmpty) {
        setState(() {
          _selectedCurrencyId = currencies.first.id;
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _targetAmountController.dispose();
    _initialAmountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _targetDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)), // 10 years
    );

    if (picked != null) {
      setState(() {
        _targetDate = picked;
      });
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedCurrencyId == null) {
      _showError('Please select a currency');
      return;
    }

    final request = CreateGoalRequest(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      targetAmount: double.parse(_targetAmountController.text),
      initialAmount: double.tryParse(_initialAmountController.text),
      targetDate: _targetDate,
      currencyId: _selectedCurrencyId!,
      accountId: _selectedAccountId,
      color: _selectedColor,
      icon: _selectedIcon,
    );

    final success = await ref
        .read(goalViewModelProvider.notifier)
        .createGoal(request);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Goal created successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    } else {
      final error = ref.read(goalViewModelProvider).errorMessage;
      _showError(error ?? 'Failed to create goal');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(goalViewModelProvider);
    final currencies = ref.watch(currenciesProvider);
    final accounts = ref.watch(accountsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Goal'),
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
              // Goal Name
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                validator: (value) =>
                    Validators.required(value, fieldName: 'Goal name'),
                decoration: const InputDecoration(
                  labelText: 'Goal Name',
                  hintText: 'e.g., Emergency Fund',
                  prefixIcon: Icon(Icons.flag_outlined),
                ),
              ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space16),

              // Description
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  hintText: 'What is this goal for?',
                  prefixIcon: Icon(Icons.description_outlined),
                ),
              ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space16),

              // Target Amount
              TextFormField(
                controller: _targetAmountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: Validators.amount,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Target Amount',
                  hintText: '0.00',
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space16),

              // Initial Amount
              TextFormField(
                controller: _initialAmountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: Validators.amount,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Initial Amount (Optional)',
                  hintText: '0.00',
                  prefixIcon: Icon(Icons.savings_outlined),
                  helperText: 'If you already have some savings',
                ),
              ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space16),

              // Currency
              if (currencies.isNotEmpty)
                DropdownButtonFormField<String>(
                  initialValue: _selectedCurrencyId,
                  decoration: const InputDecoration(
                    labelText: 'Currency',
                    prefixIcon: Icon(Icons.currency_exchange),
                  ),
                  validator: (value) =>
                      value == null ? 'Please select currency' : null,
                  items: currencies.map((currency) {
                    return DropdownMenuItem(
                      value: currency.id,
                      child: Text('${currency.code} (${currency.symbol})'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrencyId = value;
                    });
                  },
                ).animate().fadeIn(delay: 500.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space16),

              // Link to Account (Optional)
              if (accounts.isNotEmpty)
                DropdownButtonFormField<String>(
                  initialValue: _selectedAccountId,
                  decoration: const InputDecoration(
                    labelText: 'Link to Account (Optional)',
                    prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                  ),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('None')),
                    ...accounts.map((account) {
                      return DropdownMenuItem(
                        value: account.id,
                        child: Text(account.name),
                      );
                    }),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedAccountId = value;
                    });
                  },
                ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space16),

              // Target Date
              InkWell(
                onTap: _selectDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Target Date',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    '${_targetDate.day}/${_targetDate.month}/${_targetDate.year}',
                  ),
                ),
              ).animate().fadeIn(delay: 700.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: AppDimensions.space24),

              // Icon Selector
              Text(
                'Icon',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fadeIn(delay: 800.ms),
              const SizedBox(height: AppDimensions.space12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _icons.map((icon) {
                  final isSelected = _selectedIcon == icon;
                  return InkWell(
                    onTap: () => setState(() => _selectedIcon = icon),
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
              ).animate().fadeIn(delay: 900.ms),

              const SizedBox(height: AppDimensions.space24),

              // Color Selector
              Text(
                'Color',
                style: Theme.of(context).textTheme.titleMedium,
              ).animate().fadeIn(delay: 1000.ms),
              const SizedBox(height: AppDimensions.space12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _colors.map((colorOption) {
                  final isSelected = _selectedColor == colorOption.hex;
                  return InkWell(
                    onTap: () =>
                        setState(() => _selectedColor = colorOption.hex),
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
              ).animate().fadeIn(delay: 1100.ms),

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
                    : const Text('Create Goal'),
              ).animate().fadeIn(delay: 1200.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalColorOption {
  final String name;
  final String hex;
  GoalColorOption(this.name, this.hex);
}
