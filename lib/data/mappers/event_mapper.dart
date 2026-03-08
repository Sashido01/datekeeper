import 'package:drift/drift.dart';
import '../../domain/entities/event.dart';
import '../database/app_database.dart' as db;
import '../../core/enums/feb29_policy.dart';

class EventMapper {
  static Event toDomain(db.Event data) {
    return Event(
      id: data.id,
      title: data.title,
      date: data.date,
      categoryId: data.categoryId,
      recurrence: data.recurrenceType == null
          ? null
          : RecurrenceRule(
              type: data.recurrenceType!,
              interval: data.recurrenceInterval,
              endDate: data.recurrenceEndDate,
              feb29Policy: data.feb29Policy ?? Feb29Policy.feb28,
            ),
      notes: data.notes,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  static db.EventsCompanion toCompanion(Event event) {
    final now = DateTime.now().toUtc();
    return db.EventsCompanion(
      id: Value(event.id),
      title: Value(event.title),
      date: Value(event.date),
      categoryId: Value(event.categoryId),
      recurrenceType: Value(event.recurrence?.type),
      recurrenceInterval: Value(event.recurrence?.interval),
      recurrenceEndDate: Value(event.recurrence?.endDate),
      feb29Policy: Value(event.recurrence?.feb29Policy),
      notes: Value(event.notes),
      createdAt: Value(event.createdAt),
      updatedAt: Value(now),
    );
  }
}