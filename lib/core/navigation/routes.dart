enum AppRoute {
  timeline(path: '/'),
  eventNew(path: '/event/new'),
  eventDetail(path: '/event/:id'),
  eventEdit(path: '/event/:id/edit'),
  settings(path: '/settings');

  const AppRoute({required this.path});
  final String path;
}