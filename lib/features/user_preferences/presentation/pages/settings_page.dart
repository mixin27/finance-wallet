import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/providers/biometric_providers.dart';
import '../../data/models/update_user_preference_request.dart';
import '../viewmodels/user_preference_viewmodel.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(userPreferenceViewModelProvider.notifier)
          .loadUserPreferences(),
    );
  }

  void _updatePreference(UpdateUserPreferenceRequest request) {
    ref
        .read(userPreferenceViewModelProvider.notifier)
        .updateUserPreference(request);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userPreferenceViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.userPreference == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load preferences'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref
                        .read(userPreferenceViewModelProvider.notifier)
                        .loadUserPreferences(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                _buildSectionHeader(context, 'General'),
                _buildListTile(
                  context,
                  'Language',
                  _getLanguageName(state.userPreference!.language),
                  Icons.language,
                  () => _showLanguagePicker(
                    context,
                    state.userPreference!.language,
                  ),
                ),
                _buildListTile(
                  context,
                  'Date Format',
                  state.userPreference!.dateFormat,
                  Icons.date_range,
                  () => _showDateFormatPicker(
                    context,
                    state.userPreference!.dateFormat,
                  ),
                ),
                _buildListTile(
                  context,
                  'First Day of Week',
                  _getFirstDayName(state.userPreference!.firstDayOfWeek),
                  Icons.calendar_view_week,
                  () => _showFirstDayPicker(
                    context,
                    state.userPreference!.firstDayOfWeek,
                  ),
                ),
                _buildListTile(
                  context,
                  'Timezone',
                  state.userPreference!.timezone,
                  Icons.public,
                  () => _showTimezonePicker(
                    context,
                    state.userPreference!.timezone,
                  ),
                ),

                const Divider(),
                _buildSectionHeader(context, 'Appearance'),
                _buildListTile(
                  context,
                  'Theme',
                  _getThemeName(state.userPreference!.theme),
                  Icons.palette_outlined,
                  () => _showThemePicker(context, state.userPreference!.theme),
                ),

                const Divider(),
                _buildSectionHeader(context, 'Notifications & Privacy'),
                SwitchListTile(
                  title: const Text('Enable Notifications'),
                  subtitle: const Text('Receive alerts and reminders'),
                  value: state.userPreference!.enableNotifications,
                  secondary: const Icon(Icons.notifications_outlined),
                  onChanged: (value) => _updatePreference(
                    UpdateUserPreferenceRequest(enableNotifications: value),
                  ),
                ),
                SwitchListTile(
                  title: const Text('Biometric Lock'),
                  subtitle: const Text('Use Fingerprint or Face ID'),
                  value: state.userPreference!.enableBiometric,
                  secondary: const Icon(Icons.fingerprint),
                  onChanged: (value) async {
                    if (value) {
                      // Request biometric authentication when enabling
                      final isAvailable = await ref.read(
                        isBiometricAvailableProvider.future,
                      );
                      if (!isAvailable) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Biometric authentication is not available on this device',
                              ),
                            ),
                          );
                        }
                        return;
                      }

                      final authenticated = await ref
                          .read(biometricServiceProvider)
                          .authenticate(
                            localizedReason:
                                'Please authenticate to enable Biometric Lock',
                          );

                      if (authenticated) {
                        _updatePreference(
                          UpdateUserPreferenceRequest(enableBiometric: true),
                        );
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Authentication failed'),
                            ),
                          );
                        }
                      }
                    } else {
                      // Disabling doesn't require authentication
                      _updatePreference(
                        UpdateUserPreferenceRequest(enableBiometric: false),
                      );
                    }
                  },
                ),
                SwitchListTile(
                  title: const Text('Auto Backup'),
                  subtitle: const Text('Cloud backup your data'),
                  value: state.userPreference!.autoBackup,
                  secondary: const Icon(Icons.cloud_upload_outlined),
                  onChanged: (value) => _updatePreference(
                    UpdateUserPreferenceRequest(autoBackup: value),
                  ),
                ),

                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.space16),
                  child: OutlinedButton(
                    onPressed: () => _confirmReset(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                    ),
                    child: const Text('Reset to Defaults'),
                  ),
                ),

                if (state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(AppDimensions.space16),
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: AppColors.error),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String title,
    String trailing,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      ),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trailing,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  String _getLanguageName(String code) {
    final languages = {
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'pt': 'Portuguese',
      'zh': 'Chinese',
      'ja': 'Japanese',
      'ko': 'Korean',
      'ar': 'Arabic',
    };
    return languages[code] ?? code;
  }

  String _getThemeName(String theme) {
    switch (theme) {
      case 'LIGHT':
        return 'Light';
      case 'DARK':
        return 'Dark';
      case 'SYSTEM':
        return 'System';
      default:
        return theme;
    }
  }

  String _getFirstDayName(int day) {
    final days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    if (day >= 0 && day < days.length) return days[day];
    return day.toString();
  }

void _showLanguagePicker(BuildContext context, String current) {
    final languages = [
      {'code': 'en', 'name': 'English'},
      {'code': 'es', 'name': 'Spanish'},
      {'code': 'fr', 'name': 'French'},
      {'code': 'de', 'name': 'German'},
    ];

    _showPicker(
      context,
      'Select Language',
      languages.map((l) => l['name']!).toList(),
      (index) {
        _updatePreference(
          UpdateUserPreferenceRequest(language: languages[index]['code']),
        );
      },
      languages.indexWhere((l) => l['code'] == current),
    );
  }

  void _showDateFormatPicker(BuildContext context, String current) {
    final formats = [
      'DD/MM/YYYY',
      'MM/DD/YYYY',
      'YYYY-MM-DD',
      'DD.MM.YYYY',
      'DD-MM-YYYY',
    ];
    _showPicker(context, 'Select Date Format', formats, (index) {
      _updatePreference(
        UpdateUserPreferenceRequest(dateFormat: formats[index]),
      );
    }, formats.indexOf(current));
  }

  void _showThemePicker(BuildContext context, String current) {
    final themes = ['LIGHT', 'DARK', 'SYSTEM'];
    _showPicker(context, 'Select Theme', ['Light', 'Dark', 'System'], (index) {
      _updatePreference(UpdateUserPreferenceRequest(theme: themes[index]));
    }, themes.indexOf(current));
  }

  void _showFirstDayPicker(BuildContext context, int current) {
    final days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    _showPicker(context, 'First Day of Week', days, (index) {
      _updatePreference(UpdateUserPreferenceRequest(firstDayOfWeek: index));
    }, current);
  }

  void _showTimezonePicker(BuildContext context, String current) {
    final timezones = [
      'UTC',
      'GMT',
      'EST',
      'CST',
      'MST',
      'PST',
      'Asia/Rangoon',
      'Asia/Singapore',
      'Asia/Tokyo',
      'Asia/Dubai',
      'Europe/London',
      'Europe/Paris',
      'America/New_York',
      'America/Los_Angeles',
      'America/Chicago',
      'Australia/Sydney',
    ];
    _showPicker(context, 'Select Timezone', timezones, (index) {
      _updatePreference(
        UpdateUserPreferenceRequest(timezone: timezones[index]),
      );
    }, timezones.indexOf(current));
  }

  void _showPicker(
    BuildContext context,
    String title,
    List<String> options,
    Function(int) onSelected,
    int currentIndex,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == currentIndex;
                    return ListTile(
                      title: Text(
                        options[index],
                        style: TextStyle(
                          color: isSelected ? AppColors.primary : null,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check, color: AppColors.primary)
                          : null,
                      onTap: () {
                        onSelected(index);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _confirmReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Settings'),
        content: const Text(
          'Are you sure you want to reset all settings to defaults?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(userPreferenceViewModelProvider.notifier)
                  .resetToDefaults();
              Navigator.pop(context);
            },
            child: const Text(
              'Reset',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}
