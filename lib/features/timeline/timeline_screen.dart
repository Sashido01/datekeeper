import 'package:flutter/material.dart';
import 'package:datekeeper/presentation/l10n/app_localizations.dart';
import '../../core/navigation/navigation_extensions.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.timelineTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushSettings(),
          ),
        ],
      ),
      body: const Center(
        child: Text('Timeline — данные будут в Спринте 2'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNewEvent(),
        icon: const Icon(Icons.add),
        label: Text(l10n.addEvent),
      ),
    );
  }
}