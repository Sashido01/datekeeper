import 'package:drift/drift.dart';
import 'package:datekeeper/data/database/converters/reminder_timing_converter.dart';
import 'package:datekeeper/data/database/converters/datetime_converter.dart';
import 'package:datekeeper/data/database/tables/events_table.dart';

@TableIndex(name: 'idx_reminders_event_id', columns: {#eventId})
class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get eventId => text().references(Events, #id, onDelete: KeyAction.cascade)();
  TextColumn get timing => text().map(const ReminderTimingConverter())();
  IntColumn get value => integer().nullable()();
  IntColumn get createdAt => integer().map(const DateTimeConverter())();

  @override
  Set<Column> get primaryKey => {id};
}