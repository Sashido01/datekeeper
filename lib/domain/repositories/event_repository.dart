import '../entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> getAllEvents();
  Future<Event?> getEventById(String id);
  Future<List<Event>> getEventsInRange(DateTime start, DateTime end);
  Future<void> saveEvent(Event event);
  Future<void> deleteEvent(String id);
}