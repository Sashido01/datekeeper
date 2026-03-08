import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../database/daos/categories_dao.dart';
import '../mappers/category_mapper.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoriesDao _categoriesDao;

  CategoryRepositoryImpl(this._categoriesDao);

  @override
  Future<List<Category>> getAllCategories() async {
    final data = await _categoriesDao.getAllCategories();
    return data.map(CategoryMapper.toDomain).toList();
  }

  @override
  Future<Category?> getCategoryById(String id) async {
    final data = await _categoriesDao.getCategoryById(id);
    return data != null ? CategoryMapper.toDomain(data) : null;
  }

  @override
  Future<void> saveCategory(Category category) async {
    final existing = await _categoriesDao.getCategoryById(category.id);
    if (existing == null) {
      await _categoriesDao.insertCategory(CategoryMapper.toCompanion(category));
    } else {
      await _categoriesDao.updateCategory(CategoryMapper.toCompanion(category));
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    await _categoriesDao.deleteCategory(id);
  }
}