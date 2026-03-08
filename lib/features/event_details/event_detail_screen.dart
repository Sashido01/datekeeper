import 'package:flutter/material.dart';
import 'package:datekeeper/presentation/l10n/app_localizations.dart';
import '../../core/navigation/navigation_extensions.dart';

class EventDetailScreen extends StatelessWidget {
  final String eventId;
  const EventDetailScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.eventDetails),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.pushEditEvent(eventId),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('Детали события $eventId — Спринт 4'),
      ),
    );
  }
}