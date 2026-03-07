import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/reminders_table.dart';

part 'reminders_dao.g.dart';

@DriftAccessor(tables: [Reminders])
class RemindersDao extends DatabaseAccessor<AppDatabase> with _$RemindersDaoMixin {
  RemindersDao(super.db);

  Future<List<Reminder>> getAllReminders() => select(reminders).get();
  Future<Reminder?> getReminderById(String id) =>
      (select(reminders)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<List<Reminder>> getRemindersForEvent(String eventId) =>
      (select(reminders)..where((t) => t.eventId.equals(eventId))).get();
  Future<void> insertReminder(RemindersCompanion reminder) => into(reminders).insert(reminder);
  Future<void> updateReminder(RemindersCompanion reminder) => update(reminders).replace(reminder);
  Future<void> deleteReminder(String id) =>
      (delete(reminders)..where((t) => t.id.equals(id))).go();
  Stream<List<Reminder>> watchAllReminders() => select(reminders).watch();
}