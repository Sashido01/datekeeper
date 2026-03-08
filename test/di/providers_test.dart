import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:datekeeper/core/di/infrastructure_providers.dart';
import 'package:datekeeper/core/di/repository_providers.dart';

void main() {
  // Отключаем предупреждения Drift о многократном создании БД в тестах
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('DI Providers', () {
    test('databaseProvider создаёт AppDatabase', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final db = container.read(databaseProvider);
      expect(db, isNotNull);
    });

    test('eventRepositoryProvider создаёт репозиторий', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final repo = container.read(eventRepositoryProvider);
      expect(repo, isNotNull);
    });

    test('categoryRepositoryProvider создаёт репозиторий', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      
      final repo = container.read(categoryRepositoryProvider);
      expect(repo, isNotNull);
    });
  });
}