import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../../data/models/create_account_request.dart';
import '../providers/account_providers.dart';
import '../viewmodels/account_form_viewmodel.dart';

class AddAccountPage extends ConsumerStatefulWidget {
  const AddAccountPage({super.key});

  @override
  ConsumerState<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends ConsumerState<AddAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _initialBalanceController = TextEditingController(text: '0');

  String? _selectedAccountTypeId;
  String? _selectedCurrencyId;
  String? _selectedColor;
  bool _isIncludedInTotal = true;

  final List<AccountColor> _colors = [
    AccountColor('Primary', '#6366F1'),
    AccountColor('Green', '#10B981'),
    AccountColor('Orange', '#F59E0B'),
    AccountColor('Red', '#EF4444'),
    AccountColor('Purple', '#8B5CF6'),
    AccountColor('Pink', '#EC4899'),
    AccountColor('Teal', '#14B8A6'),
    AccountColor('Amber', '#F97316'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors[0].hex;
    // Load form data
    Future.microtask(() {
      ref.read(accountFormViewModelProvider.notifier).loadFormData();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _initialBalanceController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedAccountTypeId == null) {
      _showError('Please select an account type');
      return;
    }

    if (_selectedCurrencyId == null) {
      _showError('Please select a currency');
      return;
    }

    final request = CreateAccountRequest(
      name: _nameController.text.trim(),
      accountTypeId: _selectedAccountTypeId!,
      currencyId: _selectedCurrencyId!,
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      initialBalance: double.parse(_initialBalanceController.text),
      color: _selectedColor,
      isIncludedInTotal: _isIncludedInTotal,
    );

    final success = await ref
        .read(accountFormViewModelProvider.notifier)
        .createAccount(request);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    } else {
      final error = ref.read(accountFormViewModelProvider).errorMessage;
      _showError(error ?? 'Failed to create account');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountFormViewModelProvider);
    final accountTypes = ref.watch(accountTypesProvider);
    final currencies = ref.watch(currenciesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Account'),
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
                    // Account Name
                    TextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) => Validators.required(
                            value,
                            fieldName: 'Account name',
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Account Name',
                            hintText: 'e.g., Main Bank Account',
                            prefixIcon: Icon(Icons.edit_outlined),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Account Type Dropdown
                    DropdownButtonFormField<String>(
                          initialValue: _selectedAccountTypeId,
                          decoration: const InputDecoration(
                            labelText: 'Account Type',
                            hintText: 'Select account type',
                            prefixIcon: Icon(Icons.category_outlined),
                          ),
                          validator: (value) => value == null
                              ? 'Please select account type'
                              : null,
                          items: accountTypes.map((type) {
                            return DropdownMenuItem(
                              value: type.id,
                              child: Text(type.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedAccountTypeId = value;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Currency Dropdown
                    DropdownButtonFormField<String>(
                          initialValue: _selectedCurrencyId,
                          decoration: const InputDecoration(
                            labelText: 'Currency',
                            hintText: 'Select currency',
                            prefixIcon: Icon(Icons.currency_exchange),
                          ),
                          validator: (value) =>
                              value == null ? 'Please select currency' : null,
                          items: currencies.map((currency) {
                            return DropdownMenuItem(
                              value: currency.id,
                              child: Text(
                                '${currency.code} (${currency.symbol})',
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCurrencyId = value;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Initial Balance
                    TextFormField(
                          controller: _initialBalanceController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textInputAction: TextInputAction.next,
                          validator: Validators.amount,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Initial Balance',
                            hintText: '0.00',
                            prefixIcon: Icon(Icons.attach_money),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Description (Optional)
                    TextFormField(
                          controller: _descriptionController,
                          textInputAction: TextInputAction.done,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'Description (Optional)',
                            hintText: 'Add notes about this account',
                            prefixIcon: Icon(Icons.notes_outlined),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space24),

                    // Color Picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Color',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: AppDimensions.space12),
                        Wrap(
                          spacing: AppDimensions.space12,
                          runSpacing: AppDimensions.space12,
                          children: _colors.map((color) {
                            final isSelected = _selectedColor == color.hex;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color.hex;
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
                                    int.parse(
                                      color.hex.replaceFirst('#', '0xFF'),
                                    ),
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
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ).animate().fadeIn(delay: 600.ms, duration: 600.ms),

                    const SizedBox(height: AppDimensions.space24),

                    // Include in Total Toggle
                    Card(
                      child: SwitchListTile(
                        value: _isIncludedInTotal,
                        onChanged: (value) {
                          setState(() {
                            _isIncludedInTotal = value;
                          });
                        },
                        title: const Text('Include in Total Balance'),
                        subtitle: const Text(
                          'Include this account when calculating total balance',
                        ),
                        activeThumbColor: AppColors.primary,
                      ),
                    ).animate().fadeIn(delay: 700.ms, duration: 600.ms),

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
                              : const Text('Create Account'),
                        )
                        .animate()
                        .fadeIn(delay: 800.ms, duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppDimensions.space48),
                  ],
                ),
              ),
            ),
    );
  }
}

class AccountColor {
  final String name;
  final String hex;

  AccountColor(this.name, this.hex);
}
