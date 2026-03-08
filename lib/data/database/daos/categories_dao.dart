import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/categories_table.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<AppDatabase> with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  Future<List<Category>> getAllCategories() => select(categories).get();
  Future<Category?> getCategoryById(String id) =>
      (select(categories)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<void> insertCategory(CategoriesCompanion category) => into(categories).insert(category);
  Future<void> updateCategory(CategoriesCompanion category) => update(categories).replace(category);
  Future<void> deleteCategory(String id) =>
      (delete(categories)..where((t) => t.id.equals(id))).go();
  Stream<List<Category>> watchAllCategories() => select(categories).watch();
}