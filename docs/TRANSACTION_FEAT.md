# Transactions Feature - Complete Implementation Guide

## 🎯 Overview

The Transactions feature is the heart of the finance wallet app. It allows users to:
- ✅ Record income transactions
- ✅ Record expense transactions
- ✅ Transfer money between accounts
- ✅ View transaction history with filters
- ✅ Categorize transactions
- ✅ Add tags to transactions
- ✅ View transaction details

---

## Provided Code

```dart
// File: lib/features/transactions/data/models/category.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String type, // INCOME, EXPENSE, TRANSFER
    String? color,
    String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

// File: lib/features/transactions/data/models/transaction.dart
import 'package:finance_wallet/features/accounts/data/models/account.dart';
import 'package:finance_wallet/features/accounts/data/models/currency.dart';
import 'package:finance_wallet/features/transactions/data/models/category.dart';
import 'package:finance_wallet/features/transactions/data/models/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required TransactionAccountInfo account,
    TransactionAccountInfo? toAccount, // For transfers
    Category? category,
    required String type, // INCOME, EXPENSE, TRANSFER
    required double amount,
    required Currency currency,
    double? exchangeRate,
    double? convertedAmount,
    required DateTime transactionDate,
    required String description,
    String? note,
    String? payee,
    String? location,
    double? latitude,
    double? longitude,
    required String status,
    required List<Tag> tags,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
class TransactionAccountInfo with _$TransactionAccountInfo {
  const factory TransactionAccountInfo({
    required String id,
    required String name,
    required AccountTypeInfo accountType,
    required Currency currency,
  }) = _TransactionAccountInfo;

  factory TransactionAccountInfo.fromJson(Map<String, dynamic> json) =>
      _$TransactionAccountInfoFromJson(json);
}

@freezed
class AccountTypeInfo with _$AccountTypeInfo {
  const factory AccountTypeInfo({
    required String id,
    required String name,
    String? icon,
  }) = _AccountTypeInfo;

  factory AccountTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountTypeInfoFromJson(json);
}

// File: lib/features/transactions/data/models/tag.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String id,
    required String name,
    String? color,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

// File: lib/features/transactions/data/models/create_transaction_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transaction_request.freezed.dart';
part 'create_transaction_request.g.dart';

@freezed
class CreateTransactionRequest with _$CreateTransactionRequest {
  const factory CreateTransactionRequest({
    required String accountId,
    required String type, // INCOME, EXPENSE
    required double amount,
    String? categoryId,
    required DateTime transactionDate,
    required String description,
    String? note,
    String? payee,
    String? location,
    double? latitude,
    double? longitude,
    List<String>? tags,
  }) = _CreateTransactionRequest;

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionRequestFromJson(json);
}

// File: lib/features/transactions/data/models/transfer_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_request.freezed.dart';
part 'transfer_request.g.dart';

@freezed
class TransferRequest with _$TransferRequest {
  const factory TransferRequest({
    required String fromAccountId,
    required String toAccountId,
    required double amount,
    double? exchangeRate,
    required DateTime transactionDate,
    required String description,
    String? note,
  }) = _TransferRequest;

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);
}

// File: lib/features/transactions/data/models/transaction_filter.dart
class TransactionFilter {
  final String? accountId;
  final String? categoryId;
  final String? type;
  final DateTime? startDate;
  final DateTime? endDate;
  final int page;
  final int size;
  final String sortBy;
  final String sortDirection;

  TransactionFilter({
    this.accountId,
    this.categoryId,
    this.type,
    this.startDate,
    this.endDate,
    this.page = 0,
    this.size = 20,
    this.sortBy = 'transactionDate',
    this.sortDirection = 'DESC',
  });

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (accountId != null) params['accountId'] = accountId;
    if (categoryId != null) params['categoryId'] = categoryId;
    if (type != null) params['type'] = type;
    if (startDate != null) params['startDate'] = startDate!.toIso8601String();
    if (endDate != null) params['endDate'] = endDate!.toIso8601String();
    params['page'] = page;
    params['size'] = size;
    params['sortBy'] = sortBy;
    params['sortDirection'] = sortDirection;

    return params;
  }
}
```

## 📦 What Needs to Be Created

### Data Layer
1. **Models** (7 files in `lib/features/transactions/data/models/`)
   - category.dart ✅ (Already provided)
   - transaction.dart ✅ (Already provided)
   - tag.dart ✅ (Already provided)
   - create_transaction_request.dart ✅ (Already provided)
   - transfer_request.dart ✅ (Already provided)
   - transaction_filter.dart ✅ (Already provided)

2. **Datasource** (1 file in `lib/features/transactions/data/datasources/`)
   - transaction_remote_datasource.dart

3. **Repository** (2 files)
   - domain/repositories/transaction_repository.dart
   - data/repositories/transaction_repository_impl.dart

4. **Providers & ViewModels** (3 files in `presentation/`)
   - providers/transaction_providers.dart
   - viewmodels/transaction_list_viewmodel.dart
   - viewmodels/transaction_form_viewmodel.dart

### UI Layer
5. **Pages** (5 files in `presentation/pages/`)
   - transactions_page.dart (List with filters)
   - add_transaction_page.dart (Income/Expense form)
   - transfer_page.dart (Transfer form)
   - transaction_detail_page.dart (View details)

6. **Widgets** (Optional - 2 files in `presentation/widgets/`)
   - transaction_card.dart (Reusable transaction card)
   - transaction_filter_sheet.dart (Bottom sheet for filters)

---

## 🚀 Quick Implementation Steps

Since we have limited space, here's the fastest path:

### Step 1: Copy Transaction Models
Already provided above - copy all 6 model files.

### Step 2: Create Datasource
Create `transaction_remote_datasource.dart` with these methods:
```dart
class TransactionRemoteDatasource {
  final Dio _dio;

  Future<Page<Transaction>> getTransactions(TransactionFilter filter);
  Future<Transaction> getTransactionById(String id);
  Future<Transaction> createTransaction(CreateTransactionRequest request);
  Future<Transaction> transfer(TransferRequest request);
  Future<void> deleteTransaction(String id);
  Future<List<Category>> getCategories({String? type});
}
```

### Step 3: Create Repository
Similar pattern to AccountRepository:
```dart
abstract class TransactionRepository {
  Future<Either<Failure, Page<Transaction>>> getTransactions(filter);
  Future<Either<Failure, Transaction>> createTransaction(request);
  Future<Either<Failure, Transaction>> transfer(request);
  // ... other methods
}
```

### Step 4: Create Providers
```dart
final transactionRepositoryProvider = Provider<TransactionRepository>(...);
final transactionsProvider = StateProvider<List<Transaction>>([]);
final categoriesProvider = StateProvider<List<Category>>([]);
```

### Step 5: Create ViewModels
- TransactionListViewModel - handles list, filtering, pagination
- TransactionFormViewModel - handles create/update logic

### Step 6: Create UI Pages

**Main Pages:**
1. **Transactions Page** - Shows list with pull-to-refresh, filters
2. **Add Transaction Page** - Form for income/expense
3. **Transfer Page** - Form for transfers between accounts
4. **Transaction Detail Page** - View transaction info

---

## 🎨 UI Design Guidelines

### Transactions List
```
╔════════════════════════════════════╗
║  [Filter] [Type: All ▼] [Date ▼]  ║
╠════════════════════════════════════╣
║  Dec 15, 2024                      ║
║  ┌──────────────────────────────┐  ║
║  │ 🍔 Lunch at Restaurant       │  ║
║  │ Food & Dining                │  ║
║  │                  -$45.50     │  ║
║  └──────────────────────────────┘  ║
║  ┌──────────────────────────────┐  ║
║  │ 💰 Monthly Salary            │  ║
║  │ Salary • ABC Company         │  ║
║  │                  +$5,000.00  │  ║
║  └──────────────────────────────┘  ║
╚════════════════════════════════════╝
    [+ Add Transaction] FAB
```

### Add Transaction Form
```
┌─────────────────────────────────┐
│ Type: ○ Income  ● Expense       │
├─────────────────────────────────┤
│ Account: [Main Bank ▼]         │
│ Category: [Food & Dining ▼]    │
│ Amount: [$___.__]              │
│ Date: [Dec 15, 2024]           │
│ Description: [____________]     │
│ Note: [Optional...]            │
│ Tags: #food #lunch             │
├─────────────────────────────────┤
│     [Cancel]  [Save]            │
└─────────────────────────────────┘
```

---

## 🔑 Key Features to Implement

### Transaction List Features
- ✅ Group by date
- ✅ Income/Expense color coding (green/red)
- ✅ Category icons
- ✅ Pull to refresh
- ✅ Infinite scroll pagination
- ✅ Filter by type, date, category
- ✅ Search transactions
- ✅ Empty state

### Add Transaction Features
- ✅ Toggle between Income/Expense
- ✅ Account selection
- ✅ Category selection (filtered by type)
- ✅ Amount input with currency
- ✅ Date picker
- ✅ Description (required)
- ✅ Note (optional)
- ✅ Tags input
- ✅ Form validation

### Transfer Features
- ✅ From account selection
- ✅ To account selection
- ✅ Amount input
- ✅ Exchange rate (if different currencies)
- ✅ Date picker
- ✅ Description

### Transaction Detail Features
- ✅ Full transaction info
- ✅ Edit button
- ✅ Delete button with confirmation
- ✅ Category badge
- ✅ Tags display
- ✅ Account info
- ✅ Location (if available)

---

## 💡 Implementation Tips

### 1. Date Grouping
Group transactions by date in the list:
```dart
Map<String, List<Transaction>> groupByDate(List<Transaction> transactions) {
  final grouped = <String, List<Transaction>>{};
  for (var transaction in transactions) {
    final dateKey = DateFormatter.format(transaction.transactionDate);
    grouped.putIfAbsent(dateKey, () => []).add(transaction);
  }
  return grouped;
}
```

### 2. Color Coding
```dart
Color getTransactionColor(String type) {
  switch (type) {
    case 'INCOME':
      return AppColors.income;
    case 'EXPENSE':
      return AppColors.expense;
    case 'TRANSFER':
      return AppColors.transfer;
    default:
      return AppColors.grey500;
  }
}
```

### 3. Category Icons
Map category names to Material Icons:
```dart
IconData getCategoryIcon(String categoryName) {
  // Map common category names to icons
  final iconMap = {
    'Food': Icons.restaurant,
    'Transport': Icons.directions_car,
    'Shopping': Icons.shopping_cart,
    'Salary': Icons.work,
    // ... more mappings
  };
  return iconMap[categoryName] ?? Icons.category;
}
```

### 4. Transaction Type Toggle
Use segmented button for Income/Expense selection:
```dart
SegmentedButton<String>(
  segments: [
    ButtonSegment(value: 'INCOME', label: Text('Income'), icon: Icon(Icons.add)),
    ButtonSegment(value: 'EXPENSE', label: Text('Expense'), icon: Icon(Icons.remove)),
  ],
  selected: {selectedType},
  onSelectionChanged: (Set<String> value) {
    setState(() => selectedType = value.first);
  },
)
```

---

## 📊 API Endpoints

```
GET    /transactions                    - List transactions (with filters)
POST   /transactions                    - Create income/expense
POST   /transactions/transfer           - Transfer between accounts
GET    /transactions/{id}               - Get transaction details
PUT    /transactions/{id}               - Update transaction
DELETE /transactions/{id}               - Delete transaction
GET    /categories                      - Get all categories
GET    /categories?type=INCOME          - Get income categories
GET    /categories?type=EXPENSE         - Get expense categories
```

---

## 🎯 Suggested Implementation Order

1. **Models & Data Layer** (30 min)
   - Copy all model files
   - Create datasource
   - Create repository
   - Run code generation

2. **Providers & ViewModels** (30 min)
   - Create providers
   - Create TransactionListViewModel
   - Create TransactionFormViewModel

3. **Transaction List Page** (45 min)
   - Basic list view
   - Transaction cards
   - Pull to refresh
   - Empty state

4. **Add Transaction Page** (45 min)
   - Form with validation
   - Type toggle
   - Account & category selection
   - Submit logic

5. **Transfer Page** (30 min)
   - Similar to transaction form
   - Two account selections
   - Exchange rate handling

6. **Transaction Detail Page** (30 min)
   - Display all info
   - Edit/Delete buttons

7. **Filters & Polish** (30 min)
   - Filter bottom sheet
   - Search functionality
   - Animations

**Total Time: ~4 hours for complete implementation**

---

## 🔄 Integration with Accounts

After creating transactions:
- Account balances update automatically (backend handles this)
- Refresh accounts list to see updated balances
- Dashboard should reflect new transactions

```dart
// After successful transaction creation:
ref.read(accountListViewModelProvider.notifier).loadAccounts();
ref.read(accountListViewModelProvider.notifier).loadAccountSummary();
```

---

## 🎨 Animation Ideas

1. **List Items**: Stagger fade-in with slide
2. **Transaction Cards**: Scale on tap
3. **Type Toggle**: Smooth color transition
4. **Amount Input**: Bounce on validation error
5. **Success**: Confetti or checkmark animation
6. **Delete**: Swipe to delete gesture

---

## 📱 Responsive Design

- **List View**: Use ListView.separated for clean spacing
- **Cards**: Expand to full width on mobile
- **Forms**: Scroll on small screens
- **Filters**: Bottom sheet on mobile, sidebar on tablet

---

## ✅ Testing Checklist

- [ ] Can create income transaction
- [ ] Can create expense transaction
- [ ] Can transfer between accounts
- [ ] Account balances update correctly
- [ ] Can filter by type
- [ ] Can filter by date range
- [ ] Can filter by category
- [ ] Can search transactions
- [ ] Can view transaction details
- [ ] Can delete transaction
- [ ] Form validation works
- [ ] Pull to refresh works
- [ ] Pagination works
- [ ] Empty state shows
- [ ] Loading states show
- [ ] Errors display properly

---

## 🚀 Next Steps After Transactions

Once transactions are working:

1. **Enhanced Dashboard**
   - Show recent transactions from API
   - Display spending charts
   - Income vs Expense graph
   - Monthly trends

2. **Reports & Analytics**
   - Spending by category pie chart
   - Monthly comparison bar chart
   - Export to CSV/PDF

3. **Budgets Feature**
   - Set spending limits
   - Budget vs actual comparison
   - Alerts when over budget

4. **Recurring Transactions**
   - Schedule automatic transactions
   - Monthly bills reminder

---

## 💡 Pro Tips

1. **Debounce Search**: Use debouncing for search input to avoid excessive API calls
2. **Cache Data**: Cache transactions list in provider to avoid reloading
3. **Optimistic Updates**: Show transaction immediately, sync with server
4. **Image Attachments**: Add support for receipt photos later
5. **Export Data**: Allow users to export transactions to CSV

---

## 🎉 Summary

The Transactions feature is the most complex but most valuable feature. Take your time implementing it properly with:
- Clean architecture
- Proper state management
- Beautiful animations
- Great UX

**Ready to implement?** Start with the data layer, then build up to the UI! 🚀

---

**Want me to provide the complete code for any specific part?** Let me know:
- Datasource implementation?
- Repository implementation?
- Specific UI page?
- ViewModels?

I can provide detailed code for whichever part you need! 💻

## API Guide

## Prerequisites

1. User logged in with access token
2. At least 2 accounts created (for testing transfers)
3. Know your account IDs and category IDs

```bash
export TOKEN="your-access-token"
export ACCOUNT_ID="your-account-uuid"
export CATEGORY_ID="your-category-uuid"
```

---

## 1. Create Income Transaction

### Request
```bash
curl -X POST http://localhost:8080/api/transactions \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "'$ACCOUNT_ID'",
    "type": "INCOME",
    "amount": 5000.00,
    "categoryId": "'$CATEGORY_ID'",
    "transactionDate": "2024-12-15T10:00:00",
    "description": "Monthly Salary",
    "note": "December 2024 salary",
    "payee": "ABC Company",
    "tags": ["salary", "monthly"]
  }'
```

### Expected Response (201 Created)
```json
{
  "success": true,
  "message": "Transaction created successfully",
  "data": {
    "id": "transaction-uuid",
    "account": {
      "id": "account-uuid",
      "name": "Main Bank Account",
      "accountType": {
        "id": "type-uuid",
        "name": "BANK",
        "icon": "bank"
      },
      "currency": {
        "id": "currency-uuid",
        "code": "USD",
        "symbol": "$",
        "name": "US Dollar"
      }
    },
    "toAccount": null,
    "category": {
      "id": "category-uuid",
      "name": "Salary",
      "type": "INCOME",
      "color": "#27AE60",
      "icon": "work"
    },
    "type": "INCOME",
    "amount": 5000.00,
    "currency": {
      "id": "currency-uuid",
      "code": "USD",
      "symbol": "$",
      "name": "US Dollar"
    },
    "exchangeRate": null,
    "convertedAmount": null,
    "transactionDate": "2024-12-15T10:00:00",
    "description": "Monthly Salary",
    "note": "December 2024 salary",
    "payee": "ABC Company",
    "location": null,
    "latitude": null,
    "longitude": null,
    "status": "COMPLETED",
    "tags": [
      {
        "id": "tag-uuid-1",
        "name": "salary",
        "color": null
      },
      {
        "id": "tag-uuid-2",
        "name": "monthly",
        "color": null
      }
    ],
    "createdAt": "2024-12-15T10:00:00",
    "updatedAt": "2024-12-15T10:00:00"
  }
}
```

**Note:** Account balance will be increased by $5000

---

## 2. Create Expense Transaction

### Request
```bash
curl -X POST http://localhost:8080/api/transactions \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "'$ACCOUNT_ID'",
    "type": "EXPENSE",
    "amount": 150.50,
    "categoryId": "'$CATEGORY_ID'",
    "transactionDate": "2024-12-15T12:30:00",
    "description": "Grocery Shopping",
    "note": "Weekly groceries at Walmart",
    "payee": "Walmart",
    "location": "123 Main St",
    "tags": ["groceries", "food"]
  }'
```

### Expected Response (201 Created)
Similar structure to income, but:
- `type`: "EXPENSE"
- Account balance will be decreased by $150.50

### Error Response - Insufficient Balance (400)
```json
{
  "status": 400,
  "error": "Insufficient Balance",
  "message": "Insufficient balance in account 'Main Bank Account'. Available: $100.00, Required: $150.50",
  "path": "/transactions"
}
```

---

## 3. Transfer Between Accounts (Same Currency)

### Request
```bash
curl -X POST http://localhost:8080/api/transactions/transfer \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "fromAccountId": "from-account-uuid",
    "toAccountId": "to-account-uuid",
    "amount": 500.00,
    "transactionDate": "2024-12-15T14:00:00",
    "description": "Transfer to Savings",
    "note": "Moving emergency fund"
  }'
```

### Expected Response (201 Created)
```json
{
  "success": true,
  "message": "Transfer completed successfully",
  "data": {
    "id": "transaction-uuid",
    "account": {
      "id": "from-account-uuid",
      "name": "Main Bank Account",
      ...
    },
    "toAccount": {
      "id": "to-account-uuid",
      "name": "Savings Account",
      ...
    },
    "type": "TRANSFER",
    "amount": 500.00,
    "exchangeRate": 1,
    "convertedAmount": 500.00,
    ...
  }
}
```

**Result:**
- From account: -$500
- To account: +$500

---

## 4. Transfer Between Accounts (Different Currencies)

### Request
```bash
curl -X POST http://localhost:8080/api/transactions/transfer \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "fromAccountId": "usd-account-uuid",
    "toAccountId": "eur-account-uuid",
    "amount": 1000.00,
    "exchangeRate": 0.85,
    "transactionDate": "2024-12-15T15:00:00",
    "description": "Transfer USD to EUR",
    "note": "1 USD = 0.85 EUR"
  }'
```

### Expected Response
```json
{
  "success": true,
  "message": "Transfer completed successfully",
  "data": {
    "amount": 1000.00,
    "exchangeRate": 0.85,
    "convertedAmount": 850.00,
    ...
  }
}
```

**Result:**
- USD account: -$1000
- EUR account: +€850

### Error Response - Missing Exchange Rate (400)
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Exchange rate is required for transfers between different currencies"
}
```

---

## 5. Get All Transactions (Paginated)

### Request
```bash
curl -X GET "http://localhost:8080/api/transactions?page=0&size=10&sortBy=transactionDate&sortDirection=DESC" \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Transactions retrieved successfully",
  "data": {
    "content": [
      {
        "id": "transaction-1-uuid",
        "type": "INCOME",
        "amount": 5000.00,
        ...
      },
      {
        "id": "transaction-2-uuid",
        "type": "EXPENSE",
        "amount": 150.50,
        ...
      }
    ],
    "pageable": {
      "pageNumber": 0,
      "pageSize": 10
    },
    "totalElements": 25,
    "totalPages": 3,
    "last": false,
    "first": true
  }
}
```

---

## 6. Filter Transactions by Account

### Request
```bash
curl -X GET "http://localhost:8080/api/transactions?accountId=$ACCOUNT_ID&page=0&size=20" \
  -H "Authorization: Bearer $TOKEN"
```

Returns all transactions for specific account.

---

## 7. Filter Transactions by Category

### Request
```bash
curl -X GET "http://localhost:8080/api/transactions?categoryId=$CATEGORY_ID" \
  -H "Authorization: Bearer $TOKEN"
```

Returns all transactions in specific category.

---

## 8. Filter Transactions by Type

### Request - Get All Income
```bash
curl -X GET "http://localhost:8080/api/transactions?type=INCOME" \
  -H "Authorization: Bearer $TOKEN"
```

### Request - Get All Expenses
```bash
curl -X GET "http://localhost:8080/api/transactions?type=EXPENSE" \
  -H "Authorization: Bearer $TOKEN"
```

### Request - Get All Transfers
```bash
curl -X GET "http://localhost:8080/api/transactions?type=TRANSFER" \
  -H "Authorization: Bearer $TOKEN"
```

---

## 9. Filter Transactions by Date Range

### Request - This Month
```bash
curl -X GET "http://localhost:8080/api/transactions?startDate=2024-12-01T00:00:00&endDate=2024-12-31T23:59:59" \
  -H "Authorization: Bearer $TOKEN"
```

### Request - Last 7 Days
```bash
curl -X GET "http://localhost:8080/api/transactions?startDate=2024-12-08T00:00:00&endDate=2024-12-15T23:59:59" \
  -H "Authorization: Bearer $TOKEN"
```

---

## 10. Get Specific Transaction

### Request
```bash
curl -X GET http://localhost:8080/api/transactions/TRANSACTION_ID \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Transaction retrieved successfully",
  "data": {
    "id": "transaction-uuid",
    "type": "EXPENSE",
    "amount": 150.50,
    ...
  }
}
```

---

## 11. Update Transaction

### Request
```bash
curl -X PUT http://localhost:8080/api/transactions/TRANSACTION_ID \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": 175.00,
    "description": "Updated Grocery Shopping",
    "note": "Updated note",
    "tags": ["groceries", "food", "essentials"]
  }'
```

### Expected Response
```json
{
  "success": true,
  "message": "Transaction updated successfully",
  "data": {
    "id": "transaction-uuid",
    "amount": 175.00,
    "description": "Updated Grocery Shopping",
    ...
  }
}
```

**Note:** Account balance is automatically adjusted based on amount change.

### Error Response - Cannot Update Transfer (400)
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Cannot update transfer transactions. Delete and create a new one instead."
}
```

---

## 12. Delete Transaction

### Request
```bash
curl -X DELETE http://localhost:8080/api/transactions/TRANSACTION_ID \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Transaction deleted successfully"
}
```

**Note:** Account balance is automatically reverted.

---

## Complete Testing Workflow

### Setup
```bash
# 1. Login
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"your@email.com","password":"yourpassword"}' | jq

export TOKEN="access-token-from-response"

# 2. Get accounts
curl -X GET http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" | jq

export ACCOUNT1="first-account-uuid"
export ACCOUNT2="second-account-uuid"

# 3. Get categories
curl -X GET http://localhost:8080/api/categories \
  -H "Authorization: Bearer $TOKEN" | jq

export INCOME_CAT="salary-category-uuid"
export EXPENSE_CAT="food-category-uuid"
```

### Test Income
```bash
curl -X POST http://localhost:8080/api/transactions \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "'$ACCOUNT1'",
    "type": "INCOME",
    "amount": 3000.00,
    "categoryId": "'$INCOME_CAT'",
    "transactionDate": "2024-12-15T09:00:00",
    "description": "Freelance Payment",
    "payee": "Client XYZ"
  }' | jq

# Check account balance increased
curl -X GET http://localhost:8080/api/accounts/$ACCOUNT1 \
  -H "Authorization: Bearer $TOKEN" | jq '.data.currentBalance'
```

### Test Expense
```bash
curl -X POST http://localhost:8080/api/transactions \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "'$ACCOUNT1'",
    "type": "EXPENSE",
    "amount": 75.00,
    "categoryId": "'$EXPENSE_CAT'",
    "transactionDate": "2024-12-15T13:00:00",
    "description": "Lunch at Restaurant"
  }' | jq

# Check account balance decreased
curl -X GET http://localhost:8080/api/accounts/$ACCOUNT1 \
  -H "Authorization: Bearer $TOKEN" | jq '.data.currentBalance'
```

### Test Transfer
```bash
curl -X POST http://localhost:8080/api/transactions/transfer \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "fromAccountId": "'$ACCOUNT1'",
    "toAccountId": "'$ACCOUNT2'",
    "amount": 500.00,
    "transactionDate": "2024-12-15T16:00:00",
    "description": "Transfer to Savings"
  }' | jq

# Check both account balances
curl -X GET http://localhost:8080/api/accounts/summary \
  -H "Authorization: Bearer $TOKEN" | jq
```

### Test Filtering
```bash
# All transactions
curl -X GET "http://localhost:8080/api/transactions?page=0&size=10" \
  -H "Authorization: Bearer $TOKEN" | jq

# Only income
curl -X GET "http://localhost:8080/api/transactions?type=INCOME" \
  -H "Authorization: Bearer $TOKEN" | jq

# This month only
curl -X GET "http://localhost:8080/api/transactions?startDate=2024-12-01T00:00:00&endDate=2024-12-31T23:59:59" \
  -H "Authorization: Bearer $TOKEN" | jq
```

---

## Common Error Responses

### 400 Bad Request - Insufficient Balance
```json
{
  "status": 400,
  "error": "Insufficient Balance",
  "message": "Insufficient balance in account 'Main Bank'. Available: $50.00, Required: $100.00"
}
```

### 400 Bad Request - Transfer to Same Account
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Cannot transfer to the same account"
}
```

### 400 Bad Request - Wrong Category Type
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Category type (EXPENSE) does not match transaction type (INCOME)"
}
```

### 404 Not Found - Account Not Found
```json
{
  "status": 404,
  "error": "Not Found",
  "message": "Account not found with id: uuid-here"
}
```

---

## Success Criteria

✅ Can create income transaction (balance increases)
✅ Can create expense transaction (balance decreases)
✅ Can transfer between accounts (same currency)
✅ Can transfer between accounts (different currencies)
✅ Cannot create expense with insufficient balance
✅ Can filter transactions by various criteria
✅ Can update transaction (balance auto-adjusts)
✅ Can delete transaction (balance reverts)
✅ Account balances are always accurate

---

## Next Steps

After transactions are working:
1. ✅ Test all transaction types thoroughly
2. ✅ Verify account balances update correctly
3. ✅ Test edge cases (insufficient balance, invalid data)
4. 🎯 Add Categories API (manage custom categories)
5. 🎯 Add Dashboard/Reports API (statistics, charts)
6. 🎯 Start Flutter mobile app!
