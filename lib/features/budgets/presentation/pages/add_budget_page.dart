import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../../../categories/presentation/viewmodels/category_viewmodel.dart';
import '../../../currencies/presentation/providers/currency_providers.dart';
import '../../data/models/create_budget_request.dart';
import '../viewmodels/budget_viewmodel.dart';

class AddBudgetPage extends ConsumerStatefulWidget {
  const AddBudgetPage({super.key});

  @override
  ConsumerState<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends ConsumerState<AddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _alertThresholdController = TextEditingController(text: '80');

  String _selectedPeriod = 'MONTHLY';
  DateTime _startDate = DateTime.now();
  DateTime? _endDate;
  String? _selectedCurrencyId;
  String? _selectedCategoryId;

  final List<String> _periods = [
    'DAILY',
    'WEEKLY',
    'MONTHLY',
    'YEARLY',
    'CUSTOM',
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final currencies = ref.read(currenciesProvider);
      if (currencies.isNotEmpty) {
        setState(() => _selectedCurrencyId = currencies.first.id);
      }
      ref
          .read(categoryViewModelProvider.notifier)
          .loadCategories(type: 'EXPENSE');
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _alertThresholdController.dispose();
    super.dispose();
  }

  Future<void> _selectStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => _startDate = picked);
  }

  Future<void> _selectEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate.add(const Duration(days: 30)),
      firstDate: _startDate,
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => _endDate = picked);
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedCurrencyId == null) {
      _showError('Please select a currency');
      return;
    }
    if (_selectedPeriod == 'CUSTOM' && _endDate == null) {
      _showError('Please select end date for custom period');
      return;
    }

    final request = CreateBudgetRequest(
      name: _nameController.text.trim(),
      amount: double.parse(_amountController.text),
      period: _selectedPeriod,
      startDate: _startDate,
      endDate: _selectedPeriod == 'CUSTOM' ? _endDate : null,
      currencyId: _selectedCurrencyId!,
      categoryId: _selectedCategoryId,
      alertThreshold: double.tryParse(_alertThresholdController.text),
    );

    final success = await ref
        .read(budgetViewModelProvider.notifier)
        .createBudget(request);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Budget created successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    } else {
      final error = ref.read(budgetViewModelProvider).errorMessage;
      _showError(error ?? 'Failed to create budget');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(budgetViewModelProvider);
    final currencies = ref.watch(currenciesProvider);
    final categories = ref.watch(expenseCategoriesDetailedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Budget'),
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
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                validator: (value) =>
                    Validators.required(value, fieldName: 'Budget name'),
                decoration: const InputDecoration(
                  labelText: 'Budget Name',
                  hintText: 'e.g., Monthly Expenses',
                  prefixIcon: Icon(Icons.label_outline),
                ),
              ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: 16),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: Validators.amount,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Budget Amount',
                  hintText: '0.00',
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: _selectedPeriod,
                decoration: const InputDecoration(
                  labelText: 'Period',
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                items: _periods.map((period) {
                  return DropdownMenuItem(value: period, child: Text(period));
                }).toList(),
                onChanged: (value) => setState(() => _selectedPeriod = value!),
              ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: 16),

              InkWell(
                onTap: _selectStartDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Start Date',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    '${_startDate.day}/${_startDate.month}/${_startDate.year}',
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2, end: 0),

              if (_selectedPeriod == 'CUSTOM') ...[
                const SizedBox(height: 16),
                InkWell(
                  onTap: _selectEndDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'End Date',
                      prefixIcon: Icon(Icons.event),
                    ),
                    child: Text(
                      _endDate != null
                          ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                          : 'Select end date',
                    ),
                  ),
                ).animate().fadeIn(delay: 500.ms).slideX(begin: -0.2, end: 0),
              ],

              const SizedBox(height: 16),

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
                  onChanged: (value) =>
                      setState(() => _selectedCurrencyId = value),
                ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: _selectedCategoryId,
                decoration: const InputDecoration(
                  labelText: 'Category (Optional)',
                  prefixIcon: Icon(Icons.category_outlined),
                  helperText: 'Leave empty for all expenses',
                ),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('All Expenses'),
                  ),
                  ...categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat.id,
                      child: Text(cat.name),
                    );
                  }),
                ],
                onChanged: (value) =>
                    setState(() => _selectedCategoryId = value),
              ).animate().fadeIn(delay: 700.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: 16),

              TextFormField(
                controller: _alertThresholdController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Alert Threshold (%)',
                  hintText: '80',
                  prefixIcon: Icon(Icons.notifications_outlined),
                  helperText: 'Get alerted when budget reaches this %',
                ),
              ).animate().fadeIn(delay: 800.ms).slideX(begin: -0.2, end: 0),

              const SizedBox(height: 32),

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
                    : const Text('Create Budget'),
              ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
