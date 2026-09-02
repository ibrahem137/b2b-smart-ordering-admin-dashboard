import 'package:flutter/material.dart';

abstract final class DashColors {
  // Brand
  static const primary = Color(0xFF1E3A8A);
  static const secondary = Color(0xFF3B82F6);

  // Semantic
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);

  // Extra semantic
  static const preparing = Color(0xFF8B5CF6);
  static const cancelled = Color(0xFF6B7280);

  // Neutral palette
  static const grey50 = Color(0xFFF9FAFB);
  static const grey100 = Color(0xFFF3F4F6);
  static const grey200 = Color(0xFFE5E7EB);
  static const grey300 = Color(0xFFD1D5DB);
  static const grey400 = Color(0xFF9CA3AF);
  static const grey500 = Color(0xFF6B7280);
  static const grey600 = Color(0xFF4B5563);
  static const grey700 = Color(0xFF374151);
  static const grey800 = Color(0xFF1F2937);
  static const grey900 = Color(0xFF111827);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  DashColors._();
}
