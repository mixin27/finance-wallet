import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../core/utils/validators.dart';
import '../../../accounts/data/models/account.dart';
import '../../../accounts/presentation/providers/account_providers.dart';
import '../../../accounts/presentation/viewmodels/account_list_viewmodel.dart';
import '../../data/models/transfer_request.dart';
import '../viewmodels/transaction_form_viewmodel.dart';

class TransferPage extends ConsumerStatefulWidget {
  const TransferPage({super.key});

  @override
  ConsumerState<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends ConsumerState<TransferPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _exchangeRateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _noteController = TextEditingController();

  String? _fromAccountId;
  String? _toAccountId;
  DateTime _selectedDate = DateTime.now();

  late AnimationController _swapAnimationController;

  @override
  void initState() {
    super.initState();
    _swapAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Load accounts if not already loaded
    Future.microtask(() {
      final accounts = ref.read(accountsProvider);
      if (accounts.isEmpty) {
        ref.read(accountListViewModelProvider.notifier).loadAccounts();
      }
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _exchangeRateController.dispose();
    _descriptionController.dispose();
    _noteController.dispose();
    _swapAnimationController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_fromAccountId == null) {
      _showError('Please select source account');
      return;
    }

    if (_toAccountId == null) {
      _showError('Please select destination account');
      return;
    }

    if (_fromAccountId == _toAccountId) {
      _showError('Cannot transfer to the same account');
      return;
    }

    // Check if exchange rate is needed
    final accounts = ref.read(accountsProvider);
    final fromAccount = accounts.firstWhere((a) => a.id == _fromAccountId);
    final toAccount = accounts.firstWhere((a) => a.id == _toAccountId);

    double? exchangeRate;
    if (fromAccount.currency.id != toAccount.currency.id) {
      if (_exchangeRateController.text.isEmpty) {
        _showError('Exchange rate is required for different currencies');
        return;
      }
      exchangeRate = double.tryParse(_exchangeRateController.text);
      if (exchangeRate == null || exchangeRate <= 0) {
        _showError('Please enter a valid exchange rate');
        return;
      }
    }

    final request = TransferRequest(
      fromAccountId: _fromAccountId!,
      toAccountId: _toAccountId!,
      amount: double.parse(_amountController.text),
      exchangeRate: exchangeRate,
      transactionDate: _selectedDate,
      description: _descriptionController.text.trim(),
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
    );

    final success = await ref
        .read(transactionFormViewModelProvider.notifier)
        .transfer(request);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transfer completed successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    } else {
      final error = ref.read(transactionFormViewModelProvider).errorMessage;
      _showError(error ?? 'Failed to transfer');
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

  void _swapAccounts() {
    setState(() {
      final temp = _fromAccountId;
      _fromAccountId = _toAccountId;
      _toAccountId = temp;
    });
    _swapAnimationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(transactionFormViewModelProvider);
    final accounts = ref.watch(accountsProvider);

    // Calculate converted amount if applicable
    String? convertedAmountText;
    if (_fromAccountId != null &&
        _toAccountId != null &&
        _amountController.text.isNotEmpty) {
      final fromAccount = accounts.firstWhere((a) => a.id == _fromAccountId);
      final toAccount = accounts.firstWhere((a) => a.id == _toAccountId);

      if (fromAccount.currency.id != toAccount.currency.id &&
          _exchangeRateController.text.isNotEmpty) {
        final amount = double.tryParse(_amountController.text);
        final rate = double.tryParse(_exchangeRateController.text);
        if (amount != null && rate != null) {
          final converted = amount * rate;
          convertedAmountText =
              '≈ ${toAccount.currency.symbol}${converted.toStringAsFixed(2)}';
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: accounts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimensions.space16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Transfer Illustration
                    _buildTransferIllustration(accounts)
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 600.ms)
                        .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1)),

                    const SizedBox(height: AppDimensions.space32),

                    // Amount
                    _buildAmountField()
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppDimensions.space24),

                    // From Account
                    DropdownButtonFormField<String>(
                          initialValue: _fromAccountId,
                          decoration: const InputDecoration(
                            labelText: 'From Account',
                            hintText: 'Select source account',
                            prefixIcon: Icon(
                              Icons.account_balance_wallet_outlined,
                            ),
                          ),
                          validator: (value) => value == null
                              ? 'Please select source account'
                              : null,
                          items: accounts.map((account) {
                            return DropdownMenuItem(
                              value: account.id,
                              child: _buildAccountMenuItem(account),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _fromAccountId = value;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Swap Button
                    Center(
                      child: RotationTransition(
                        turns: Tween<double>(begin: 0, end: 1).animate(
                          CurvedAnimation(
                            parent: _swapAnimationController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: IconButton(
                          onPressed: _swapAccounts,
                          icon: const Icon(Icons.swap_vert),
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.info.withValues(
                              alpha: 0.1,
                            ),
                            padding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppDimensions.space16),

                    // To Account
                    DropdownButtonFormField<String>(
                          initialValue: _toAccountId,
                          decoration: const InputDecoration(
                            labelText: 'To Account',
                            hintText: 'Select destination account',
                            prefixIcon: Icon(Icons.account_balance_wallet),
                          ),
                          validator: (value) => value == null
                              ? 'Please select destination account'
                              : null,
                          items: accounts.map((account) {
                            return DropdownMenuItem(
                              value: account.id,
                              child: _buildAccountMenuItem(account),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _toAccountId = value;
                            });
                          },
                        )
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .slideX(begin: 0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Exchange Rate (if different currencies)
                    if (_fromAccountId != null && _toAccountId != null) ...[
                      if (_isDifferentCurrencies(accounts)) ...[
                        TextFormField(
                              controller: _exchangeRateController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,6}'),
                                ),
                              ],
                              decoration: InputDecoration(
                                labelText: 'Exchange Rate',
                                hintText: '1.0',
                                prefixIcon: const Icon(Icons.currency_exchange),
                                helperText: _getExchangeRateHelper(accounts),
                                helperMaxLines: 2,
                              ),
                              validator: (value) {
                                if (_isDifferentCurrencies(accounts)) {
                                  return Validators.required(
                                    value,
                                    fieldName: 'Exchange rate',
                                  );
                                }
                                return null;
                              },
                            )
                            .animate()
                            .fadeIn(delay: 500.ms, duration: 600.ms)
                            .slideY(begin: 0.2, end: 0),
                        const SizedBox(height: AppDimensions.space16),
                      ],
                      if (convertedAmountText != null) ...[
                        Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.info.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusMedium,
                                ),
                                border: Border.all(
                                  color: AppColors.info.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.info_outline,
                                    color: AppColors.info,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      convertedAmountText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColors.info,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 300.ms)
                            .slideY(begin: -0.1, end: 0),
                        const SizedBox(height: AppDimensions.space16),
                      ],
                    ],

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
                            hintText: 'e.g., Transfer to savings',
                            prefixIcon: Icon(Icons.description_outlined),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Date
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
                        .fadeIn(delay: 700.ms, duration: 600.ms)
                        .slideX(begin: -0.2, end: 0),

                    const SizedBox(height: AppDimensions.space16),

                    // Note
                    TextFormField(
                          controller: _noteController,
                          textInputAction: TextInputAction.done,
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

                    const SizedBox(height: AppDimensions.space32),

                    // Submit Button
                    ElevatedButton(
                          onPressed: state.isLoading ? null : _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.info,
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
                              : const Text(
                                  'Transfer Money',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        )
                        .animate()
                        .fadeIn(delay: 900.ms, duration: 600.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: AppDimensions.space48),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTransferIllustration(List<Account> accounts) {
    final fromAccount = _fromAccountId != null
        ? accounts.firstWhere((a) => a.id == _fromAccountId)
        : null;
    final toAccount = _toAccountId != null
        ? accounts.firstWhere((a) => a.id == _toAccountId)
        : null;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.space24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.info.withValues(alpha: 0.1),
            AppColors.info.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(color: AppColors.info.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAccountCircle(
            fromAccount?.name ?? 'From',
            fromAccount?.currency.symbol ?? '?',
            Icons.account_balance_wallet_outlined,
          ),
          const Icon(Icons.arrow_forward, color: AppColors.info, size: 32)
              .animate(onPlay: (controller) => controller.repeat())
              .slideX(delay: 500.ms, duration: 1500.ms, begin: -0.1, end: 0.1),
          _buildAccountCircle(
            toAccount?.name ?? 'To',
            toAccount?.currency.symbol ?? '?',
            Icons.account_balance_wallet,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountCircle(String name, String symbol, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.info.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.info, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          symbol,
          style: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildAmountField() {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.space20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.info.withValues(alpha: 0.1),
            AppColors.info.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        border: Border.all(
          color: AppColors.info.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transfer Amount',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.info,
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
              color: AppColors.info,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: '0.00',
              hintStyle: TextStyle(
                color: AppColors.info.withValues(alpha: 0.3),
              ),
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.swap_horiz,
                color: AppColors.info,
                size: 32,
              ),
            ),
            onChanged: (value) =>
                setState(() {}), // Trigger rebuild for converted amount
          ),
        ],
      ),
    );
  }

  Widget _buildAccountMenuItem(Account account) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          account.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          '${account.currency.symbol}${account.currentBalance.toStringAsFixed(2)}',
          style: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  bool _isDifferentCurrencies(List<Account> accounts) {
    if (_fromAccountId == null || _toAccountId == null) return false;
    final from = accounts.firstWhere((a) => a.id == _fromAccountId);
    final to = accounts.firstWhere((a) => a.id == _toAccountId);
    return from.currency.id != to.currency.id;
  }

  String _getExchangeRateHelper(List<Account> accounts) {
    if (_fromAccountId == null || _toAccountId == null) return '';
    final from = accounts.firstWhere((a) => a.id == _fromAccountId);
    final to = accounts.firstWhere((a) => a.id == _toAccountId);
    return '1 ${from.currency.code} = X ${to.currency.code}';
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
