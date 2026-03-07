import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/repositories/reminder_repository_impl.dart';
import '../../domain/repositories/event_repository.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/reminder_repository.dart';
import 'database_provider.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return EventRepositoryImpl(db.eventsDao);
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return CategoryRepositoryImpl(db.categoriesDao);
});

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ReminderRepositoryImpl(db.remindersDao);
});