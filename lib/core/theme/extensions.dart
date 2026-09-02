import 'package:dashboard/core/theme/dash_colors.dart';
import 'package:flutter/material.dart';

@immutable
class DashboardColors extends ThemeExtension<DashboardColors> {
  static const light = DashboardColors(
    success: DashColors.success,
    warning: DashColors.warning,
    info: DashColors.info,
    preparing: DashColors.preparing,
    cancelled: DashColors.cancelled,
  );
  static const dark = DashboardColors(
    success: Color(0xFF34D399),
    warning: Color(0xFFFBBF24),
    info: Color(0xFF60A5FA),
    preparing: Color(0xFFA78BFA),
    cancelled: Color(0xFF9CA3AF),
  );
  final Color success;
  final Color warning;
  final Color info;

  final Color preparing;

  final Color cancelled;

  const DashboardColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.preparing,
    required this.cancelled,
  });

  @override
  DashboardColors copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? preparing,
    Color? cancelled,
  }) {
    return DashboardColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      preparing: preparing ?? this.preparing,
      cancelled: cancelled ?? this.cancelled,
    );
  }

  @override
  DashboardColors lerp(covariant DashboardColors? other, double t) {
    if (other == null) {
      return this;
    }

    return DashboardColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      preparing: Color.lerp(preparing, other.preparing, t)!,
      cancelled: Color.lerp(cancelled, other.cancelled, t)!,
    );
  }
}
