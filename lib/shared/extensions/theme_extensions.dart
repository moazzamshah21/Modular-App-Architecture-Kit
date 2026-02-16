import 'package:flutter/material.dart';

/// Theme and spacing helpers. Use: context.textTheme.titleLarge, context.spacing.md
extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  /// Spacing tokens (xs, sm, md, lg, xl)
  Spacing get spacing => Spacing();
}

class Spacing {
  double get xs => 4;
  double get sm => 8;
  double get md => 16;
  double get lg => 24;
  double get xl => 32;
}
