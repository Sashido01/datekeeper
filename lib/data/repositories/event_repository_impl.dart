import '../../domain/entities/event.dart';
import '../../domain/repositories/event_repository.dart';
import '../database/daos/events_dao.dart';
import '../mappers/event_mapper.dart';

class EventRepositoryImpl implements EventRepository {
  final EventsDao _eventsDao;

  EventRepositoryImpl(this._eventsDao);

  @override
  Future<List<Event>> getAllEvents() async {
    final data = await _eventsDao.getAllEvents();
    return data.map(EventMapper.toDomain).toList();
  }

  @override
  Future<Event?> getEventById(String id) async {
    final data = await _eventsDao.getEventById(id);
    return data != null ? EventMapper.toDomain(data) : null;
  }

  @override
  Future<List<Event>> getEventsInRange(DateTime start, DateTime end) async {
    final startMillis = start.toUtc().millisecondsSinceEpoch;
    final endMillis = end.toUtc().millisecondsSinceEpoch;
    final data = await _eventsDao.getEventsInRange(startMillis, endMillis);
    return data.map(EventMapper.toDomain).toList();
  }

  @override
  Future<void> saveEvent(Event event) async {
    final existing = await _eventsDao.getEventById(event.id);
    if (existing == null) {
      await _eventsDao.insertEvent(EventMapper.toCompanion(event));
    } else {
      await _eventsDao.updateEvent(EventMapper.toCompanion(event));
    }
  }

  @override
  Future<void> deleteEvent(String id) async {
    await _eventsDao.deleteEvent(id);
  }
}