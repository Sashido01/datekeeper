import 'package:drift/drift.dart';
import 'package:datekeeper/data/database/converters/datetime_converter.dart';
import 'package:datekeeper/data/database/converters/recurrence_type_converter.dart';
import 'package:datekeeper/data/database/converters/feb29_policy_converter.dart';
import 'package:datekeeper/data/database/tables/categories_table.dart';
import 'package:datekeeper/core/enums/recurrence_type.dart';
import 'package:datekeeper/core/enums/feb29_policy.dart';

@TableIndex(name: 'idx_events_date_category', columns: {#date, #categoryId})
@TableIndex(name: 'idx_events_updated_at', columns: {#updatedAt})
class Events extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get date => integer().map(const DateTimeConverter())();
  TextColumn get categoryId => text().nullable().references(Categories, #id)();
  TextColumn get recurrenceType => text().nullable().map(const RecurrenceTypeConverter())();
  IntColumn get recurrenceInterval => integer().nullable()();
  IntColumn get recurrenceEndDate => integer().nullable().map(const DateTimeConverter())();
  TextColumn get feb29Policy => text().nullable().map(const Feb29PolicyConverter())();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer().map(const DateTimeConverter())();
  IntColumn get updatedAt => integer().map(const DateTimeConverter())();

  @override
  Set<Column> get primaryKey => {id};
}