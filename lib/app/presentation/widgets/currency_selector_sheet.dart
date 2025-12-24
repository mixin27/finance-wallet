import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../features/currencies/presentation/providers/currency_providers.dart';
import '../../../../features/user_preferences/data/models/update_user_preference_request.dart';
import '../../../../features/user_preferences/presentation/viewmodels/user_preference_viewmodel.dart';

class CurrencySelectorSheet extends ConsumerWidget {
  const CurrencySelectorSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currenciesAsync = ref.watch(currenciesFutureProvider);
    final currentPreference = ref
        .watch(userPreferenceViewModelProvider)
        .userPreference;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.space16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: AppDimensions.space16),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'Select Currency',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppDimensions.space16),
          currenciesAsync.when(
            data: (currencies) => Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  final isSelected =
                      currency.id == currentPreference?.defaultCurrencyId;

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isSelected
                          ? AppColors.primary
                          : Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.1),
                      child: Text(
                        currency.symbol,
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.9),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      currency.name,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Text(currency.code),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                          )
                        : null,
                    onTap: () async {
                      final success = await ref
                          .read(userPreferenceViewModelProvider.notifier)
                          .updateUserPreference(
                            UpdateUserPreferenceRequest(
                              defaultCurrencyId: currency.id,
                            ),
                          );
                      if (success && context.mounted) {
                        Navigator.pop(context, true);
                      }
                    },
                  );
                },
              ),
            ),
            loading: () => Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.space16,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.radiusLarge),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [CircularProgressIndicator()],
              ),
            ),
            error: (error, _) => Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.space16,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.radiusLarge),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text('Error: $error')],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.space16),
        ],
      ),
    );
  }

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CurrencySelectorSheet(),
    );
  }
}
