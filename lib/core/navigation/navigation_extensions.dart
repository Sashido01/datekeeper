import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';

extension NavigationExtensions on BuildContext {
  void pushTimeline() => goNamed(RouteNames.timeline);
  void pushNewEvent() => goNamed(RouteNames.eventNew);
  void pushEventDetails(String id) => goNamed(
        RouteNames.eventDetail,
        pathParameters: {'id': id},
      );
  void pushEditEvent(String id) => goNamed(
        RouteNames.eventEdit,
        pathParameters: {'id': id},
      );
  void pushSettings() => goNamed(RouteNames.settings);
}