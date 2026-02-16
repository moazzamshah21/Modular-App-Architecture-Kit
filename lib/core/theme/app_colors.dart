import 'package:flutter/material.dart';

/// Design token colors for the app theme.
///
/// Use with [AppTheme] or directly for custom widgets.
abstract class AppColors {
  AppColors._();

  /// Primary brand color.
  static const Color primary = Color(0xFF6750A4);

  /// Secondary color for accents.
  static const Color secondary = Color(0xFF625B71);

  /// Error color for validation and alerts.
  static const Color error = Color(0xFFB3261E);

  /// Surface background color.
  static const Color surface = Color(0xFFFFFBFE);

  /// Text color on surface.
  static const Color onSurface = Color(0xFF1C1B1F);
}
