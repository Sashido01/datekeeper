import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminder_repository.dart';
import '../database/daos/reminders_dao.dart';
import '../mappers/reminder_mapper.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final RemindersDao _remindersDao;

  ReminderRepositoryImpl(this._remindersDao);

  @override
  Future<List<Reminder>> getAllReminders() async {
    final data = await _remindersDao.getAllReminders();
    return data.map(ReminderMapper.toDomain).toList();
  }

  @override
  Future<List<Reminder>> getRemindersForEvent(String eventId) async {
    final data = await _remindersDao.getRemindersForEvent(eventId);
    return data.map(ReminderMapper.toDomain).toList();
  }

  @override
  Future<void> saveReminder(Reminder reminder) async {
    final existing = await _remindersDao.getReminderById(reminder.id);
    if (existing == null) {
      await _remindersDao.insertReminder(ReminderMapper.toCompanion(reminder));
    } else {
      await _remindersDao.updateReminder(ReminderMapper.toCompanion(reminder));
    }
  }

  @override
  Future<void> deleteReminder(String id) async {
    await _remindersDao.deleteReminder(id);
  }
}