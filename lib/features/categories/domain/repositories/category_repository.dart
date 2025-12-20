import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/category_detailed.dart';
import '../../data/models/create_category_request.dart';
import '../../data/models/update_category_request.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryDetailed>>> getCategories({String? type});
  Future<Either<Failure, CategoryDetailed>> getCategoryById(String id);
  Future<Either<Failure, CategoryDetailed>> createCategory(
    CreateCategoryRequest request,
  );
  Future<Either<Failure, CategoryDetailed>> updateCategory(
    String id,
    UpdateCategoryRequest request,
  );
  Future<Either<Failure, void>> deleteCategory(String id);
}
