// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'DateKeeper';

  @override
  String get timelineTitle => 'Upcoming Events';

  @override
  String get addEvent => 'Add Event';

  @override
  String get editEvent => 'Edit Event';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get confirmDelete => 'Delete Event?';

  @override
  String get confirmDeleteMessage => 'This action cannot be undone.';

  @override
  String get eventName => 'Event name';

  @override
  String get eventDate => 'Date';

  @override
  String get eventCategory => 'Category';

  @override
  String get eventRepeat => 'Repeats yearly';

  @override
  String get eventDetails => 'Event Details';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get noEvents => 'No events in the next 30 days';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Something went wrong';

  @override
  String get retry => 'Retry';

  @override
  String get today => 'Today';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String daysLeft(int count) {
    return '$count days left';
  }

  @override
  String get yearly => 'Yearly';

  @override
  String get eventNotes => 'Notes';

  @override
  String get eventNotFound => 'Event not found';
}
