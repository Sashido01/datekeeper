import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/events_table.dart';

part 'events_dao.g.dart';

@DriftAccessor(tables: [Events])
class EventsDao extends DatabaseAccessor<AppDatabase> with _$EventsDaoMixin {
  EventsDao(super.db);

  Future<List<Event>> getAllEvents() => select(events).get();
  Future<Event?> getEventById(String id) =>
      (select(events)..where((t) => t.id.equals(id))).getSingleOrNull();
  Future<List<Event>> getEventsInRange(int startMillis, int endMillis) {
    return (select(events)
      ..where((t) => t.date.isBetweenValues(startMillis, endMillis)))
        .get();
  }
  Future<void> insertEvent(EventsCompanion event) => into(events).insert(event);
  Future<void> updateEvent(EventsCompanion event) => update(events).replace(event);
  Future<void> deleteEvent(String id) =>
      (delete(events)..where((t) => t.id.equals(id))).go();
  Stream<List<Event>> watchAllEvents() => select(events).watch();
}