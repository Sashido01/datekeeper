import 'package:drift/drift.dart';
import '../../domain/entities/category.dart';
import '../database/app_database.dart' as db;

class CategoryMapper {
  static Category toDomain(db.Category data) {
    return Category(
      id: data.id,
      name: data.name,
      color: data.color,
      isDefault: data.isDefault,
    );
  }

  static db.CategoriesCompanion toCompanion(Category category) {
    return db.CategoriesCompanion(
      id: Value(category.id),
      name: Value(category.name),
      color: Value(category.color),
      isDefault: Value(category.isDefault),
    );
  }
}