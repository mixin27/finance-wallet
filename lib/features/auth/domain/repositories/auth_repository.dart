import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/auth_response.dart';
import '../../data/models/login_request.dart';
import '../../data/models/register_request.dart';
import '../../data/models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(LoginRequest request);
  Future<Either<Failure, AuthResponse>> register(RegisterRequest request);
  Future<Either<Failure, User>> getCurrentUser({bool forceRefresh});
  Future<void> logout();
  Future<bool> isLoggedIn();
}
