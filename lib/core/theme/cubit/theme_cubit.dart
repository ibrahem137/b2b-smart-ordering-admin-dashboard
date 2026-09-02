import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const _themeKey = 'theme_mode';

  ThemeCubit() : super(const ThemeInitial());

  Future<void> changeTheme(ThemeMode mode) async {
    if (state.themeMode == mode) {
      return;
    }

    emit(ThemeChanged(mode));

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_themeKey, _themeModeToString(mode));
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final savedTheme = prefs.getString(_themeKey);

    final mode = switch (savedTheme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => ThemeMode.system,
    };

    emit(ThemeChanged(mode));
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';

      case ThemeMode.dark:
        return 'dark';

      case ThemeMode.system:
        return 'system';
    }
  }
}
