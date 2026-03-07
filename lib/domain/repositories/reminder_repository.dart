import '../entities/reminder.dart';

abstract class ReminderRepository {
  Future<List<Reminder>> getAllReminders();
  Future<List<Reminder>> getRemindersForEvent(String eventId);
  Future<void> saveReminder(Reminder reminder);
  Future<void> deleteReminder(String id);
}