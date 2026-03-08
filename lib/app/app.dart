import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datekeeper/presentation/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/navigation/router.dart';
import '../presentation/providers/theme_provider.dart';

class DateKeeperApp extends ConsumerWidget {
  const DateKeeperApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeModeAsync = ref.watch(themeModeProvider); // AsyncValue<AppThemeMode>
    final themeData = ref.watch(appThemeDataProvider);   // Тема из провайдера

    return MaterialApp.router(
      title: 'DateKeeper',
      debugShowCheckedModeBanner: false,
      theme: themeData, // используется одна тема, провайдер сам решает светлая/тёмная
      themeMode: themeModeAsync.when(
        data: (mode) => mode == AppThemeMode.system
            ? ThemeMode.system
            : mode == AppThemeMode.light
                ? ThemeMode.light
                : ThemeMode.dark,
        loading: () => ThemeMode.system,
        error: (_, __) => ThemeMode.system,
      ),
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}