import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes.dart';
import 'route_names.dart';
import '../../features/timeline/timeline_screen.dart';
import '../../features/event_form/event_form_screen.dart';
import '../../features/event_details/event_detail_screen.dart';
import '../../features/settings/settings_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoute.timeline.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoute.timeline.path,
        name: RouteNames.timeline,
        builder: (context, state) => const TimelineScreen(),
      ),
      GoRoute(
        path: AppRoute.eventNew.path,
        name: RouteNames.eventNew,
        builder: (context, state) => const EventFormScreen(),
      ),
      GoRoute(
        path: AppRoute.eventDetail.path,
        name: RouteNames.eventDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EventDetailScreen(eventId: id);
        },
      ),
      GoRoute(
        path: AppRoute.eventEdit.path,
        name: RouteNames.eventEdit,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EventFormScreen(eventId: id);
        },
      ),
      GoRoute(
        path: AppRoute.settings.path,
        name: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found: ${state.uri}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoute.timeline.path),
              child: const Text('Go to Timeline'),
            ),
          ],
        ),
      ),
    ),
  );
});