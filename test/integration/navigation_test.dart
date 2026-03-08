import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datekeeper/app/app.dart';

void main() {
  testWidgets('Навигация: Timeline → Add Event → Back', (tester) async {
    // Оборачиваем приложение в ProviderScope
    await tester.pumpWidget(
      const ProviderScope(
        child: DateKeeperApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Проверяем начальный экран
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Нажимаем FAB
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Проверяем, что открылся экран добавления (есть кнопка закрытия)
    expect(find.byIcon(Icons.close), findsOneWidget);

    // Нажимаем назад
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Вернулись на главный
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}