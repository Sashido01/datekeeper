extension DateNormalization on DateTime {
  DateTime get normalized => DateTime.utc(year, month, day);
}

extension DateHelpers on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  int daysUntil(DateTime other) {
    final diff = other.normalized.difference(normalized);
    return diff.inDays;
  }
}