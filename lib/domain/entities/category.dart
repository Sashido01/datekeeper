import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final int color; // ARGB
  final bool isDefault;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    this.isDefault = false,
  });

  factory Category.create({required String name, required int color, bool isDefault = false}) {
    return Category(
      id: const Uuid().v7(),
      name: name,
      color: color,
      isDefault: isDefault,
    );
  }

  @override
  List<Object?> get props => [id, name, color, isDefault];
}