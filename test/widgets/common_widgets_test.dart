import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:datekeeper/core/widgets/empty_state.dart';
import 'package:datekeeper/core/widgets/error_state.dart';
import 'package:datekeeper/core/widgets/loading_indicator.dart';

void main() {
  group('Common Widgets', () {
    testWidgets('EmptyState показывает сообщение', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: EmptyState(message: 'Нет данных')),
        ),
      );
      
      expect(find.text('Нет данных'), findsOneWidget);
      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });

    testWidgets('ErrorState показывает ошибку', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: ErrorState(message: 'Ошибка!')),
        ),
      );
      
      expect(find.text('Ошибка!'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('LoadingIndicator показывает индикатор', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LoadingIndicator()),
        ),
      );
      
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}