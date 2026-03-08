// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'DateKeeper';

  @override
  String get timelineTitle => 'Ближайшие события';

  @override
  String get addEvent => 'Добавить событие';

  @override
  String get editEvent => 'Редактировать';

  @override
  String get delete => 'Удалить';

  @override
  String get cancel => 'Отмена';

  @override
  String get save => 'Сохранить';

  @override
  String get confirmDelete => 'Удалить событие?';

  @override
  String get confirmDeleteMessage => 'Это действие нельзя отменить.';

  @override
  String get eventName => 'Название';

  @override
  String get eventDate => 'Дата';

  @override
  String get eventCategory => 'Категория';

  @override
  String get eventRepeat => 'Повторяется ежегодно';

  @override
  String get eventDetails => 'Детали события';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get noEvents => 'Нет событий в ближайшие 30 дней';

  @override
  String get loading => 'Загрузка...';

  @override
  String get error => 'Что-то пошло не так';

  @override
  String get retry => 'Повторить';

  @override
  String get today => 'Сегодня';

  @override
  String get tomorrow => 'Завтра';

  @override
  String daysLeft(int count) {
    return 'Осталось $count дн.';
  }

  @override
  String get yearly => 'Ежегодно';

  @override
  String get eventNotes => 'Заметки';

  @override
  String get eventNotFound => 'Событие не найдено';
}
