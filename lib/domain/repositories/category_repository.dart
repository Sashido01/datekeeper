import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();
  Future<Category?> getCategoryById(String id);
  Future<void> saveCategory(Category category);
  Future<void> deleteCategory(String id);
}