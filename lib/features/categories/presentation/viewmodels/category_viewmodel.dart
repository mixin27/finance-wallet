import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/category_detailed.dart';
import '../../data/models/create_category_request.dart';
import '../../data/models/update_category_request.dart';
import '../../domain/repositories/category_repository.dart';
import '../providers/category_providers.dart';

class CategoryState {
  final bool isLoading;
  final String? errorMessage;
  final bool isRefreshing;

  CategoryState({
    this.isLoading = false,
    this.errorMessage,
    this.isRefreshing = false,
  });

  CategoryState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isRefreshing,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class CategoryViewModel extends StateNotifier<CategoryState> {
  final CategoryRepository _repository;
  final Ref _ref;

  CategoryViewModel(this._repository, this._ref) : super(CategoryState());

  /// Load all categories
  Future<void> loadCategories({String? type}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.getCategories(type: type);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
      },
      (categories) {
        _ref.read(allCategoriesProvider.notifier).state = categories;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  /// Refresh categories
  Future<void> refreshCategories({String? type}) async {
    state = state.copyWith(isRefreshing: true);
    await loadCategories(type: type);
    state = state.copyWith(isRefreshing: false);
  }

  /// Create new category
  Future<bool> createCategory(CreateCategoryRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.createCategory(request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (category) {
        final categories = _ref.read(allCategoriesProvider);
        _ref.read(allCategoriesProvider.notifier).state = [
          ...categories,
          category,
        ];
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  /// Update category
  Future<bool> updateCategory(String id, UpdateCategoryRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _repository.updateCategory(id, request);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: _mapFailureToMessage(failure),
        );
        return false;
      },
      (category) {
        final categories = _ref.read(allCategoriesProvider);
        final index = categories.indexWhere((c) => c.id == id);
        if (index != -1) {
          final updated = List<CategoryDetailed>.from(categories);
          updated[index] = category;
          _ref.read(allCategoriesProvider.notifier).state = updated;
        }
        _ref.read(selectedCategoryProvider.notifier).state = category;
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  /// Delete category
  Future<bool> deleteCategory(String id) async {
    final result = await _repository.deleteCategory(id);

    return result.fold(
      (failure) {
        state = state.copyWith(errorMessage: _mapFailureToMessage(failure));
        return false;
      },
      (_) {
        final categories = _ref.read(allCategoriesProvider);
        _ref.read(allCategoriesProvider.notifier).state = categories
            .where((c) => c.id != id)
            .toList();
        return true;
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.when(
      server: (message, statusCode) => message,
      network: (message) => message,
      cache: (message) => message,
      unauthorized: (message) => message,
      validation: (message) => message,
    );
  }
}

final categoryViewModelProvider =
    StateNotifierProvider<CategoryViewModel, CategoryState>((ref) {
      final repository = ref.read(categoryRepositoryProvider);
      return CategoryViewModel(repository, ref);
    });
