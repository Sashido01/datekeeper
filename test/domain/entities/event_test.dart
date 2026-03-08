import 'package:flutter_test/flutter_test.dart';
import 'package:datekeeper/domain/entities/event.dart';
import 'package:datekeeper/core/enums/recurrence_type.dart';
import 'package:datekeeper/core/enums/feb29_policy.dart';

void main() {
  group('Event recurrence and Feb29Policy', () {
    test('Yearly event on Feb 29 with policy feb28 returns Feb 28 in non-leap year', () {
      final event = Event.create(
        title: 'Test',
        date: DateTime.utc(2020, 2, 29),
        recurrence: const RecurrenceRule(
          type: RecurrenceType.yearly,
          feb29Policy: Feb29Policy.feb28,
        ),
      );
      expect(event.getDateForMonth(2021, 2), DateTime.utc(2021, 2, 28));
    });

    test('Yearly event on Feb 29 with policy skip returns null in non-leap year', () {
      final event = Event.create(
        title: 'Test',
        date: DateTime.utc(2020, 2, 29),
        recurrence: const RecurrenceRule(
          type: RecurrenceType.yearly,
          feb29Policy: Feb29Policy.skip,
        ),
      );
      expect(event.getDateForMonth(2021, 2), isNull);
    });

    test('Monthly event on 31st returns last day of month for February', () {
      final event = Event.create(
        title: 'Monthly test',
        date: DateTime.utc(2024, 1, 31),
        recurrence: const RecurrenceRule(type: RecurrenceType.monthly),
      );
      expect(event.getDateForMonth(2024, 2), DateTime.utc(2024, 2, 29));
    });
  });
}