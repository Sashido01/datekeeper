import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../core/enums/recurrence_type.dart';
import '../../core/enums/feb29_policy.dart';

class RecurrenceRule extends Equatable {
  final RecurrenceType type;
  final int? interval;
  final DateTime? endDate;
  final Feb29Policy feb29Policy;

  const RecurrenceRule({
    required this.type,
    this.interval,
    this.endDate,
    this.feb29Policy = Feb29Policy.feb28,
  }) : assert(
         type != RecurrenceType.custom || (interval != null && interval > 0),
         'Custom recurrence requires positive interval',
       );

  @override
  List<Object?> get props => [type, interval, endDate, feb29Policy];
}

class Event extends Equatable {
  final String id;
  final String title;
  final DateTime date; // always UTC
  final String? categoryId;
  final RecurrenceRule? recurrence;
  final String? notes;
  final DateTime createdAt; // always UTC
  final DateTime updatedAt; // always UTC

  const Event({
    required this.id,
    required this.title,
    required this.date,
    this.categoryId,
    this.recurrence,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Event.create({
    required String title,
    required DateTime date,
    String? categoryId,
    RecurrenceRule? recurrence,
    String? notes,
  }) {
    final now = DateTime.now().toUtc();
    return Event(
      id: const Uuid().v7(),
      title: title,
      date: date.toUtc(),
      categoryId: categoryId,
      recurrence: recurrence,
      notes: notes,
      createdAt: now,
      updatedAt: now,
    );
  }

  DateTime? getDateForMonth(int year, int month) {
    if (recurrence == null || recurrence!.type == RecurrenceType.none) {
      return (date.year == year && date.month == month) ? date : null;
    }
    switch (recurrence!.type) {
      case RecurrenceType.yearly:
        if (date.month == month) return _adjustFeb29(date, year);
        return null;
      case RecurrenceType.monthly:
        if (recurrence!.endDate != null) {
          final candidate = DateTime.utc(year, month, date.day);
          if (candidate.isAfter(recurrence!.endDate!)) return null;
        }
        final lastDay = DateTime.utc(year, month + 1, 0).day;
        final day = date.day > lastDay ? lastDay : date.day;
        return DateTime.utc(year, month, day);
      default:
        return null;
    }
  }

  DateTime? _adjustFeb29(DateTime original, int year) {
    if (original.month == 2 && original.day == 29) {
      final isLeap = DateTime.utc(year, 2, 29).day == 29;
      if (!isLeap) {
        switch (recurrence!.feb29Policy) {
          case Feb29Policy.skip:
            return null;
          case Feb29Policy.feb28:
            return DateTime.utc(year, 2, 28);
          case Feb29Policy.mar1:
            return DateTime.utc(year, 3, 1);
        }
      }
    }
    return DateTime.utc(year, original.month, original.day);
  }

  @override
  List<Object?> get props => [id, title, date, categoryId, recurrence, notes, createdAt, updatedAt];
}