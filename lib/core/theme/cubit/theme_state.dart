import 'package:flutter/material.dart';

class ThemeChanged extends ThemeState {
  const ThemeChanged(super.themeMode);
}

class ThemeInitial extends ThemeState {
  const ThemeInitial() : super(ThemeMode.system);
}

sealed class ThemeState {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);
}
