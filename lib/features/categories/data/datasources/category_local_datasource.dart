import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../models/category_detailed.dart';

class CategoryLocalDatasource {
  final AppDatabase _database;

  CategoryLocalDatasource(this._database);

  // Get all categories
  Future<List<CategoryDetailed>> getCategories({String? type}) async {
    final query = _database.select(_database.categories);

    if (type != null) {
      query.where((t) => t.type.equals(type));
    }

    final results = await query.get();

    // Group categories by parent/child relationship
    final Map<String, List<Category>> childrenMap = {};
    final List<Category> rootCategories = [];

    for (final cat in results) {
      if (cat.parentCategoryId != null) {
        childrenMap.putIfAbsent(cat.parentCategoryId!, () => []).add(cat);
      } else {
        rootCategories.add(cat);
      }
    }

    return rootCategories.map((cat) {
      final children = childrenMap[cat.id] ?? [];
      return _mapToCategoryDetailed(cat, children);
    }).toList();
  }

  // Get category by ID
  Future<CategoryDetailed?> getCategoryById(String id) async {
    final query = _database.select(_database.categories)
      ..where((t) => t.id.equals(id));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    // Get subcategories
    final subQuery = _database.select(_database.categories)
      ..where((t) => t.parentCategoryId.equals(id));
    final children = await subQuery.get();

    return _mapToCategoryDetailed(result, children);
  }

  // Insert or update category
  Future<void> upsertCategory(CategoryDetailed category) async {
    await _database
        .into(_database.categories)
        .insertOnConflictUpdate(
          CategoriesCompanion(
            id: Value(category.id),
            name: Value(category.name),
            type: Value(category.type),
            color: Value(category.color),
            icon: Value(category.icon),
            displayOrder: Value(category.displayOrder),
            isSystem: Value(category.isSystem),
            isActive: Value(category.isActive),
            parentCategoryId: Value(category.parentCategoryId),
            parentCategoryName: Value(category.parentCategoryName),
            createdAt: Value(category.createdAt),
            updatedAt: Value(category.updatedAt),
          ),
        );

    // Insert subcategories
    for (final subCat in category.subCategories) {
      await upsertCategory(subCat);
    }
  }

  // Insert or update multiple categories
  Future<void> upsertCategories(List<CategoryDetailed> categories) async {
    await _database.batch((batch) {
      for (final category in categories) {
        batch.insert(
          _database.categories,
          CategoriesCompanion(
            id: Value(category.id),
            name: Value(category.name),
            type: Value(category.type),
            color: Value(category.color),
            icon: Value(category.icon),
            displayOrder: Value(category.displayOrder),
            isSystem: Value(category.isSystem),
            isActive: Value(category.isActive),
            parentCategoryId: Value(category.parentCategoryId),
            parentCategoryName: Value(category.parentCategoryName),
            createdAt: Value(category.createdAt),
            updatedAt: Value(category.updatedAt),
          ),
          mode: InsertMode.insertOrReplace,
        );

        // Also insert subcategories
        for (final subCat in category.subCategories) {
          batch.insert(
            _database.categories,
            CategoriesCompanion(
              id: Value(subCat.id),
              name: Value(subCat.name),
              type: Value(subCat.type),
              color: Value(subCat.color),
              icon: Value(subCat.icon),
              displayOrder: Value(subCat.displayOrder),
              isSystem: Value(subCat.isSystem),
              isActive: Value(subCat.isActive),
              parentCategoryId: Value(subCat.parentCategoryId),
              parentCategoryName: Value(subCat.parentCategoryName),
              createdAt: Value(subCat.createdAt),
              updatedAt: Value(subCat.updatedAt),
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      }
    });
  }

  // Delete category
  Future<void> deleteCategory(String id) async {
    // Delete subcategories first
    await (_database.delete(
      _database.categories,
    )..where((t) => t.parentCategoryId.equals(id))).go();

    // Delete the category itself
    await (_database.delete(
      _database.categories,
    )..where((t) => t.id.equals(id))).go();
  }

  // Clear all categories
  Future<void> clearAllCategories() async {
    await _database.delete(_database.categories).go();
  }

  // Helper to map database model to domain model
  CategoryDetailed _mapToCategoryDetailed(
    Category category,
    List<Category> children,
  ) {
    return CategoryDetailed(
      id: category.id,
      name: category.name,
      type: category.type,
      color: category.color,
      icon: category.icon,
      displayOrder: category.displayOrder,
      isSystem: category.isSystem,
      isActive: category.isActive,
      parentCategoryId: category.parentCategoryId,
      parentCategoryName: category.parentCategoryName,
      subCategories: children
          .map((child) => _mapToCategoryDetailed(child, []))
          .toList(),
      createdAt: category.createdAt,
      updatedAt: category.updatedAt,
    );
  }
}
