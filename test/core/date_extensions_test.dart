import 'package:flutter_test/flutter_test.dart';
import 'package:datekeeper/core/extensions/date_extensions.dart';

void main() {
  group('DateExtensions', () {
    test('normalized убирает время', () {
      final date = DateTime(2024, 3, 15, 14, 30, 45);
      final normalized = date.normalized;
      
      expect(normalized.year, 2024);
      expect(normalized.month, 3);
      expect(normalized.day, 15);
      expect(normalized.hour, 0);
      expect(normalized.minute, 0);
      expect(normalized.isUtc, true);
    });

    test('isToday работает', () {
      final today = DateTime.now();
      expect(today.normalized.isToday, true);
      
      final yesterday = today.subtract(const Duration(days: 1));
      expect(yesterday.normalized.isToday, false);
    });

    test('daysUntil считает дни', () {
      final today = DateTime(2024, 3, 15);
      final future = DateTime(2024, 3, 20);
      
      expect(today.daysUntil(future), 5);
    });
  });
}