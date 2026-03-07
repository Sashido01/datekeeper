import 'package:drift/drift.dart';
import 'package:datekeeper/core/enums/reminder_timing.dart';

class ReminderTimingConverter extends TypeConverter<ReminderTiming, String> {
  const ReminderTimingConverter();

  @override
  ReminderTiming fromSql(String fromDb) {
    return ReminderTiming.values.firstWhere(
      (e) => e.name == fromDb,
      orElse: () => ReminderTiming.onDay,
    );
  }

  @override
  String toSql(ReminderTiming value) => value.name;
}