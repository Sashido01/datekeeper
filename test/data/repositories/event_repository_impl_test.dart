import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:datekeeper/data/database/app_database.dart' as db; // префикс для классов Drift
import 'package:datekeeper/data/repositories/event_repository_impl.dart';
import 'package:datekeeper/domain/entities/event.dart'; // доменная сущность Event

void main() {
  late db.AppDatabase database;
  late EventRepositoryImpl repository;

  setUp(() {
    database = db.AppDatabase(NativeDatabase.memory());
    repository = EventRepositoryImpl(database.eventsDao);
  });

  tearDown(() async {
    await database.close();
  });

  test('save and retrieve event', () async {
    final event = Event.create(title: 'Test', date: DateTime.utc(2024, 1, 1));
    await repository.saveEvent(event);

    final events = await repository.getAllEvents();
    expect(events.length, 1);
    expect(events.first.title, 'Test');
  });

  test('update event', () async {
    final event = Event.create(title: 'Original', date: DateTime.utc(2024, 1, 1));
    await repository.saveEvent(event);

    final updated = Event(
      id: event.id,
      title: 'Updated',
      date: event.date,
      categoryId: event.categoryId,
      recurrence: event.recurrence,
      notes: event.notes,
      createdAt: event.createdAt,
      updatedAt: DateTime.now().toUtc(),
    );
    await repository.saveEvent(updated);

    final events = await repository.getAllEvents();
    expect(events.length, 1);
    expect(events.first.title, 'Updated');
  });

  test('delete event', () async {
    final event = Event.create(title: 'ToDelete', date: DateTime.utc(2024, 1, 1));
    await repository.saveEvent(event);
    await repository.deleteEvent(event.id);
    final events = await repository.getAllEvents();
    expect(events.isEmpty, true);
  });

  test('get events in range', () async {
    final event1 = Event.create(title: 'Event1', date: DateTime.utc(2024, 1, 1));
    final event2 = Event.create(title: 'Event2', date: DateTime.utc(2024, 2, 1));
    final event3 = Event.create(title: 'Event3', date: DateTime.utc(2024, 3, 1));
    await repository.saveEvent(event1);
    await repository.saveEvent(event2);
    await repository.saveEvent(event3);

    final events = await repository.getEventsInRange(
      DateTime.utc(2024, 1, 15),
      DateTime.utc(2024, 2, 15),
    );
    expect(events.length, 1);
    expect(events.first.title, 'Event2');
  });
}