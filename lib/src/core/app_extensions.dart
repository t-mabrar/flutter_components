import 'package:flutter/material.dart';

// Context based extension
extension AppContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  bool get isBigScreen => MediaQuery.of(this).size.width > 768.0;

  bool get isTab =>
      MediaQuery.of(this).size.width > 480.0 &&
      MediaQuery.of(this).size.width < 768.0;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).colorScheme.primary;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  /// Returns the default border color used in input decorations.
  /// Falls back to [Colors.black] if no border is defined.
  Color get borderColor =>
      Theme.of(this).inputDecorationTheme.border == null
          ? Colors.black
          : Theme.of(this).inputDecorationTheme.border!.borderSide.color;

  /// Returns the color of the enabled border in input decorations.
  /// Defaults to [Colors.black] if not explicitly defined in the theme.
  Color get enabledBorderColor =>
      Theme.of(this).inputDecorationTheme.enabledBorder == null
          ? Colors.black
          : Theme.of(this).inputDecorationTheme.enabledBorder!.borderSide.color;

  /// Returns the error color defined in the theme's [ColorScheme].
  Color get errorColor => Theme.of(this).colorScheme.error;

  /// Returns the default icon color from the current theme.
  /// Falls back to [Colors.black] if not set.
  Color get iconColor => Theme.of(this).iconTheme.color ?? Colors.black;
}

// String based extensions
extension AppStringExtension on String {
  String get statusTitle => replaceAll("_", "").replaceAll(" ", "").toTitleCase;

  String get toTitleCase => toLowerCase()
      .split(' ')
      .map(
        (word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '',
      )
      .join(' ');

  String get snakeCaseToTitle {
    return split('_')
        .map(
          (word) =>
              word.isNotEmpty
                  ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
                  : '',
        )
        .join(' ');
  }

  String get titleToSnakeCase {
    return trim()
        .split(RegExp(r'\s+'))
        .map((word) => word.toLowerCase())
        .join('_');
  }
}

// List<Widget> based extensions
extension WidgetsList on List<Widget> {
  List<Widget> horizontalSeparator(Widget builder) {
    return map(
      (e) =>
          last == e
              ? e
              : Expanded(
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [e, builder],
                ),
              ),
    ).toList();
  }

  List<Widget> verticalSeparator(Widget builder) {
    return map(
      (e) =>
          last == e
              ? e
              : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [e, builder],
              ),
    ).toList();
  }
}
