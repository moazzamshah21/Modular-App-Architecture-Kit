import 'package:flutter/material.dart';

/// Theme and spacing helpers for [BuildContext].
///
/// Example:
/// ```dart
/// context.textTheme.titleLarge
/// context.spacing.md
/// ```
extension ThemeExtensions on BuildContext {
  /// The current theme data.
  ThemeData get theme => Theme.of(this);

  /// The text theme from the current theme.
  TextTheme get textTheme => theme.textTheme;

  /// The color scheme from the current theme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Spacing tokens (xs, sm, md, lg, xl).
  Spacing get spacing => Spacing();
}

/// Spacing design tokens for consistent layout.
class Spacing {
  /// Extra small: 4px.
  double get xs => 4;

  /// Small: 8px.
  double get sm => 8;

  /// Medium: 16px.
  double get md => 16;

  /// Large: 24px.
  double get lg => 24;

  /// Extra large: 32px.
  double get xl => 32;
}
