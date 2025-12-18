# Flutter Project Structure - MVVM Architecture

Following Flutter's official architecture guide with MVVM pattern.

```
lib/
├── main.dart                           # App entry point
│
├── app/
│   ├── app.dart                       # Main app widget with routing
│   └── theme/
│       ├── app_theme.dart            # Theme configuration
│       ├── app_colors.dart           # Color palette
│       ├── app_text_styles.dart      # Typography
│       └── app_dimensions.dart       # Spacing & sizes
│
├── core/
│   ├── config/
│   │   └── api_config.dart           # API base URL & config
│   ├── constants/
│   │   ├── app_constants.dart        # App-wide constants
│   │   └── storage_keys.dart         # Storage key constants
│   ├── network/
│   │   ├── api_client.dart           # Dio client setup
│   │   ├── api_interceptor.dart      # Auth interceptor
│   │   └── api_response.dart         # Generic API response
│   ├── storage/
│   │   ├── secure_storage.dart       # Secure storage wrapper
│   │   └── preferences.dart          # Shared preferences wrapper
│   ├── utils/
│   │   ├── date_formatter.dart       # Date formatting utilities
│   │   ├── currency_formatter.dart   # Currency formatting
│   │   └── validators.dart           # Form validators
│   └── errors/
│       ├── exceptions.dart            # Custom exceptions
│       └── failure.dart               # Failure models
│
├── features/
│   │
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── login_request.dart
│   │   │   │   ├── register_request.dart
│   │   │   │   ├── auth_response.dart
│   │   │   │   └── user.dart
│   │   │   ├── datasources/
│   │   │   │   └── auth_remote_datasource.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository.dart
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   │   └── auth_provider.dart
│   │   │   ├── viewmodels/
│   │   │   │   ├── login_viewmodel.dart
│   │   │   │   └── register_viewmodel.dart
│   │   │   ├── pages/
│   │   │   │   ├── login_page.dart
│   │   │   │   ├── register_page.dart
│   │   │   │   └── splash_page.dart
│   │   │   └── widgets/
│   │   │       ├── custom_text_field.dart
│   │   │       └── auth_button.dart
│   │
│   ├── accounts/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── account.dart
│   │   │   │   ├── account_type.dart
│   │   │   │   └── account_summary.dart
│   │   │   ├── datasources/
│   │   │   │   └── account_remote_datasource.dart
│   │   │   └── repositories/
│   │   │       └── account_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── account_entity.dart
│   │   │   └── repositories/
│   │   │       └── account_repository.dart
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   │   └── account_provider.dart
│   │   │   ├── viewmodels/
│   │   │   │   ├── account_list_viewmodel.dart
│   │   │   │   └── account_form_viewmodel.dart
│   │   │   ├── pages/
│   │   │   │   ├── accounts_page.dart
│   │   │   │   ├── account_detail_page.dart
│   │   │   │   └── add_account_page.dart
│   │   │   └── widgets/
│   │   │       ├── account_card.dart
│   │   │       └── account_form.dart
│   │
│   ├── transactions/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── transaction.dart
│   │   │   │   ├── transaction_filter.dart
│   │   │   │   └── category.dart
│   │   │   ├── datasources/
│   │   │   │   └── transaction_remote_datasource.dart
│   │   │   └── repositories/
│   │   │       └── transaction_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── transaction_entity.dart
│   │   │   └── repositories/
│   │   │       └── transaction_repository.dart
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   │   └── transaction_provider.dart
│   │   │   ├── viewmodels/
│   │   │   │   ├── transaction_list_viewmodel.dart
│   │   │   │   └── transaction_form_viewmodel.dart
│   │   │   ├── pages/
│   │   │   │   ├── transactions_page.dart
│   │   │   │   ├── transaction_detail_page.dart
│   │   │   │   ├── add_transaction_page.dart
│   │   │   │   └── transfer_page.dart
│   │   │   └── widgets/
│   │   │       ├── transaction_card.dart
│   │   │       ├── transaction_form.dart
│   │   │       └── transaction_filter_sheet.dart
│   │
│   ├── dashboard/
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   │   └── dashboard_provider.dart
│   │   │   ├── viewmodels/
│   │   │   │   └── dashboard_viewmodel.dart
│   │   │   ├── pages/
│   │   │   │   └── dashboard_page.dart
│   │   │   └── widgets/
│   │   │       ├── balance_card.dart
│   │   │       ├── recent_transactions.dart
│   │   │       ├── spending_chart.dart
│   │   │       └── quick_actions.dart
│   │
│   └── profile/
│       ├── presentation/
│       │   ├── pages/
│       │   │   ├── profile_page.dart
│       │   │   └── settings_page.dart
│       │   └── widgets/
│       │       └── profile_menu_item.dart
│
└── shared/
    ├── widgets/
    │   ├── custom_app_bar.dart
    │   ├── loading_overlay.dart
    │   ├── empty_state.dart
    │   ├── error_widget.dart
    │   ├── custom_button.dart
    │   ├── custom_card.dart
    │   └── animated_slide_up.dart
    └── extensions/
        ├── context_extensions.dart
        ├── number_extensions.dart
        └── date_extensions.dart
```

## Architecture Explanation

### MVVM Pattern with Riverpod

**Model (Data Layer)**
- `models/` - Data models with JSON serialization
- `datasources/` - API calls and data sources
- `repositories/` - Repository implementations

**View (Presentation Layer - UI)**
- `pages/` - Full screen pages
- `widgets/` - Reusable UI components

**ViewModel (Presentation Layer - Logic)**
- `viewmodels/` - Business logic and state management
- `providers/` - Riverpod providers for dependency injection

### Key Principles

1. **Separation of Concerns**
   - Data layer handles API calls and data storage
   - Domain layer defines business entities and contracts
   - Presentation layer handles UI and user interactions

2. **Dependency Injection**
   - Use Riverpod for DI
   - Providers inject dependencies into ViewModels

3. **State Management**
   - Riverpod StateNotifier/AsyncNotifier for state
   - Immutable state with freezed

4. **Navigation**
   - go_router with ShellRoute for bottom navigation
   - Type-safe navigation

5. **Code Generation**
   - freezed for immutable models
   - json_serializable for JSON parsing
   - riverpod_generator for providers
   - retrofit for API clients

## Development Workflow

1. **Define Model** (data/models/)
2. **Define Entity** (domain/entities/) - Optional, for complex apps
3. **Create Repository Interface** (domain/repositories/)
4. **Implement Repository** (data/repositories/)
5. **Create DataSource** (data/datasources/)
6. **Create ViewModel** (presentation/viewmodels/)
7. **Create Provider** (presentation/providers/)
8. **Build UI** (presentation/pages/ & widgets/)

## Running Code Generation

```bash
# Watch for changes and generate code
flutter pub run build_runner watch --delete-conflicting-outputs

# Or one-time generation
flutter pub run build_runner build --delete-conflicting-outputs
```
