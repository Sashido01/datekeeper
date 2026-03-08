import 'package:drift/drift.dart';
import 'package:datekeeper/core/enums/recurrence_type.dart';

class RecurrenceTypeConverter extends TypeConverter<RecurrenceType, String> {
  const RecurrenceTypeConverter();

  @override
  RecurrenceType fromSql(String fromDb) {
    return RecurrenceType.values.firstWhere(
      (e) => e.name == fromDb,
      orElse: () => RecurrenceType.none,
    );
  }

  @override
  String toSql(RecurrenceType value) => value.name;
}