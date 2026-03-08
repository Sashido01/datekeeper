import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  Future<void> setThemeMode(int index);
  Future<int> getThemeMode();
}

class PreferencesServiceImpl implements PreferencesService {
  final SharedPreferences _prefs;
  PreferencesServiceImpl(this._prefs);

  @override
  Future<void> setThemeMode(int index) => _prefs.setInt('theme_mode', index);

  @override
  Future<int> getThemeMode() async => _prefs.getInt('theme_mode') ?? 0;
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  if (prefs == null) throw Exception('SharedPreferences not initialized');
  return PreferencesServiceImpl(prefs);
});