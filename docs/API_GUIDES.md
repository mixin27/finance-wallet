# Finance Wallet API - Auth and Currency

## Prerequisites

1. Spring Boot app running on `http://localhost:8080`
2. PostgreSQL database with schema created
3. Postman or any REST client (or use cURL)

---

## Base URL
```
http://localhost:8080/api
```

---

## 1. Health Check (No Auth Required)

### Request
```bash
curl -X GET http://localhost:8080/api/auth/health
```

### Expected Response
```json
{
  "status": "UP",
  "service": "Finance Wallet API",
  "timestamp": "1702847234567"
}
```

---

## 2. Get All Currencies (No Auth Required)

### Request
```bash
curl -X GET http://localhost:8080/api/currencies
```

### Expected Response
```json
{
  "success": true,
  "message": "Currencies retrieved successfully",
  "data": [
    {
      "id": "uuid-here",
      "code": "USD",
      "name": "US Dollar",
      "symbol": "$",
      "decimalPlaces": 2,
      "isActive": true
    },
    ...
  ],
  "timestamp": 1702847234567
}
```

---

## 3. Register New User

### Request
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john.doe@example.com",
    "username": "johndoe",
    "password": "password123",
    "fullName": "John Doe",
    "phoneNumber": "+1234567890"
  }'
```

### Expected Response (201 Created)
```json
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "tokenType": "Bearer",
    "expiresIn": 3600,
    "user": {
      "id": "uuid-here",
      "email": "john.doe@example.com",
      "username": "johndoe",
      "fullName": "John Doe",
      "phoneNumber": "+1234567890",
      "profileImageUrl": null,
      "isEmailVerified": false,
      "authProvider": "LOCAL",
      "createdAt": "2024-12-15T10:30:00",
      "lastLoginAt": null
    }
  },
  "timestamp": 1702847234567
}
```

### Error Response - Email Already Exists (400)
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Email is already taken",
  "path": "/api/auth/register",
  "timestamp": 1702847234567
}
```

### Error Response - Validation Failed (400)
```json
{
  "status": 400,
  "error": "Validation Failed",
  "message": "Input validation failed",
  "path": "/api/auth/register",
  "validationErrors": {
    "email": "Email should be valid",
    "password": "Password must be between 6 and 100 characters"
  },
  "timestamp": 1702847234567
}
```

---

## 4. Login

### Request
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john.doe@example.com",
    "password": "password123"
  }'
```

### Expected Response (200 OK)
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "tokenType": "Bearer",
    "expiresIn": 3600,
    "user": {
      "id": "uuid-here",
      "email": "john.doe@example.com",
      "username": "johndoe",
      "fullName": "John Doe",
      "phoneNumber": "+1234567890",
      "profileImageUrl": null,
      "isEmailVerified": false,
      "authProvider": "LOCAL",
      "createdAt": "2024-12-15T10:30:00",
      "lastLoginAt": "2024-12-15T11:00:00"
    }
  },
  "timestamp": 1702847234567
}
```

### Error Response - Invalid Credentials (401)
```json
{
  "status": 401,
  "error": "Unauthorized",
  "message": "Invalid email or password",
  "path": "/api/auth/login",
  "timestamp": 1702847234567
}
```

---

## 5. OAuth Login (Google/Apple)

### Request
```bash
curl -X POST http://localhost:8080/api/auth/oauth/login \
  -H "Content-Type: application/json" \
  -d '{
    "provider": "GOOGLE",
    "providerId": "google-user-id-12345",
    "email": "jane.smith@gmail.com",
    "fullName": "Jane Smith",
    "profileImageUrl": "https://example.com/photo.jpg"
  }'
```

### Expected Response (200 OK)
Same structure as login response.

---

## 6. Get Current User (Requires Auth)

### Request
```bash
curl -X GET http://localhost:8080/api/auth/me \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN_HERE"
```

### Expected Response (200 OK)
```json
{
  "success": true,
  "message": "User retrieved successfully",
  "data": {
    "id": "uuid-here",
    "email": "john.doe@example.com",
    "username": "johndoe",
    "fullName": "John Doe",
    "phoneNumber": "+1234567890",
    "profileImageUrl": null,
    "isEmailVerified": false,
    "authProvider": "LOCAL",
    "createdAt": "2024-12-15T10:30:00",
    "lastLoginAt": "2024-12-15T11:00:00"
  },
  "timestamp": 1702847234567
}
```

### Error Response - No Token (401)
```json
{
  "status": 401,
  "error": "Unauthorized",
  "message": "You need to login to access this resource",
  "path": "/api/auth/me"
}
```

---

## 7. Refresh Token

### Request
```bash
curl -X POST http://localhost:8080/api/auth/refresh \
  -H "Content-Type: application/json" \
  -d '{
    "refreshToken": "YOUR_REFRESH_TOKEN_HERE"
  }'
```

### Expected Response (200 OK)
```json
{
  "success": true,
  "message": "Token refreshed successfully",
  "data": {
    "accessToken": "NEW_ACCESS_TOKEN",
    "refreshToken": "NEW_REFRESH_TOKEN",
    "tokenType": "Bearer",
    "expiresIn": 3600,
    "user": { ... }
  },
  "timestamp": 1702847234567
}
```

---

## 8. Change Password (Requires Auth)

### Request
```bash
curl -X PUT http://localhost:8080/api/auth/change-password \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "currentPassword": "password123",
    "newPassword": "newpassword456"
  }'
```

### Expected Response (200 OK)
```json
{
  "success": true,
  "message": "Password changed successfully. Please login again.",
  "timestamp": 1702847234567
}
```

---

## 9. Logout

### Request
```bash
curl -X POST http://localhost:8080/api/auth/logout \
  -H "Content-Type: application/json" \
  -d '{
    "refreshToken": "YOUR_REFRESH_TOKEN_HERE"
  }'
```

### Expected Response (200 OK)
```json
{
  "success": true,
  "message": "Logout successful",
  "timestamp": 1702847234567
}
```

---

## Postman Collection

### Import this collection into Postman:

```json
{
  "info": {
    "name": "Finance Wallet API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Auth",
      "item": [
        {
          "name": "Register",
          "request": {
            "method": "POST",
            "header": [{"key": "Content-Type", "value": "application/json"}],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"email\": \"test@example.com\",\n  \"username\": \"testuser\",\n  \"password\": \"password123\",\n  \"fullName\": \"Test User\"\n}"
            },
            "url": {"raw": "{{baseUrl}}/auth/register"}
          }
        },
        {
          "name": "Login",
          "request": {
            "method": "POST",
            "header": [{"key": "Content-Type", "value": "application/json"}],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"email\": \"test@example.com\",\n  \"password\": \"password123\"\n}"
            },
            "url": {"raw": "{{baseUrl}}/auth/login"}
          }
        },
        {
          "name": "Get Current User",
          "request": {
            "method": "GET",
            "header": [{"key": "Authorization", "value": "Bearer {{accessToken}}"}],
            "url": {"raw": "{{baseUrl}}/auth/me"}
          }
        }
      ]
    }
  ],
  "variable": [
    {"key": "baseUrl", "value": "http://localhost:8080/api"}
  ]
}
```

---

## Swagger UI

Access interactive API documentation at:
```
http://localhost:8080/api/swagger-ui.html
```

You can test all endpoints directly from the browser!

---

## Testing Workflow

### 1. **First Time Setup**
```bash
# 1. Check health
curl http://localhost:8080/api/auth/health

# 2. Get currencies (for registration)
curl http://localhost:8080/api/currencies

# 3. Register a user
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","username":"testuser","password":"test123","fullName":"Test User"}'

# Save the accessToken from response
```

### 2. **Daily Testing**
```bash
# 1. Login
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@test.com","password":"test123"}'

# 2. Use accessToken for authenticated requests
export TOKEN="your-access-token-here"

curl -X GET http://localhost:8080/api/auth/me \
  -H "Authorization: Bearer $TOKEN"
```

---

## Common Issues & Solutions

### Issue: 401 Unauthorized
**Solution**: Check if you included the Authorization header with Bearer token

### Issue: 403 Forbidden
**Solution**: Token might be expired, use refresh token endpoint

### Issue: 400 Bad Request
**Solution**: Check request body format and validation errors in response

### Issue: Database connection error
**Solution**: Check PostgreSQL is running and credentials in application.properties

---

## Next Steps

After authentication is working:
1. Test all endpoints in Postman
2. Verify tokens work correctly
3. Test OAuth flow (when ready)
4. Move to Accounts API implementation
5. Start Flutter integration

---

# Accounts API - Testing Guide

## Prerequisites

1. User registered and logged in
2. Access token obtained from login
3. Set your token as environment variable:
```bash
export TOKEN="your-access-token-here"
```

---

## 1. Get Account Types (For Dropdown)

### Request
```bash
curl -X GET http://localhost:8080/api/accounts/types \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Account types retrieved successfully",
  "data": [
    {
      "id": "uuid-here",
      "name": "BANK",
      "icon": "bank"
    },
    {
      "id": "uuid-here",
      "name": "CASH",
      "icon": "cash"
    },
    ...
  ]
}
```

**Save an account type ID for next step!**

---

## 2. Create Account

### Request
```bash
curl -X POST http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Main Bank Account",
    "accountTypeId": "YOUR_ACCOUNT_TYPE_ID",
    "currencyId": "YOUR_CURRENCY_ID",
    "description": "My primary bank account",
    "initialBalance": 5000.00,
    "color": "#4CAF50",
    "icon": "account_balance",
    "isIncludedInTotal": true
  }'
```

### Expected Response (201 Created)
```json
{
  "success": true,
  "message": "Account created successfully",
  "data": {
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
    },
    "description": "My primary bank account",
    "initialBalance": 5000.00,
    "currentBalance": 5000.00,
    "color": "#4CAF50",
    "icon": "account_balance",
    "isIncludedInTotal": true,
    "isActive": true,
    "createdAt": "2024-12-15T10:30:00",
    "updatedAt": "2024-12-15T10:30:00"
  }
}
```

**Save the account ID for next steps!**

---

## 3. Create Multiple Accounts (For Testing)

### Cash Account
```bash
curl -X POST http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Cash Wallet",
    "accountTypeId": "CASH_TYPE_ID",
    "currencyId": "YOUR_CURRENCY_ID",
    "initialBalance": 500.00,
    "color": "#FF9800",
    "icon": "payments"
  }'
```

### Credit Card
```bash
curl -X POST http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Visa Credit Card",
    "accountTypeId": "CREDIT_CARD_TYPE_ID",
    "currencyId": "YOUR_CURRENCY_ID",
    "initialBalance": -1000.00,
    "color": "#F44336",
    "icon": "credit_card"
  }'
```

### Savings Account
```bash
curl -X POST http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Emergency Fund",
    "accountTypeId": "SAVINGS_TYPE_ID",
    "currencyId": "YOUR_CURRENCY_ID",
    "description": "Emergency savings",
    "initialBalance": 10000.00,
    "color": "#2196F3",
    "icon": "savings",
    "isIncludedInTotal": true
  }'
```

---

## 4. Get All Accounts

### Request
```bash
curl -X GET http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Accounts retrieved successfully",
  "data": [
    {
      "id": "account-1-uuid",
      "name": "Main Bank Account",
      "accountType": { ... },
      "currency": { ... },
      "currentBalance": 5000.00,
      ...
    },
    {
      "id": "account-2-uuid",
      "name": "Cash Wallet",
      ...
    }
  ]
}
```

---

## 5. Get Account Summary

### Request
```bash
curl -X GET http://localhost:8080/api/accounts/summary \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Account summary retrieved successfully",
  "data": {
    "totalAccounts": 4,
    "activeAccounts": 4,
    "totalBalance": 14500.00,
    "balanceByCurrency": [
      {
        "currencyCode": "USD",
        "currencySymbol": "$",
        "balance": 14500.00,
        "accountCount": 4
      }
    ],
    "accounts": [ ... ]
  }
}
```

---

## 6. Get Specific Account

### Request
```bash
curl -X GET http://localhost:8080/api/accounts/YOUR_ACCOUNT_ID \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response
```json
{
  "success": true,
  "message": "Account retrieved successfully",
  "data": {
    "id": "account-uuid",
    "name": "Main Bank Account",
    ...
  }
}
```

---

## 7. Update Account

### Request
```bash
curl -X PUT http://localhost:8080/api/accounts/YOUR_ACCOUNT_ID \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Updated Bank Account",
    "description": "Updated description",
    "color": "#009688",
    "isIncludedInTotal": false
  }'
```

### Expected Response
```json
{
  "success": true,
  "message": "Account updated successfully",
  "data": {
    "id": "account-uuid",
    "name": "Updated Bank Account",
    "description": "Updated description",
    "color": "#009688",
    "isIncludedInTotal": false,
    ...
  }
}
```

---

## 8. Delete Account (Zero Balance Required)

### First, verify balance is zero
```bash
curl -X GET http://localhost:8080/api/accounts/YOUR_ACCOUNT_ID \
  -H "Authorization: Bearer $TOKEN"
```

### Delete Request
```bash
curl -X DELETE http://localhost:8080/api/accounts/YOUR_ACCOUNT_ID \
  -H "Authorization: Bearer $TOKEN"
```

### Expected Response (200 OK)
```json
{
  "success": true,
  "message": "Account deleted successfully"
}
```

### Error Response - Non-Zero Balance (400)
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Cannot delete account with non-zero balance. Current balance: $5000.00",
  "path": "/accounts/uuid"
}
```

---

## 9. Get Inactive Accounts

### Request
```bash
curl -X GET "http://localhost:8080/api/accounts?includeInactive=true" \
  -H "Authorization: Bearer $TOKEN"
```

This includes both active and inactive (deleted) accounts.

---

## Error Responses

### 401 Unauthorized - No Token
```json
{
  "status": 401,
  "error": "Unauthorized",
  "message": "Full authentication is required to access this resource"
}
```

### 401 Unauthorized - Invalid Token
```json
{
  "status": 401,
  "error": "Unauthorized",
  "message": "You need to login to access this resource"
}
```

### 404 Not Found - Account Doesn't Exist
```json
{
  "status": 404,
  "error": "Not Found",
  "message": "Account not found with id: uuid-here"
}
```

### 400 Bad Request - Validation Error
```json
{
  "status": 400,
  "error": "Validation Failed",
  "message": "Input validation failed",
  "validationErrors": {
    "name": "Account name is required",
    "currencyId": "Currency ID is required"
  }
}
```

### 400 Bad Request - Invalid Color
```json
{
  "status": 400,
  "error": "Bad Request",
  "message": "Invalid color format. Use hex format: #RRGGBB"
}
```

---

## Complete Testing Workflow

### Step 1: Setup
```bash
# Login and get token
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"your@email.com","password":"yourpassword"}'

# Save token
export TOKEN="your-access-token"
```

### Step 2: Get Reference Data
```bash
# Get currencies
curl http://localhost:8080/api/currencies | jq

# Get account types
curl -X GET http://localhost:8080/api/accounts/types \
  -H "Authorization: Bearer $TOKEN" | jq

# Save IDs you want to use
export CURRENCY_ID="uuid-from-response"
export ACCOUNT_TYPE_ID="uuid-from-response"
```

### Step 3: Create Accounts
```bash
# Create bank account
curl -X POST http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
    \"name\": \"My Bank\",
    \"accountTypeId\": \"$ACCOUNT_TYPE_ID\",
    \"currencyId\": \"$CURRENCY_ID\",
    \"initialBalance\": 1000.00,
    \"color\": \"#4CAF50\"
  }" | jq

# Save account ID
export ACCOUNT_ID="uuid-from-response"
```

### Step 4: Test Operations
```bash
# Get all accounts
curl -X GET http://localhost:8080/api/accounts \
  -H "Authorization: Bearer $TOKEN" | jq

# Get summary
curl -X GET http://localhost:8080/api/accounts/summary \
  -H "Authorization: Bearer $TOKEN" | jq

# Update account
curl -X PUT http://localhost:8080/api/accounts/$ACCOUNT_ID \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name": "Updated Name"}' | jq
```

---

## Postman Collection

Import this into Postman for easier testing:

```json
{
  "info": {
    "name": "Accounts API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Create Account",
      "request": {
        "method": "POST",
        "header": [
          {"key": "Authorization", "value": "Bearer {{token}}"},
          {"key": "Content-Type", "value": "application/json"}
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"name\": \"My Account\",\n  \"accountTypeId\": \"{{accountTypeId}}\",\n  \"currencyId\": \"{{currencyId}}\",\n  \"initialBalance\": 1000.00,\n  \"color\": \"#4CAF50\"\n}"
        },
        "url": {"raw": "{{baseUrl}}/accounts"}
      }
    },
    {
      "name": "Get All Accounts",
      "request": {
        "method": "GET",
        "header": [{"key": "Authorization", "value": "Bearer {{token}}"}],
        "url": {"raw": "{{baseUrl}}/accounts"}
      }
    },
    {
      "name": "Get Account Summary",
      "request": {
        "method": "GET",
        "header": [{"key": "Authorization", "value": "Bearer {{token}}"}],
        "url": {"raw": "{{baseUrl}}/accounts/summary"}
      }
    }
  ],
  "variable": [
    {"key": "baseUrl", "value": "http://localhost:8080/api"}
  ]
}
```

---

## Next Steps

After accounts are working:
1. ✅ Test all CRUD operations
2. ✅ Create multiple accounts with different currencies
3. ✅ Verify summary calculations
4. 🎯 Move to Transactions API (income/expense/transfer)
5. 🎯 Start Flutter integration

---

## Common Issues

**Issue: Can't delete account**
- Check account balance is zero
- Use GET to verify balance first

**Issue: Invalid color format**
- Use hex format: #RRGGBB or #RGB
- Examples: #4CAF50, #F00

**Issue: Currency/AccountType not found**
- Get valid IDs from `/currencies` and `/accounts/types` first
- Save the UUIDs for use in requests

---

# Category Management API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- Set token in Authorization header: `Bearer YOUR_JWT_TOKEN`

---

## 1. Get All Categories

### Get All Categories (System + Custom)
```bash
curl -X GET "http://localhost:8080/api/categories" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Get Income Categories Only
```bash
curl -X GET "http://localhost:8080/api/categories?type=INCOME" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Get Expense Categories Only
```bash
curl -X GET "http://localhost:8080/api/categories?type=EXPENSE" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Categories retrieved successfully",
  "data": [
    {
      "id": "uuid",
      "name": "Salary",
      "type": "INCOME",
      "color": "#4CAF50",
      "icon": "💼",
      "displayOrder": 1,
      "isSystem": true,
      "isActive": true,
      "parentCategoryId": null,
      "parentCategoryName": null,
      "subCategories": [],
      "createdAt": "2024-01-15T10:30:00",
      "updatedAt": "2024-01-15T10:30:00"
    },
    {
      "id": "uuid",
      "name": "Food & Dining",
      "type": "EXPENSE",
      "color": "#FF5722",
      "icon": "🍽️",
      "displayOrder": 1,
      "isSystem": true,
      "isActive": true,
      "parentCategoryId": null,
      "parentCategoryName": null,
      "subCategories": [],
      "createdAt": "2024-01-15T10:30:00",
      "updatedAt": "2024-01-15T10:30:00"
    }
  ],
  "timestamp": "2024-01-15T10:30:00"
}
```

---

## 2. Get Category by ID

```bash
curl -X GET "http://localhost:8080/api/categories/{categoryId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Category retrieved successfully",
  "data": {
    "id": "uuid",
    "name": "Food & Dining",
    "type": "EXPENSE",
    "color": "#FF5722",
    "icon": "🍽️",
    "displayOrder": 1,
    "isSystem": true,
    "isActive": true,
    "parentCategoryId": null,
    "parentCategoryName": null,
    "subCategories": [
      {
        "id": "uuid",
        "name": "Restaurant",
        "type": "EXPENSE",
        "color": "#FF6B6B",
        "icon": "🍴",
        "displayOrder": 1,
        "isSystem": false,
        "isActive": true,
        "parentCategoryId": "parent-uuid",
        "parentCategoryName": "Food & Dining",
        "subCategories": [],
        "createdAt": "2024-01-15T11:00:00",
        "updatedAt": "2024-01-15T11:00:00"
      }
    ],
    "createdAt": "2024-01-15T10:30:00",
    "updatedAt": "2024-01-15T10:30:00"
  },
  "timestamp": "2024-01-15T12:00:00"
}
```

---

## 3. Create Custom Category

### Create Top-Level Category
```bash
curl -X POST "http://localhost:8080/api/categories" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Freelance Projects",
    "type": "INCOME",
    "color": "#2196F3",
    "icon": "💼"
  }'
```

### Create Subcategory
```bash
curl -X POST "http://localhost:8080/api/categories" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Fast Food",
    "type": "EXPENSE",
    "color": "#FF8A65",
    "icon": "🍔",
    "parentCategoryId": "parent-category-uuid"
  }'
```

**Expected Response (201 Created):**
```json
{
  "success": true,
  "message": "Category created successfully",
  "data": {
    "id": "new-uuid",
    "name": "Freelance Projects",
    "type": "INCOME",
    "color": "#2196F3",
    "icon": "💼",
    "displayOrder": 6,
    "isSystem": false,
    "isActive": true,
    "parentCategoryId": null,
    "parentCategoryName": null,
    "subCategories": [],
    "createdAt": "2024-01-15T12:00:00",
    "updatedAt": "2024-01-15T12:00:00"
  },
  "timestamp": "2024-01-15T12:00:00"
}
```

---

## 4. Update Custom Category

```bash
curl -X PUT "http://localhost:8080/api/categories/{categoryId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Freelance & Consulting",
    "color": "#1976D2",
    "icon": "💻",
    "displayOrder": 2
  }'
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Category updated successfully",
  "data": {
    "id": "uuid",
    "name": "Freelance & Consulting",
    "type": "INCOME",
    "color": "#1976D2",
    "icon": "💻",
    "displayOrder": 2,
    "isSystem": false,
    "isActive": true,
    "parentCategoryId": null,
    "parentCategoryName": null,
    "subCategories": [],
    "createdAt": "2024-01-15T12:00:00",
    "updatedAt": "2024-01-15T12:30:00"
  },
  "timestamp": "2024-01-15T12:30:00"
}
```

---

## 5. Delete Custom Category (Soft Delete)

```bash
curl -X DELETE "http://localhost:8080/api/categories/{categoryId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Category deleted successfully",
  "data": null,
  "timestamp": "2024-01-15T13:00:00"
}
```

---

## Error Responses

### 400 Bad Request - Invalid Data
```json
{
  "success": false,
  "message": "Invalid color format. Use hex color code (e.g., #FF5722)",
  "data": null,
  "timestamp": "2024-01-15T12:00:00"
}
```

### 400 Bad Request - Cannot Update System Category
```json
{
  "success": false,
  "message": "Cannot update system categories",
  "data": null,
  "timestamp": "2024-01-15T12:00:00"
}
```

### 400 Bad Request - Category Has Subcategories
```json
{
  "success": false,
  "message": "Cannot delete category with subcategories. Delete subcategories first.",
  "data": null,
  "timestamp": "2024-01-15T12:00:00"
}
```

### 404 Not Found
```json
{
  "success": false,
  "message": "Category not found with id: {categoryId}",
  "data": null,
  "timestamp": "2024-01-15T12:00:00"
}
```

### 401 Unauthorized
```json
{
  "success": false,
  "message": "Unauthorized",
  "data": null,
  "timestamp": "2024-01-15T12:00:00"
}
```

---

## Default System Categories

### Income Categories (5)
1. 💼 Salary - #4CAF50
2. 💻 Freelance - #2196F3
3. 📈 Investment - #FF9800
4. 🎁 Gift - #E91E63
5. 💰 Other Income - #9C27B0

### Expense Categories (10)
1. 🍽️ Food & Dining - #FF5722
2. 🚗 Transportation - #3F51B5
3. 🛍️ Shopping - #E91E63
4. 🎬 Entertainment - #9C27B0
5. 📄 Bills & Utilities - #FF9800
6. 🏥 Healthcare - #F44336
7. 📚 Education - #2196F3
8. 🏠 Housing - #795548
9. 💇 Personal Care - #00BCD4
10. 💸 Other Expense - #607D8B

---

## Testing Workflow

1. **Login** to get JWT token
2. **Get all categories** to see system categories
3. **Create custom category** (e.g., "Gym" under "Personal Care")
4. **Create subcategory** under existing category
5. **Update category** (change name, color, icon)
6. **Get category by ID** to verify changes
7. **Delete category** (soft delete)
8. **Verify deletion** by getting all categories (should not appear)

---

## Notes

- System categories **cannot be updated or deleted**
- Custom categories can be updated and deleted (soft delete)
- Parent and child categories must have the **same type** (INCOME/EXPENSE)
- Cannot delete a category that has subcategories
- Deleted categories are marked as `isActive: false` (soft delete)
- Categories are automatically initialized on application startup

---

# Budget Management API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- At least one category created
- At least one currency available
- Set token in Authorization header: `Bearer YOUR_JWT_TOKEN`

---

## 1. Create Budget

### Create Monthly Budget for All Expenses
```bash
curl -X POST "http://localhost:8080/api/budgets" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Monthly Expenses Budget",
    "amount": 3000.00,
    "period": "MONTHLY",
    "startDate": "2024-01-01",
    "currencyId": "your-currency-uuid",
    "alertThreshold": 80
  }'
```

### Create Budget for Specific Category (e.g., Food)
```bash
curl -X POST "http://localhost:8080/api/budgets" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Food Budget",
    "amount": 500.00,
    "period": "MONTHLY",
    "startDate": "2024-01-01",
    "currencyId": "your-currency-uuid",
    "categoryId": "food-category-uuid",
    "alertThreshold": 90
  }'
```

### Create Weekly Budget
```bash
curl -X POST "http://localhost:8080/api/budgets" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Weekly Groceries",
    "amount": 150.00,
    "period": "WEEKLY",
    "startDate": "2024-01-01",
    "currencyId": "your-currency-uuid",
    "categoryId": "food-category-uuid"
  }'
```

### Create Custom Period Budget
```bash
curl -X POST "http://localhost:8080/api/budgets" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Vacation Budget",
    "amount": 2000.00,
    "period": "CUSTOM",
    "startDate": "2024-06-01",
    "endDate": "2024-06-30",
    "currencyId": "your-currency-uuid"
  }'
```

**Expected Response (201 Created):**
```json
{
  "success": true,
  "message": "Budget created successfully",
  "data": {
    "id": "uuid",
    "name": "Monthly Expenses Budget",
    "amount": 3000.00,
    "period": "MONTHLY",
    "startDate": "2024-01-01",
    "endDate": "2024-01-31",
    "alertThreshold": 80.00,
    "isActive": true,
    "categoryId": null,
    "categoryName": null,
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-15T10:00:00"
  },
  "timestamp": "2024-01-15T10:00:00"
}
```

---

## 2. Get All Budgets

### Get All Budgets
```bash
curl -X GET "http://localhost:8080/api/budgets" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Get Active Budgets Only
```bash
curl -X GET "http://localhost:8080/api/budgets?activeOnly=true" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Budgets retrieved successfully",
  "data": [
    {
      "id": "uuid",
      "name": "Monthly Expenses Budget",
      "amount": 3000.00,
      "period": "MONTHLY",
      "startDate": "2024-01-01",
      "endDate": "2024-01-31",
      "alertThreshold": 80.00,
      "isActive": true,
      "categoryId": null,
      "categoryName": null,
      "currencyId": "uuid",
      "currencyCode": "USD",
      "currencySymbol": "$",
      "createdAt": "2024-01-15T10:00:00",
      "updatedAt": "2024-01-15T10:00:00"
    },
    {
      "id": "uuid",
      "name": "Food Budget",
      "amount": 500.00,
      "period": "MONTHLY",
      "startDate": "2024-01-01",
      "endDate": "2024-01-31",
      "alertThreshold": 90.00,
      "isActive": true,
      "categoryId": "uuid",
      "categoryName": "Food & Dining",
      "currencyId": "uuid",
      "currencyCode": "USD",
      "currencySymbol": "$",
      "createdAt": "2024-01-15T10:30:00",
      "updatedAt": "2024-01-15T10:30:00"
    }
  ],
  "timestamp": "2024-01-15T11:00:00"
}
```

---

## 3. Get Active Budgets with Progress

This endpoint shows real-time budget tracking with spent amounts and percentages.

```bash
curl -X GET "http://localhost:8080/api/budgets/active" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Active budgets with progress retrieved successfully",
  "data": [
    {
      "id": "uuid",
      "name": "Monthly Expenses Budget",
      "amount": 3000.00,
      "spent": 2100.50,
      "remaining": 899.50,
      "percentageUsed": 70.02,
      "period": "MONTHLY",
      "startDate": "2024-01-01",
      "endDate": "2024-01-31",
      "alertThreshold": 80.00,
      "isOverBudget": false,
      "isNearLimit": false,
      "categoryName": null,
      "currencyCode": "USD",
      "currencySymbol": "$"
    },
    {
      "id": "uuid",
      "name": "Food Budget",
      "amount": 500.00,
      "spent": 425.75,
      "remaining": 74.25,
      "percentageUsed": 85.15,
      "period": "MONTHLY",
      "startDate": "2024-01-01",
      "endDate": "2024-01-31",
      "alertThreshold": 90.00,
      "isOverBudget": false,
      "isNearLimit": false,
      "categoryName": "Food & Dining",
      "currencyCode": "USD",
      "currencySymbol": "$"
    },
    {
      "id": "uuid",
      "name": "Shopping Budget",
      "amount": 300.00,
      "spent": 350.00,
      "remaining": -50.00,
      "percentageUsed": 116.67,
      "period": "MONTHLY",
      "startDate": "2024-01-01",
      "endDate": "2024-01-31",
      "alertThreshold": 80.00,
      "isOverBudget": true,
      "isNearLimit": true,
      "categoryName": "Shopping",
      "currencyCode": "USD",
      "currencySymbol": "$"
    }
  ],
  "timestamp": "2024-01-15T11:30:00"
}
```

**Field Descriptions:**
- `spent`: Total amount spent in this budget period
- `remaining`: Amount left (can be negative if over budget)
- `percentageUsed`: Percentage of budget used
- `isOverBudget`: True if spent > amount
- `isNearLimit`: True if percentageUsed >= alertThreshold

---

## 4. Get Budget by ID

```bash
curl -X GET "http://localhost:8080/api/budgets/{budgetId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Budget retrieved successfully",
  "data": {
    "id": "uuid",
    "name": "Food Budget",
    "amount": 500.00,
    "period": "MONTHLY",
    "startDate": "2024-01-01",
    "endDate": "2024-01-31",
    "alertThreshold": 90.00,
    "isActive": true,
    "categoryId": "uuid",
    "categoryName": "Food & Dining",
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:30:00",
    "updatedAt": "2024-01-15T10:30:00"
  },
  "timestamp": "2024-01-15T12:00:00"
}
```

---

## 5. Update Budget

```bash
curl -X PUT "http://localhost:8080/api/budgets/{budgetId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Food & Groceries Budget",
    "amount": 600.00,
    "alertThreshold": 85
  }'
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Budget updated successfully",
  "data": {
    "id": "uuid",
    "name": "Food & Groceries Budget",
    "amount": 600.00,
    "period": "MONTHLY",
    "startDate": "2024-01-01",
    "endDate": "2024-01-31",
    "alertThreshold": 85.00,
    "isActive": true,
    "categoryId": "uuid",
    "categoryName": "Food & Dining",
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:30:00",
    "updatedAt": "2024-01-15T12:30:00"
  },
  "timestamp": "2024-01-15T12:30:00"
}
```

---

## 6. Delete Budget (Soft Delete)

```bash
curl -X DELETE "http://localhost:8080/api/budgets/{budgetId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Budget deleted successfully",
  "data": null,
  "timestamp": "2024-01-15T13:00:00"
}
```

---

## Budget Periods

### Available Periods
- `DAILY`: Budget for one day
- `WEEKLY`: Budget for one week (7 days)
- `MONTHLY`: Budget for the entire month
- `YEARLY`: Budget for the entire year
- `CUSTOM`: Custom date range (must provide endDate)

### End Date Auto-Calculation
- **DAILY**: Same as start date
- **WEEKLY**: Start date + 6 days
- **MONTHLY**: Last day of the month
- **YEARLY**: Last day of the year (Dec 31)
- **CUSTOM**: Must be provided manually

---

## Testing Workflow

1. **Login** to get JWT token
2. **Get all categories** to get category IDs
3. **Get all currencies** to get currency IDs
4. **Create monthly budget** for all expenses
5. **Create category-specific budgets** (Food, Transport, etc.)
6. **Create some expense transactions** in those categories
7. **Get active budgets with progress** to see real-time tracking
8. **Check if near limit** (percentageUsed >= alertThreshold)
9. **Check if over budget** (spent > amount)
10. **Update budget** to increase amount
11. **Delete budget** when no longer needed

---

## Error Responses

### 400 Bad Request - Invalid Amount
```json
{
  "success": false,
  "message": "Budget amount must be greater than zero",
  "data": null,
  "timestamp": "2024-01-15T10:00:00"
}
```

### 400 Bad Request - Invalid Dates
```json
{
  "success": false,
  "message": "End date must be after start date",
  "data": null,
  "timestamp": "2024-01-15T10:00:00"
}
```

### 404 Not Found - Category
```json
{
  "success": false,
  "message": "Category not found",
  "data": null,
  "timestamp": "2024-01-15T10:00:00"
}
```

### 404 Not Found - Budget
```json
{
  "success": false,
  "message": "Budget not found with id: {budgetId}",
  "data": null,
  "timestamp": "2024-01-15T10:00:00"
}
```

---

## Pro Tips

1. **Alert Threshold**: Set to 80-90% to get warnings before overspending
2. **Category Budgets**: Create specific budgets for problem categories (dining out, shopping)
3. **Global Budget**: Create one budget without category to track total expenses
4. **Multiple Periods**: You can have daily, weekly, and monthly budgets simultaneously
5. **Budget Progress**: Check `/budgets/active` regularly to stay on track
6. **Over Budget**: `isOverBudget: true` means you've exceeded your limit
7. **Near Limit**: `isNearLimit: true` means you're approaching your alert threshold

---

# Dashboard & Statistics API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- Some transactions created (income and expenses)
- At least one account with balance

---

## 1. Get Dashboard Overview

Shows current month's income, expenses, savings, and trends.

```bash
curl -X GET "http://localhost:8080/api/dashboard" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Dashboard data retrieved successfully",
  "data": {
    "totalBalance": 5420.50,
    "monthIncome": 4500.00,
    "monthExpenses": 2150.75,
    "savings": 2349.25,
    "incomeChange": 12.50,
    "expenseChange": -8.30,
    "categoryBreakdown": [
      {
        "categoryId": "uuid",
        "categoryName": "Food & Dining",
        "amount": 750.50,
        "color": "#FF5722",
        "icon": "🍽️"
      },
      {
        "categoryId": "uuid",
        "categoryName": "Transportation",
        "amount": 450.00,
        "color": "#3F51B5",
        "icon": "🚗"
      },
      {
        "categoryId": "uuid",
        "categoryName": "Shopping",
        "amount": 350.25,
        "color": "#E91E63",
        "icon": "🛍️"
      }
    ],
    "recentTransactionsCount": 10,
    "activeBudgetsCount": 3,
    "currentMonth": "2024-01"
  },
  "timestamp": "2024-01-15T16:00:00"
}
```

**Field Descriptions:**
- `totalBalance`: Sum of all account balances (only accounts with `isIncludedInTotal: true`)
- `monthIncome`: Total income for current month
- `monthExpenses`: Total expenses for current month
- `savings`: Income - Expenses
- `incomeChange`: Percentage change from last month (positive = increased)
- `expenseChange`: Percentage change from last month (negative = decreased)
- `categoryBreakdown`: Top spending categories sorted by amount

---

## 2. Get Statistics for Date Range

Get detailed statistics for any custom date range.

```bash
curl -X GET "http://localhost:8080/api/dashboard/statistics?startDate=2024-01-01&endDate=2024-01-31" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Statistics retrieved successfully",
  "data": {
    "startDate": "2024-01-01",
    "endDate": "2024-01-31",
    "totalIncome": 4500.00,
    "totalExpenses": 2150.75,
    "netIncome": 2349.25,
    "avgDailyIncome": 145.16,
    "avgDailyExpense": 69.38,
    "expensesByCategory": [
      {
        "categoryId": "uuid",
        "categoryName": "Food & Dining",
        "amount": 750.50,
        "color": "#FF5722",
        "icon": "🍽️"
      },
      {
        "categoryId": "uuid",
        "categoryName": "Transportation",
        "amount": 450.00,
        "color": "#3F51B5",
        "icon": "🚗"
      }
    ],
    "incomeByCategory": [
      {
        "categoryId": "uuid",
        "categoryName": "Salary",
        "amount": 4000.00,
        "color": "#4CAF50",
        "icon": "💼"
      },
      {
        "categoryId": "uuid",
        "categoryName": "Freelance",
        "amount": 500.00,
        "color": "#2196F3",
        "icon": "💻"
      }
    ],
    "dailyTrends": [
      {
        "date": "2024-01-01",
        "income": 0.00,
        "expenses": 50.00,
        "net": -50.00
      },
      {
        "date": "2024-01-02",
        "income": 0.00,
        "expenses": 125.50,
        "net": -125.50
      },
      {
        "date": "2024-01-05",
        "income": 4000.00,
        "expenses": 0.00,
        "net": 4000.00
      }
    ]
  },
  "timestamp": "2024-01-15T16:30:00"
}
```

**Field Descriptions:**
- `totalIncome`: Total income in date range
- `totalExpenses`: Total expenses in date range
- `netIncome`: Income - Expenses (can be negative)
- `avgDailyIncome`: Average income per day
- `avgDailyExpense`: Average expense per day
- `expensesByCategory`: All expense categories sorted by amount
- `incomeByCategory`: All income categories sorted by amount
- `dailyTrends`: Day-by-day breakdown (useful for charts)

---

## 3. Get This Month's Statistics

Quick shortcut for current month statistics.

```bash
curl -X GET "http://localhost:8080/api/dashboard/statistics/this-month" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Response:** Same format as custom date range, but automatically uses current month dates.

---

## 4. Get Last Month's Statistics

Compare with previous month performance.

```bash
curl -X GET "http://localhost:8080/api/dashboard/statistics/last-month" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Response:** Same format, but for last month.

---

## 5. Get This Year's Statistics

Annual overview of income and expenses.

```bash
curl -X GET "http://localhost:8080/api/dashboard/statistics/this-year" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Response:** Same format, but for entire current year (Jan 1 - Dec 31).

---

## Use Cases

### 1. Monthly Budget Review
```bash
# Compare this month vs last month
curl "http://localhost:8080/api/dashboard/statistics/this-month" -H "Authorization: Bearer $JWT"
curl "http://localhost:8080/api/dashboard/statistics/last-month" -H "Authorization: Bearer $JWT"
```

### 2. Quarterly Analysis
```bash
# Q1 2024
curl "http://localhost:8080/api/dashboard/statistics?startDate=2024-01-01&endDate=2024-03-31" \
  -H "Authorization: Bearer $JWT"
```

### 3. Year-over-Year Comparison
```bash
# 2024 vs 2023
curl "http://localhost:8080/api/dashboard/statistics?startDate=2024-01-01&endDate=2024-12-31" -H "Authorization: Bearer $JWT"
curl "http://localhost:8080/api/dashboard/statistics?startDate=2023-01-01&endDate=2023-12-31" -H "Authorization: Bearer $JWT"
```

### 4. Spending Patterns
```bash
# Last 7 days
WEEK_AGO=$(date -d "7 days ago" +%Y-%m-%d)
TODAY=$(date +%Y-%m-%d)

curl "http://localhost:8080/api/dashboard/statistics?startDate=$WEEK_AGO&endDate=$TODAY" \
  -H "Authorization: Bearer $JWT"
```

---

## Chart Data Usage

### Category Pie Chart
Use `expensesByCategory` or `incomeByCategory`:
```javascript
const pieChartData = response.data.expensesByCategory.map(cat => ({
  label: cat.categoryName,
  value: cat.amount,
  color: cat.color
}));
```

### Income vs Expense Bar Chart
Use `dailyTrends`:
```javascript
const barChartData = response.data.dailyTrends.map(day => ({
  date: day.date,
  income: day.income,
  expenses: day.expenses
}));
```

### Net Income Line Chart
Use `dailyTrends`:
```javascript
const lineChartData = response.data.dailyTrends.map(day => ({
  date: day.date,
  net: day.net
}));
```

---

## Testing Workflow

1. **Create test data:**
    - Create 2-3 accounts
    - Add various income transactions (salary, freelance)
    - Add expense transactions in different categories
    - Spread transactions across multiple days

2. **Test dashboard:**
   ```bash
   curl "http://localhost:8080/api/dashboard" -H "Authorization: Bearer $JWT"
   ```

3. **Check month comparison:**
    - Note the `incomeChange` and `expenseChange` percentages
    - These compare current month to previous month

4. **Analyze spending by category:**
    - Look at `categoryBreakdown` in dashboard
    - See which categories have highest spending

5. **Get detailed statistics:**
   ```bash
   curl "http://localhost:8080/api/dashboard/statistics/this-month" -H "Authorization: Bearer $JWT"
   ```

6. **Review daily trends:**
    - Check `dailyTrends` array
    - Useful for seeing spending patterns by day

7. **Custom date range:**
   ```bash
   curl "http://localhost:8080/api/dashboard/statistics?startDate=2024-01-01&endDate=2024-01-15" \
     -H "Authorization: Bearer $JWT"
   ```

---

## Insights You Can Get

### Dashboard Overview (`/dashboard`)
- ✅ Current total balance
- ✅ This month's income & expenses
- ✅ Savings (income - expenses)
- ✅ Percentage change from last month
- ✅ Top spending categories
- ✅ Recent activity count
- ✅ Active budget count

### Statistics (`/dashboard/statistics`)
- ✅ Total income & expenses for any period
- ✅ Net income (profit/loss)
- ✅ Average daily income & expense
- ✅ Complete category breakdowns
- ✅ Day-by-day trends for charts
- ✅ Both income and expense categories

---

## Error Responses

### 400 Bad Request - Invalid Date Format
```json
{
  "success": false,
  "message": "Invalid date format. Use YYYY-MM-DD",
  "data": null,
  "timestamp": "2024-01-15T16:00:00"
}
```

### 401 Unauthorized
```json
{
  "success": false,
  "message": "Unauthorized",
  "data": null,
  "timestamp": "2024-01-15T16:00:00"
}
```

---

## Pro Tips

1. **Dashboard First**: Always load `/dashboard` for overview before diving into details
2. **Date Ranges**: Use shortcuts (`this-month`, `last-month`, `this-year`) when possible
3. **Daily Trends**: Perfect for line/bar charts in your frontend
4. **Category Breakdown**: Use for pie/donut charts to show spending distribution
5. **Percentage Changes**: Green/red indicators based on positive/negative changes
6. **Zero Values**: Categories with $0 won't appear in breakdown
7. **Performance**: Statistics endpoint can be slow for large date ranges
8. **Caching**: Consider caching dashboard data for 5-10 minutes on frontend
9. **Comparison**: Fetch multiple periods and compare trends
10. **Mobile**: Dashboard endpoint perfect for mobile home screen widget

---

# Goals Management API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- At least one currency available
- Optional: account to link goal to

---

## 1. Create Financial Goal

### Create Savings Goal
```bash
curl -X POST "http://localhost:8080/api/goals" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Emergency Fund",
    "description": "Save 6 months of expenses",
    "targetAmount": 15000.00,
    "initialAmount": 2000.00,
    "targetDate": "2024-12-31",
    "currencyId": "your-currency-uuid",
    "color": "#4CAF50",
    "icon": "💰"
  }'
```

### Create Vacation Goal
```bash
curl -X POST "http://localhost:8080/api/goals" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Summer Vacation",
    "description": "Trip to Hawaii",
    "targetAmount": 5000.00,
    "targetDate": "2024-07-01",
    "currencyId": "your-currency-uuid",
    "color": "#FF9800",
    "icon": "✈️"
  }'
```

### Create Goal Linked to Account
```bash
curl -X POST "http://localhost:8080/api/goals" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "New Car",
    "description": "Down payment for Tesla Model 3",
    "targetAmount": 10000.00,
    "initialAmount": 1500.00,
    "targetDate": "2025-06-01",
    "currencyId": "your-currency-uuid",
    "accountId": "savings-account-uuid",
    "color": "#2196F3",
    "icon": "🚗"
  }'
```

**Expected Response (201 Created):**
```json
{
  "success": true,
  "message": "Goal created successfully",
  "data": {
    "id": "goal-uuid",
    "name": "Emergency Fund",
    "description": "Save 6 months of expenses",
    "targetAmount": 15000.00,
    "currentAmount": 2000.00,
    "remaining": 13000.00,
    "percentageComplete": 13.33,
    "targetDate": "2024-12-31",
    "color": "#4CAF50",
    "icon": "💰",
    "isCompleted": false,
    "accountId": null,
    "accountName": null,
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-15T10:00:00"
  },
  "timestamp": "2024-01-15T10:00:00"
}
```

---

## 2. Get All Goals

### Get All Goals (Active + Completed)
```bash
curl -X GET "http://localhost:8080/api/goals" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Get Active Goals Only
```bash
curl -X GET "http://localhost:8080/api/goals?activeOnly=true" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Goals retrieved successfully",
  "data": [
    {
      "id": "goal-uuid-1",
      "name": "Emergency Fund",
      "description": "Save 6 months of expenses",
      "targetAmount": 15000.00,
      "currentAmount": 5000.00,
      "remaining": 10000.00,
      "percentageComplete": 33.33,
      "targetDate": "2024-12-31",
      "color": "#4CAF50",
      "icon": "💰",
      "isCompleted": false,
      "accountId": null,
      "accountName": null,
      "currencyId": "uuid",
      "currencyCode": "USD",
      "currencySymbol": "$",
      "createdAt": "2024-01-15T10:00:00",
      "updatedAt": "2024-01-20T14:30:00"
    },
    {
      "id": "goal-uuid-2",
      "name": "Summer Vacation",
      "description": "Trip to Hawaii",
      "targetAmount": 5000.00,
      "currentAmount": 5000.00,
      "remaining": 0.00,
      "percentageComplete": 100.00,
      "targetDate": "2024-07-01",
      "color": "#FF9800",
      "icon": "✈️",
      "isCompleted": true,
      "accountId": null,
      "accountName": null,
      "currencyId": "uuid",
      "currencyCode": "USD",
      "currencySymbol": "$",
      "createdAt": "2024-01-10T09:00:00",
      "updatedAt": "2024-05-01T16:00:00"
    }
  ],
  "timestamp": "2024-01-20T15:00:00"
}
```

---

## 3. Get Goal by ID

```bash
curl -X GET "http://localhost:8080/api/goals/{goalId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Goal retrieved successfully",
  "data": {
    "id": "goal-uuid",
    "name": "Emergency Fund",
    "description": "Save 6 months of expenses",
    "targetAmount": 15000.00,
    "currentAmount": 5000.00,
    "remaining": 10000.00,
    "percentageComplete": 33.33,
    "targetDate": "2024-12-31",
    "color": "#4CAF50",
    "icon": "💰",
    "isCompleted": false,
    "accountId": null,
    "accountName": null,
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-20T14:30:00"
  },
  "timestamp": "2024-01-20T15:30:00"
}
```

---

## 4. Update Goal Progress

Add money to goal progress (positive amount) or withdraw (negative amount).

### Add $500 to Goal
```bash
curl -X PATCH "http://localhost:8080/api/goals/{goalId}/progress" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": 500.00
  }'
```

### Withdraw $100 from Goal
```bash
curl -X PATCH "http://localhost:8080/api/goals/{goalId}/progress" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": -100.00
  }'
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Goal progress updated successfully",
  "data": {
    "id": "goal-uuid",
    "name": "Emergency Fund",
    "description": "Save 6 months of expenses",
    "targetAmount": 15000.00,
    "currentAmount": 5500.00,
    "remaining": 9500.00,
    "percentageComplete": 36.67,
    "targetDate": "2024-12-31",
    "color": "#4CAF50",
    "icon": "💰",
    "isCompleted": false,
    "accountId": null,
    "accountName": null,
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-20T16:00:00"
  },
  "timestamp": "2024-01-20T16:00:00"
}
```

---

## 5. Update Goal Details

```bash
curl -X PUT "http://localhost:8080/api/goals/{goalId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Emergency Fund - 2024",
    "targetAmount": 20000.00,
    "targetDate": "2024-12-31",
    "color": "#2E7D32"
  }'
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Goal updated successfully",
  "data": {
    "id": "goal-uuid",
    "name": "Emergency Fund - 2024",
    "description": "Save 6 months of expenses",
    "targetAmount": 20000.00,
    "currentAmount": 5500.00,
    "remaining": 14500.00,
    "percentageComplete": 27.50,
    "targetDate": "2024-12-31",
    "color": "#2E7D32",
    "icon": "💰",
    "isCompleted": false,
    "accountId": null,
    "accountName": null,
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-20T16:30:00"
  },
  "timestamp": "2024-01-20T16:30:00"
}
```

---

## 6. Mark Goal as Completed

Manually mark a goal as completed (sets currentAmount = targetAmount).

```bash
curl -X PATCH "http://localhost:8080/api/goals/{goalId}/complete" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Goal marked as completed",
  "data": {
    "id": "goal-uuid",
    "name": "Summer Vacation",
    "description": "Trip to Hawaii",
    "targetAmount": 5000.00,
    "currentAmount": 5000.00,
    "remaining": 0.00,
    "percentageComplete": 100.00,
    "targetDate": "2024-07-01",
    "color": "#FF9800",
    "icon": "✈️",
    "isCompleted": true,
    "accountId": null,
    "accountName": null,
    "currencyId": "uuid",
    "currencyCode": "USD",
    "currencySymbol": "$",
    "createdAt": "2024-01-10T09:00:00",
    "updatedAt": "2024-05-01T16:00:00"
  },
  "timestamp": "2024-05-01T16:00:00"
}
```

---

## 7. Delete Goal

```bash
curl -X DELETE "http://localhost:8080/api/goals/{goalId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Goal deleted successfully",
  "data": null,
  "timestamp": "2024-01-20T17:00:00"
}
```

---

## Goal Completion

Goals are **automatically marked as completed** when:
- `currentAmount >= targetAmount`

This happens:
1. When creating a goal with `initialAmount >= targetAmount`
2. When updating progress and total reaches target
3. When manually marked as completed

---

## Error Responses

### 400 Bad Request - Negative Progress
```json
{
  "success": false,
  "message": "Goal progress cannot be negative",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

### 400 Bad Request - Update Completed Goal
```json
{
  "success": false,
  "message": "Cannot update progress for completed goal",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

### 400 Bad Request - Invalid Amount
```json
{
  "success": false,
  "message": "Target amount must be greater than zero",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

### 404 Not Found - Goal
```json
{
  "success": false,
  "message": "Goal not found with id: {goalId}",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

---

## Testing Workflow

1. **Create multiple goals** with different targets:
   ```bash
   # Emergency fund - long term
   # Vacation - short term
   # New gadget - small amount
   ```

2. **Add initial amounts** to some goals:
   ```bash
   # Start with some progress already made
   ```

3. **Update progress regularly**:
   ```bash
   # Add $100 to emergency fund
   # Add $500 to vacation
   ```

4. **Track progress**:
   ```bash
   # Get all goals
   # Check percentageComplete
   # Check remaining amount
   ```

5. **Complete a goal**:
   ```bash
   # Keep adding until currentAmount >= targetAmount
   # Goal automatically marked as completed
   ```

6. **Filter active goals**:
   ```bash
   # Use ?activeOnly=true to see only in-progress goals
   ```

---

## Common Goal Types

### 1. Emergency Fund
```json
{
  "name": "Emergency Fund",
  "targetAmount": 15000.00,
  "targetDate": "2024-12-31",
  "icon": "💰",
  "color": "#4CAF50"
}
```

### 2. Vacation/Travel
```json
{
  "name": "Europe Trip",
  "targetAmount": 5000.00,
  "targetDate": "2024-08-15",
  "icon": "✈️",
  "color": "#FF9800"
}
```

### 3. Major Purchase
```json
{
  "name": "New Laptop",
  "targetAmount": 2000.00,
  "targetDate": "2024-06-01",
  "icon": "💻",
  "color": "#2196F3"
}
```

### 4. Home Down Payment
```json
{
  "name": "House Down Payment",
  "targetAmount": 50000.00,
  "targetDate": "2025-12-31",
  "icon": "🏠",
  "color": "#795548"
}
```

### 5. Education Fund
```json
{
  "name": "Master's Degree",
  "targetAmount": 30000.00,
  "targetDate": "2026-09-01",
  "icon": "🎓",
  "color": "#673AB7"
}
```

---

## Pro Tips

1. **Link to Savings Account**: Create goals linked to specific savings accounts
2. **Regular Updates**: Update progress monthly or per paycheck
3. **Realistic Targets**: Set achievable targets with reasonable timelines
4. **Multiple Goals**: Have 3-5 active goals at once (short + long term)
5. **Progress Tracking**: Use percentageComplete for progress bars in UI
6. **Visual Indicators**: Use different colors/icons for different goal types
7. **Target Dates**: Optional but helps with motivation
8. **Initial Amount**: Start with current savings if transferring to goal
9. **Auto-Complete**: Goals complete automatically when target reached
10. **Celebrate**: When goal completes, create new goal to maintain momentum!

---

## Example: Complete Goal Flow

```bash
# 1. Create goal
GOAL_ID=$(curl -X POST "http://localhost:8080/api/goals" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Nintendo Switch",
    "targetAmount": 350.00,
    "currencyId": "'$CURRENCY_ID'",
    "icon": "🎮",
    "color": "#E91E63"
  }' | jq -r '.data.id')

# 2. Add weekly progress ($50/week)
curl -X PATCH "http://localhost:8080/api/goals/$GOAL_ID/progress" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{"amount": 50.00}'

# 3. Check progress (repeat weekly)
curl "http://localhost:8080/api/goals/$GOAL_ID" \
  -H "Authorization: Bearer $JWT"

# 4. Goal auto-completes after 7 weeks!
# 5. Get all active goals (Switch will be filtered out)
curl "http://localhost:8080/api/goals?activeOnly=true" \
  -H "Authorization: Bearer $JWT"
```

---

# Transactions API - Testing Guide

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

---

# User Preferences API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- User account created

---

## 1. Get User Preferences

First time calling this endpoint will create default preferences automatically.

```bash
curl -X GET "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK) - First Time:**
```json
{
  "success": true,
  "message": "User preferences retrieved successfully",
  "data": {
    "userId": "user-uuid",
    "defaultCurrencyId": "usd-currency-uuid",
    "defaultCurrencyCode": "USD",
    "defaultCurrencySymbol": "$",
    "language": "en",
    "dateFormat": "DD/MM/YYYY",
    "firstDayOfWeek": 1,
    "theme": "SYSTEM",
    "timezone": "UTC",
    "enableNotifications": true,
    "enableBiometric": false,
    "autoBackup": false,
    "createdAt": "2024-01-20T10:00:00",
    "updatedAt": "2024-01-20T10:00:00"
  },
  "timestamp": "2024-01-20T10:00:00"
}
```

---

## 2. Update User Preferences

### Update Default Currency
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "defaultCurrencyId": "eur-currency-uuid"
  }'
```

### Update Language
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "language": "es"
  }'
```

### Update Date Format
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "dateFormat": "MM/DD/YYYY"
  }'
```

### Update First Day of Week
```bash
# 0 = Sunday, 1 = Monday, 6 = Saturday
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "firstDayOfWeek": 0
  }'
```

### Update Theme
```bash
# Options: LIGHT, DARK, SYSTEM
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "theme": "DARK"
  }'
```

### Update Notification Settings
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "enableNotifications": false
  }'
```

### Update Biometric Setting
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "enableBiometric": true
  }'
```

### Update Auto-Backup Setting
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "autoBackup": true
  }'
```

### Update Multiple Settings at Once
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "defaultCurrencyId": "eur-currency-uuid",
    "language": "fr",
    "dateFormat": "DD/MM/YYYY",
    "theme": "DARK",
    "timezone": "UTC",
    "enableNotifications": true,
    "enableBiometric": true
  }'
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "User preferences updated successfully",
  "data": {
    "userId": "user-uuid",
    "defaultCurrencyId": "eur-currency-uuid",
    "defaultCurrencyCode": "EUR",
    "defaultCurrencySymbol": "€",
    "language": "fr",
    "dateFormat": "DD/MM/YYYY",
    "firstDayOfWeek": 1,
    "theme": "DARK",
    "enableNotifications": true,
    "enableBiometric": true,
    "autoBackup": false,
    "createdAt": "2024-01-20T10:00:00",
    "updatedAt": "2024-01-20T15:30:00"
  },
  "timestamp": "2024-01-20T15:30:00"
}
```

---

## 3. Reset to Default Preferences

Resets all preferences back to default values.

```bash
curl -X POST "http://localhost:8080/api/user/preferences/reset" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "User preferences reset to default successfully",
  "data": {
    "userId": "user-uuid",
    "defaultCurrencyId": "usd-currency-uuid",
    "defaultCurrencyCode": "USD",
    "defaultCurrencySymbol": "$",
    "language": "en",
    "dateFormat": "DD/MM/YYYY",
    "firstDayOfWeek": 1,
    "theme": "SYSTEM",
    "enableNotifications": true,
    "enableBiometric": false,
    "autoBackup": false,
    "createdAt": "2024-01-20T16:00:00",
    "updatedAt": "2024-01-20T16:00:00"
  },
  "timestamp": "2024-01-20T16:00:00"
}
```

---

## Preference Options

### Language Codes
Common language codes (ISO 639-1):
- `en` - English
- `es` - Spanish
- `fr` - French
- `de` - German
- `it` - Italian
- `pt` - Portuguese
- `zh` - Chinese
- `ja` - Japanese
- `ko` - Korean
- `ar` - Arabic

With region (optional):
- `en-US` - English (United States)
- `en-GB` - English (United Kingdom)
- `es-ES` - Spanish (Spain)
- `es-MX` - Spanish (Mexico)
- `pt-BR` - Portuguese (Brazil)
- `zh-CN` - Chinese (Simplified)
- `zh-TW` - Chinese (Traditional)

### Date Format Options
- `DD/MM/YYYY` - Day first (Europe, most of world)
- `MM/DD/YYYY` - Month first (United States)
- `YYYY-MM-DD` - ISO format
- `DD.MM.YYYY` - Dot separator
- `DD-MM-YYYY` - Dash separator

### First Day of Week
- `0` - Sunday
- `1` - Monday (default, ISO standard)
- `2` - Tuesday
- `3` - Wednesday
- `4` - Thursday
- `5` - Friday
- `6` - Saturday

### Theme Options
- `LIGHT` - Light mode always
- `DARK` - Dark mode always
- `SYSTEM` - Follow system settings (default)

### Boolean Settings
- `enableNotifications` - Push/email notifications
- `enableBiometric` - Fingerprint/Face ID login
- `autoBackup` - Automatic data backup

---

## Use Cases

### 1. User Onboarding
```bash
# Set preferences during registration
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "defaultCurrencyId": "'$CURRENCY_ID'",
    "language": "en-US",
    "dateFormat": "MM/DD/YYYY",
    "firstDayOfWeek": 0,
    "theme": "SYSTEM"
  }'
```

### 2. European User Setup
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "defaultCurrencyId": "'$EUR_ID'",
    "language": "de",
    "dateFormat": "DD.MM.YYYY",
    "firstDayOfWeek": 1
  }'
```

### 3. Mobile App Configuration
```bash
# Enable biometric and notifications
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "enableBiometric": true,
    "enableNotifications": true,
    "autoBackup": true
  }'
```

### 4. Privacy-Focused User
```bash
# Disable all optional features
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "enableNotifications": false,
    "enableBiometric": false,
    "autoBackup": false
  }'
```

---

## Testing Workflow

1. **Get initial preferences** (auto-creates default)
```bash
curl "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT"
```

2. **Update currency** to user's preferred currency
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT" \
  -d '{"defaultCurrencyId": "'$CURRENCY_ID'"}'
```

3. **Set language and locale**
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT" \
  -d '{"language": "en-US", "dateFormat": "MM/DD/YYYY"}'
```

4. **Configure theme**
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT" \
  -d '{"theme": "DARK"}'
```

5. **Enable features**
```bash
curl -X PUT "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT" \
  -d '{"enableNotifications": true, "enableBiometric": true}'
```

6. **Verify changes**
```bash
curl "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT"
```

7. **Test reset**
```bash
curl -X POST "http://localhost:8080/api/user/preferences/reset" \
  -H "Authorization: Bearer $JWT"
```

---

## Error Responses

### 400 Bad Request - Invalid Language Code
```json
{
  "success": false,
  "message": "Invalid language code format (e.g., en, en-US)",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

### 400 Bad Request - Invalid First Day
```json
{
  "success": false,
  "message": "First day of week must be between 0 (Sunday) and 6 (Saturday)",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

### 404 Not Found - Currency
```json
{
  "success": false,
  "message": "Currency not found",
  "data": null,
  "timestamp": "2024-01-20T15:00:00"
}
```

---

## Integration with Frontend

### React Example
```javascript
// Get preferences on app load
const getPreferences = async () => {
  const response = await fetch('/api/user/preferences', {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  const data = await response.json();

  // Apply theme
  document.body.classList.add(data.data.theme.toLowerCase());

  // Set language
  i18n.changeLanguage(data.data.language);

  // Configure date format
  setDateFormat(data.data.dateFormat);
};

// Update preferences
const updatePreferences = async (updates) => {
  await fetch('/api/user/preferences', {
    method: 'PUT',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(updates)
  });
};
```

### Flutter Example
```dart
// Get preferences
Future<UserPreferences> getPreferences() async {
  final response = await http.get(
    Uri.parse('$baseUrl/user/preferences'),
    headers: {'Authorization': 'Bearer $token'},
  );
  return UserPreferences.fromJson(jsonDecode(response.body)['data']);
}

// Apply theme
void applyTheme(String theme) {
  if (theme == 'DARK') {
    ThemeMode.dark;
  } else if (theme == 'LIGHT') {
    ThemeMode.light;
  } else {
    ThemeMode.system;
  }
}
```

---

## Default Values

When preferences are first created:
- **Currency**: USD (or first available currency)
- **Language**: `en`
- **Date Format**: `DD/MM/YYYY`
- **First Day**: `1` (Monday)
- **Theme**: `SYSTEM`
- **Notifications**: `true`
- **Biometric**: `false`
- **Auto-Backup**: `false`

---

## Pro Tips

1. **Auto-Create**: Preferences are created automatically on first GET
2. **Partial Updates**: Only send fields you want to change
3. **Theme Sync**: Use SYSTEM to follow device settings
4. **Currency Impact**: Changing currency affects new transactions/budgets
5. **Language Codes**: Use ISO 639-1 format (2 letters) or with region
6. **Date Format**: Frontend should format dates according to preference
7. **First Day**: Affects calendar views and "this week" calculations
8. **Biometric**: Mobile apps should respect this setting
9. **Notifications**: Backend should check before sending notifications
10. **Reset Carefully**: Reset will lose all custom preferences

---

## Example: Complete Setup Flow

```bash
# 1. Register user
curl -X POST "http://localhost:8080/api/auth/register" -d '{...}'

# 2. Login
JWT=$(curl -X POST "http://localhost:8080/api/auth/login" -d '{...}' | jq -r '.data.accessToken')

# 3. Get currencies
CURRENCY=$(curl "http://localhost:8080/api/currencies" -H "Authorization: Bearer $JWT" | jq -r '.data[0].id')

# 4. Set preferences
curl -X PUT "http://localhost:8080/api/user/preferences" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "defaultCurrencyId": "'$CURRENCY'",
    "language": "en-US",
    "dateFormat": "MM/DD/YYYY",
    "firstDayOfWeek": 0,
    "theme": "DARK",
    "enableNotifications": true,
    "enableBiometric": true
  }'

# 5. Verify
curl "http://localhost:8080/api/user/preferences" -H "Authorization: Bearer $JWT"
```

---

# Recurring Transactions API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- At least one account created
- At least one category available

---

## 1. Create Recurring Transaction

### Monthly Rent Payment
```bash
curl -X POST "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "checking-account-uuid",
    "type": "EXPENSE",
    "amount": 1500.00,
    "description": "Monthly Rent",
    "categoryId": "housing-category-uuid",
    "frequency": "MONTHLY",
    "intervalValue": 1,
    "startDate": "2024-01-01"
  }'
```

### Weekly Groceries Budget
```bash
curl -X POST "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "checking-account-uuid",
    "type": "EXPENSE",
    "amount": 150.00,
    "description": "Weekly Groceries",
    "categoryId": "food-category-uuid",
    "frequency": "WEEKLY",
    "intervalValue": 1,
    "startDate": "2024-01-01"
  }'
```

### Bi-Weekly Salary
```bash
curl -X POST "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "checking-account-uuid",
    "type": "INCOME",
    "amount": 2500.00,
    "description": "Bi-Weekly Salary",
    "categoryId": "salary-category-uuid",
    "frequency": "WEEKLY",
    "intervalValue": 2,
    "startDate": "2024-01-05"
  }'
```

### Monthly Auto-Transfer to Savings
```bash
curl -X POST "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "checking-account-uuid",
    "toAccountId": "savings-account-uuid",
    "type": "TRANSFER",
    "amount": 500.00,
    "description": "Monthly Auto-Save",
    "frequency": "MONTHLY",
    "intervalValue": 1,
    "startDate": "2024-01-10"
  }'
```

### Subscription with End Date
```bash
curl -X POST "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "checking-account-uuid",
    "type": "EXPENSE",
    "amount": 9.99,
    "description": "Netflix Subscription",
    "categoryId": "entertainment-category-uuid",
    "frequency": "MONTHLY",
    "intervalValue": 1,
    "startDate": "2024-01-01",
    "endDate": "2024-12-31"
  }'
```

### Quarterly Bills
```bash
curl -X POST "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "checking-account-uuid",
    "type": "EXPENSE",
    "amount": 250.00,
    "description": "Quarterly Insurance",
    "categoryId": "bills-category-uuid",
    "frequency": "MONTHLY",
    "intervalValue": 3,
    "startDate": "2024-01-01"
  }'
```

**Expected Response (201 Created):**
```json
{
  "success": true,
  "message": "Recurring transaction created successfully",
  "data": {
    "id": "recurring-uuid",
    "accountId": "account-uuid",
    "accountName": "Main Checking",
    "toAccountId": null,
    "toAccountName": null,
    "categoryId": "category-uuid",
    "categoryName": "Housing",
    "type": "EXPENSE",
    "amount": 1500.00,
    "currencyCode": "USD",
    "currencySymbol": "$",
    "description": "Monthly Rent",
    "frequency": "MONTHLY",
    "intervalValue": 1,
    "startDate": "2024-01-01",
    "endDate": null,
    "nextOccurrenceDate": "2024-01-01",
    "lastGeneratedDate": null,
    "isActive": true,
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-15T10:00:00"
  },
  "timestamp": "2024-01-15T10:00:00"
}
```

---

## 2. Get All Recurring Transactions

### Get All (Active + Inactive)
```bash
curl -X GET "http://localhost:8080/api/recurring-transactions" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Get Active Only
```bash
curl -X GET "http://localhost:8080/api/recurring-transactions?activeOnly=true" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Recurring transactions retrieved successfully",
  "data": [
    {
      "id": "recurring-uuid-1",
      "accountId": "account-uuid",
      "accountName": "Main Checking",
      "toAccountId": null,
      "toAccountName": null,
      "categoryId": "category-uuid",
      "categoryName": "Housing",
      "type": "EXPENSE",
      "amount": 1500.00,
      "currencyCode": "USD",
      "currencySymbol": "$",
      "description": "Monthly Rent",
      "frequency": "MONTHLY",
      "intervalValue": 1,
      "startDate": "2024-01-01",
      "endDate": null,
      "nextOccurrenceDate": "2024-02-01",
      "lastGeneratedDate": "2024-01-01",
      "isActive": true,
      "createdAt": "2024-01-15T10:00:00",
      "updatedAt": "2024-01-15T10:00:00"
    },
    {
      "id": "recurring-uuid-2",
      "accountId": "checking-uuid",
      "accountName": "Main Checking",
      "toAccountId": "savings-uuid",
      "toAccountName": "Emergency Savings",
      "categoryId": null,
      "categoryName": null,
      "type": "TRANSFER",
      "amount": 500.00,
      "currencyCode": "USD",
      "currencySymbol": "$",
      "description": "Monthly Auto-Save",
      "frequency": "MONTHLY",
      "intervalValue": 1,
      "startDate": "2024-01-10",
      "endDate": null,
      "nextOccurrenceDate": "2024-02-10",
      "lastGeneratedDate": "2024-01-10",
      "isActive": true,
      "createdAt": "2024-01-15T11:00:00",
      "updatedAt": "2024-01-15T11:00:00"
    }
  ],
  "timestamp": "2024-01-20T14:00:00"
}
```

---

## 3. Get Recurring Transaction by ID

```bash
curl -X GET "http://localhost:8080/api/recurring-transactions/{id}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

---

## 4. Update Recurring Transaction

```bash
curl -X PUT "http://localhost:8080/api/recurring-transactions/{id}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": 1600.00,
    "description": "Monthly Rent (Updated)",
    "endDate": "2024-12-31"
  }'
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Recurring transaction updated successfully",
  "data": {
    "id": "recurring-uuid",
    "accountId": "account-uuid",
    "accountName": "Main Checking",
    "toAccountId": null,
    "toAccountName": null,
    "categoryId": "category-uuid",
    "categoryName": "Housing",
    "type": "EXPENSE",
    "amount": 1600.00,
    "currencyCode": "USD",
    "currencySymbol": "$",
    "description": "Monthly Rent (Updated)",
    "frequency": "MONTHLY",
    "intervalValue": 1,
    "startDate": "2024-01-01",
    "endDate": "2024-12-31",
    "nextOccurrenceDate": "2024-02-01",
    "lastGeneratedDate": "2024-01-01",
    "isActive": true,
    "createdAt": "2024-01-15T10:00:00",
    "updatedAt": "2024-01-20T15:00:00"
  },
  "timestamp": "2024-01-20T15:00:00"
}
```

---

## 5. Pause/Resume Recurring Transaction

### Pause (Deactivate)
```bash
curl -X PUT "http://localhost:8080/api/recurring-transactions/{id}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "isActive": false
  }'
```

### Resume (Activate)
```bash
curl -X PUT "http://localhost:8080/api/recurring-transactions/{id}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "isActive": true
  }'
```

---

## 6. Delete Recurring Transaction

```bash
curl -X DELETE "http://localhost:8080/api/recurring-transactions/{id}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Recurring transaction deleted successfully",
  "data": null,
  "timestamp": "2024-01-20T16:00:00"
}
```

---

## Frequency Options

### Available Frequencies
- `DAILY`: Every N days
- `WEEKLY`: Every N weeks
- `MONTHLY`: Every N months
- `YEARLY`: Every N years

### Interval Value Examples
- `intervalValue: 1` with `WEEKLY` = Every week
- `intervalValue: 2` with `WEEKLY` = Every 2 weeks (bi-weekly)
- `intervalValue: 3` with `MONTHLY` = Every 3 months (quarterly)
- `intervalValue: 6` with `MONTHLY` = Every 6 months (semi-annually)

---

## Automatic Transaction Generation

### How It Works
- **Scheduled Job**: Runs daily at 1:00 AM
- **Checks**: All recurring transactions with `nextOccurrenceDate <= today`
- **Generates**: New transaction from recurring template
- **Updates**: Account balances automatically
- **Advances**: `nextOccurrenceDate` to next occurrence
- **Deactivates**: If `endDate` is reached

### What Gets Generated
1. A new transaction with:
    - Same amount, category, description
    - `transactionDate` = current date/time
    - `isRecurring: true`
    - `recurringTransactionId` = recurring template ID
    - `status: COMPLETED`

2. Account balance updates:
    - **INCOME**: Account balance increases
    - **EXPENSE**: Account balance decreases
    - **TRANSFER**: Source decreases, destination increases

---

## Common Use Cases

### 1. Monthly Bills
```bash
# Rent
frequency: "MONTHLY", intervalValue: 1

# Utilities
frequency: "MONTHLY", intervalValue: 1

# Phone Bill
frequency: "MONTHLY", intervalValue: 1
```

### 2. Subscriptions
```bash
# Netflix, Spotify, etc.
frequency: "MONTHLY", intervalValue: 1

# Annual subscriptions (GitHub, etc.)
frequency: "YEARLY", intervalValue: 1
```

### 3. Income
```bash
# Monthly Salary
frequency: "MONTHLY", intervalValue: 1

# Bi-Weekly Paycheck
frequency: "WEEKLY", intervalValue: 2
```

### 4. Savings
```bash
# Monthly Auto-Save
frequency: "MONTHLY", intervalValue: 1
type: "TRANSFER"
```

### 5. Quarterly/Annual
```bash
# Quarterly Insurance
frequency: "MONTHLY", intervalValue: 3

# Annual Property Tax
frequency: "YEARLY", intervalValue: 1
```

---

## Testing Workflow

1. **Create recurring transactions** for common expenses
2. **Check nextOccurrenceDate** - should match start date initially
3. **Wait for scheduled job** (or trigger manually)
4. **Verify transaction generated** in transactions list
5. **Check account balance** updated correctly
6. **Verify nextOccurrenceDate** advanced to next period
7. **Check lastGeneratedDate** updated to today
8. **Test with end date** - verify auto-deactivation

---

## Error Responses

### 400 Bad Request - Missing Destination
```json
{
  "success": false,
  "message": "Destination account is required for transfers",
  "data": null,
  "timestamp": "2024-01-20T14:00:00"
}
```

### 400 Bad Request - Invalid Dates
```json
{
  "success": false,
  "message": "End date must be after start date",
  "data": null,
  "timestamp": "2024-01-20T14:00:00"
}
```

### 404 Not Found
```json
{
  "success": false,
  "message": "Recurring transaction not found",
  "data": null,
  "timestamp": "2024-01-20T14:00:00"
}
```

---

## Pro Tips

1. **Set Start Date Carefully**: First transaction generates on start date
2. **Use End Dates**: For limited subscriptions or temporary bills
3. **Pause Instead of Delete**: Use `isActive: false` to temporarily stop
4. **Check Next Occurrence**: Shows when next transaction will generate
5. **Review Generated Transactions**: Tagged with `isRecurring: true`
6. **Adjust Amounts**: Update amount if bill increases
7. **Use Intervals**: `intervalValue: 2` for bi-weekly, `3` for quarterly
8. **Monitor Last Generated**: Shows when it last created a transaction
9. **Auto-Deactivation**: Automatically stops when end date reached
10. **Bulk Setup**: Create all recurring expenses at once for complete automation

---

## Example: Complete Setup

```bash
# 1. Monthly salary (1st of month)
curl -X POST "http://localhost:8080/api/recurring-transactions" -H "Authorization: Bearer $JWT" -d '{
  "accountId": "'$CHECKING'", "type": "INCOME", "amount": 5000,
  "frequency": "MONTHLY", "intervalValue": 1, "startDate": "2024-01-01"
}'

# 2. Monthly rent (1st of month)
curl -X POST "http://localhost:8080/api/recurring-transactions" -H "Authorization: Bearer $JWT" -d '{
  "accountId": "'$CHECKING'", "type": "EXPENSE", "amount": 1500,
  "frequency": "MONTHLY", "intervalValue": 1, "startDate": "2024-01-01"
}'

# 3. Auto-save (10th of month)
curl -X POST "http://localhost:8080/api/recurring-transactions" -H "Authorization: Bearer $JWT" -d '{
  "accountId": "'$CHECKING'", "toAccountId": "'$SAVINGS'", "type": "TRANSFER",
  "amount": 500, "frequency": "MONTHLY", "intervalValue": 1, "startDate": "2024-01-10"
}'

# Get all recurring
curl "http://localhost:8080/api/recurring-transactions?activeOnly=true" -H "Authorization: Bearer $JWT"
```

---

# File Upload API - Testing Guide

## Prerequisites
- Application running on `http://localhost:8080`
- Valid JWT token (from login)
- At least one transaction created
- Test image/PDF files ready for upload

---

## 1. Upload Attachment to Transaction

### Upload Receipt Image
```bash
curl -X POST "http://localhost:8080/api/transactions/{transactionId}/attachments" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -F "file=@/path/to/receipt.jpg"
```

### Upload PDF Receipt
```bash
curl -X POST "http://localhost:8080/api/transactions/{transactionId}/attachments" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -F "file=@/path/to/invoice.pdf"
```

**Expected Response (201 Created):**
```json
{
  "success": true,
  "message": "File uploaded successfully",
  "data": {
    "id": "attachment-uuid",
    "fileName": "uuid_timestamp.jpg",
    "originalFileName": "receipt.jpg",
    "fileType": "image/jpeg",
    "fileSize": 245678,
    "fileUrl": "/uploads/transactions/uuid_timestamp.jpg",
    "thumbnailUrl": null,
    "createdAt": "2024-01-15T14:30:00"
  },
  "timestamp": "2024-01-15T14:30:00"
}
```

---

## 2. Get All Attachments for Transaction

```bash
curl -X GET "http://localhost:8080/api/transactions/{transactionId}/attachments" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Attachments retrieved successfully",
  "data": [
    {
      "id": "attachment-uuid-1",
      "fileName": "uuid_timestamp_1.jpg",
      "originalFileName": "receipt1.jpg",
      "fileType": "image/jpeg",
      "fileSize": 245678,
      "fileUrl": "/uploads/transactions/uuid_timestamp_1.jpg",
      "thumbnailUrl": null,
      "createdAt": "2024-01-15T14:30:00"
    },
    {
      "id": "attachment-uuid-2",
      "fileName": "uuid_timestamp_2.pdf",
      "originalFileName": "invoice.pdf",
      "fileType": "application/pdf",
      "fileSize": 567890,
      "fileUrl": "/uploads/transactions/uuid_timestamp_2.pdf",
      "thumbnailUrl": null,
      "createdAt": "2024-01-15T14:35:00"
    }
  ],
  "timestamp": "2024-01-15T15:00:00"
}
```

---

## 3. View/Download File

### View Image in Browser
```bash
curl -X GET "http://localhost:8080/api/uploads/transactions/uuid_timestamp.jpg" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Download PDF
```bash
curl -X GET "http://localhost:8080/api/uploads/transactions/uuid_timestamp.pdf" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -o downloaded_invoice.pdf
```

Or simply open in browser:
```
http://localhost:8080/api/uploads/transactions/uuid_timestamp.jpg
```

---

## 4. Delete Attachment

```bash
curl -X DELETE "http://localhost:8080/api/transactions/{transactionId}/attachments/{attachmentId}" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

**Expected Response (200 OK):**
```json
{
  "success": true,
  "message": "Attachment deleted successfully",
  "data": null,
  "timestamp": "2024-01-15T15:30:00"
}
```

---

## Supported File Types

### Allowed Formats
- **Images**: JPEG, JPG, PNG, GIF, WebP
- **Documents**: PDF

### File Size Limits
- **Maximum file size**: 5MB per file
- **Maximum request size**: 10MB (for multiple files)

---

## Using Postman

### Upload File
1. Select **POST** method
2. URL: `http://localhost:8080/api/transactions/{transactionId}/attachments`
3. Headers:
    - `Authorization: Bearer YOUR_JWT_TOKEN`
4. Body:
    - Select **form-data**
    - Key: `file` (change type to **File**)
    - Value: Click "Select Files" and choose your file
5. Click **Send**

### View File
1. Copy the `fileUrl` from upload response
2. Open in browser: `http://localhost:8080/api{fileUrl}`
3. Example: `http://localhost:8080/api/uploads/transactions/abc123_1234567890.jpg`

---

## Error Responses

### 400 Bad Request - Empty File
```json
{
  "success": false,
  "message": "Cannot upload empty file",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

### 400 Bad Request - File Too Large
```json
{
  "success": false,
  "message": "File size exceeds maximum allowed size of 5MB",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

### 400 Bad Request - Invalid File Type
```json
{
  "success": false,
  "message": "File type not allowed. Allowed types: JPEG, PNG, GIF, PDF, WebP",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

### 400 Bad Request - Invalid Filename
```json
{
  "success": false,
  "message": "Filename contains invalid path sequence",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

### 404 Not Found - Transaction
```json
{
  "success": false,
  "message": "Transaction not found",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

### 404 Not Found - Attachment
```json
{
  "success": false,
  "message": "Attachment not found",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

### 404 Not Found - File
```json
{
  "success": false,
  "message": "File not found: filename.jpg",
  "data": null,
  "timestamp": "2024-01-15T14:00:00"
}
```

---

## Testing Workflow

1. **Create a transaction** (income/expense)
2. **Upload receipt image** for that transaction
3. **Upload PDF invoice** as another attachment
4. **Get all attachments** to verify both uploaded
5. **View/download files** using the fileUrl
6. **Delete one attachment**
7. **Verify deletion** by getting attachments again

---

## File Storage Location

Files are stored locally in the `uploads/transactions/` directory:

```
project-root/
├── uploads/
│   └── transactions/
│       ├── uuid1_timestamp1.jpg
│       ├── uuid2_timestamp2.pdf
│       └── uuid3_timestamp3.png
```

---

## Security Notes

1. **Authentication Required**: All file operations require valid JWT token
2. **User Verification**: Users can only access files from their own transactions
3. **Path Traversal Protection**: Filenames are validated to prevent directory traversal attacks
4. **File Type Validation**: Only allowed file types can be uploaded
5. **Size Limits**: Files over 5MB are rejected
6. **Unique Filenames**: Files are renamed with UUID to prevent conflicts

---

## Example: Complete File Upload Flow

```bash
# 1. Create a transaction
TRANSACTION_ID=$(curl -X POST "http://localhost:8080/api/transactions" \
  -H "Authorization: Bearer $JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "accountId": "account-uuid",
    "type": "EXPENSE",
    "amount": 50.00,
    "transactionDate": "2024-01-15T14:00:00",
    "description": "Grocery shopping"
  }' | jq -r '.data.id')

# 2. Upload receipt
curl -X POST "http://localhost:8080/api/transactions/$TRANSACTION_ID/attachments" \
  -H "Authorization: Bearer $JWT_TOKEN" \
  -F "file=@receipt.jpg"

# 3. Get all attachments
curl -X GET "http://localhost:8080/api/transactions/$TRANSACTION_ID/attachments" \
  -H "Authorization: Bearer $JWT_TOKEN"

# 4. View receipt in browser
FILE_URL=$(curl -X GET "http://localhost:8080/api/transactions/$TRANSACTION_ID/attachments" \
  -H "Authorization: Bearer $JWT_TOKEN" | jq -r '.data[0].fileUrl')

echo "Open in browser: http://localhost:8080/api$FILE_URL"
```

---

## Pro Tips

1. **Receipt Management**: Upload photos of receipts immediately after purchase
2. **Invoice Tracking**: Attach PDF invoices to expense transactions
3. **Multiple Attachments**: A transaction can have multiple attachments
4. **File Naming**: Original filenames are preserved in metadata
5. **Cleanup**: Deleting a transaction automatically deletes its attachments
6. **File Access**: Files are served directly - can be embedded in frontend
7. **Mobile Apps**: Perfect for camera integration - snap receipt and upload
