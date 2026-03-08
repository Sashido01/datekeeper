import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../core/enums/reminder_timing.dart';

class Reminder extends Equatable {
  final String id;
  final String eventId;
  final ReminderTiming timing;
  final int? value;
  final DateTime createdAt; // always UTC

  const Reminder({
    required this.id,
    required this.eventId,
    required this.timing,
    this.value,
    required this.createdAt,
  });

  factory Reminder.create({
    required String eventId,
    required ReminderTiming timing,
    int? value,
  }) {
    return Reminder(
      id: const Uuid().v7(),
      eventId: eventId,
      timing: timing,
      value: value,
      createdAt: DateTime.now().toUtc(),
    );
  }

  @override
  List<Object?> get props => [id, eventId, timing, value, createdAt];
}