import 'package:flutter/material.dart';
import 'package:datekeeper/presentation/l10n/app_localizations.dart';
import '../../core/navigation/navigation_extensions.dart';

class EventFormScreen extends StatelessWidget {
  final String? eventId;
  const EventFormScreen({super.key, this.eventId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isEdit = eventId != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? l10n.editEvent : l10n.addEvent),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pushTimeline(),
        ),
      ),
      body: const Center(
        child: Text('Форма события — Спринт 3'),
      ),
    );
  }
}