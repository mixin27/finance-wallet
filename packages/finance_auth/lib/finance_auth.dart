/// Simplified authentication package supporting login, token management,
/// session handling, and user role management. No multi-tenancy - designed for
/// single-organization deployments.
///
/// **Key Features:**
/// - Abstract `AuthRepository` interface for flexibility
/// - Token storage with secure storage
/// - Authentication state stream
/// - Automatic session expiry handling
/// - Login credentials validation
/// - Support for different authentication methods
library;

// Repositories
export 'src/repositories/auth_repository.dart';

// Services
export 'src/services/finance_auth_service.dart';
export 'src/services/secure_storage_service.dart';

// Models
export 'src/models/auth_models.dart';
export 'src/models/credentials.dart';
export 'src/models/auth_state.dart';

// Exceptions
export 'src/exceptions/auth_exception.dart';
export 'src/exceptions/storage_exception.dart';
