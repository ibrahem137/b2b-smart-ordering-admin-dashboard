import 'package:dashboard/core/theme/dash_colors.dart';
import 'package:flutter/material.dart';

abstract final class DashColorSchemes {
  static const light = ColorScheme(
    brightness: Brightness.light,

    primary: DashColors.primary,
    onPrimary: DashColors.white,

    secondary: DashColors.secondary,
    onSecondary: DashColors.white,

    error: DashColors.error,
    onError: DashColors.white,

    surface: DashColors.white,
    onSurface: DashColors.grey900,

    surfaceContainerHighest: DashColors.grey100,

    outline: DashColors.grey300,
    outlineVariant: DashColors.grey200,

    shadow: DashColors.black,
    scrim: DashColors.black,

    inverseSurface: DashColors.grey900,
    onInverseSurface: DashColors.grey50,
    inversePrimary: DashColors.secondary,
  );

  static const dark = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF93C5FD),
    onPrimary: Color(0xFF172554),

    secondary: Color(0xFF60A5FA),
    onSecondary: Color(0xFF172554),

    error: Color(0xFFFCA5A5),
    onError: Color(0xFF450A0A),

    surface: Color(0xFF111827),
    onSurface: Color(0xFFF9FAFB),

    surfaceContainerHighest: Color(0xFF1F2937),

    outline: Color(0xFF4B5563),
    outlineVariant: Color(0xFF374151),

    shadow: DashColors.black,
    scrim: DashColors.black,

    inverseSurface: DashColors.grey100,
    onInverseSurface: DashColors.grey900,
    inversePrimary: DashColors.primary,
  );

  DashColorSchemes._();
}
