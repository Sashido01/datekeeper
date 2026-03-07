import 'package:drift/drift.dart';
import '../../domain/entities/reminder.dart';
import '../database/app_database.dart' as db;

class ReminderMapper {
  static Reminder toDomain(db.Reminder data) {
    return Reminder(
      id: data.id,
      eventId: data.eventId,
      timing: data.timing,
      value: data.value,
      createdAt: data.createdAt,
    );
  }

  static db.RemindersCompanion toCompanion(Reminder reminder) {
    return db.RemindersCompanion(
      id: Value(reminder.id),
      eventId: Value(reminder.eventId),
      timing: Value(reminder.timing),
      value: Value(reminder.value),
      createdAt: Value(reminder.createdAt),
    );
  }
}