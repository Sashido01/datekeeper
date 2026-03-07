import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/categories_table.dart';
import 'tables/events_table.dart';
import 'tables/reminders_table.dart';
import 'daos/events_dao.dart';
import 'daos/categories_dao.dart';
import 'daos/reminders_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Categories, Events, Reminders],
  daos: [EventsDao, CategoriesDao, RemindersDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  late final EventsDao eventsDao = EventsDao(this);
  @override
  late final CategoriesDao categoriesDao = CategoriesDao(this);
  @override
  late final RemindersDao remindersDao = RemindersDao(this);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await customStatement('PRAGMA foreign_keys = ON');

          // Seeding категорий по умолчанию
          await into(categories).insert(CategoriesCompanion.insert(
            id: 'cat_family',
            name: 'Семья',
            color: 0xFFFF5733,
          ));
          await into(categories).insert(CategoriesCompanion.insert(
            id: 'cat_friends',
            name: 'Друзья',
            color: 0xFF33FF57,
          ));
          await into(categories).insert(CategoriesCompanion.insert(
            id: 'cat_work',
            name: 'Работа',
            color: 0xFF3357FF,
          ));
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // будущие миграции
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'datekeeper.sqlite'));
    return NativeDatabase.createInBackground(
      file,
      logStatements: kDebugMode,
    );
  });
}