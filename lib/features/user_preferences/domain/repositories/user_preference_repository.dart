import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_preference_entity.dart';
import '../../data/models/update_user_preference_request.dart';

abstract class UserPreferenceRepository {
  Future<Either<Failure, UserPreferenceEntity>> getUserPreferences();
  Future<Either<Failure, UserPreferenceEntity>> updateUserPreferences(
    UpdateUserPreferenceRequest request,
  );
  Future<Either<Failure, UserPreferenceEntity>> resetUserPreferences();
}
