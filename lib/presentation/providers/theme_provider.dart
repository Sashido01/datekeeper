// lib/presentation/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/preferences_service.dart';
import '../../core/theme/app_theme.dart';

enum AppThemeMode { system, light, dark }

// Используем AsyncNotifier вместо StateNotifier (Riverpod 2.x)
class ThemeNotifier extends AsyncNotifier<AppThemeMode> {
  @override
  Future<AppThemeMode> build() async {
    final prefs = ref.read(preferencesServiceProvider);
    final index = await prefs.getThemeMode();
    return AppThemeMode.values[index];
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    final prefs = ref.read(preferencesServiceProvider);
    await prefs.setThemeMode(mode.index);
    state = AsyncData(mode);
  }
}

final themeModeProvider = AsyncNotifierProvider<ThemeNotifier, AppThemeMode>(() {
  return ThemeNotifier();
});

final appThemeDataProvider = Provider<ThemeData>((ref) {
  final modeAsync = ref.watch(themeModeProvider);
  
  return modeAsync.when(
    data: (mode) {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      final isDark = mode == AppThemeMode.light
          ? false
          : mode == AppThemeMode.dark
              ? true
              : brightness == Brightness.dark;
      return isDark ? AppTheme.dark() : AppTheme.light();
    },
    loading: () => AppTheme.light(),
    error: (_, __) => AppTheme.light(),
  );
});