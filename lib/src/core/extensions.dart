import 'dart:ui';

import 'package:flutter/material.dart';



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
}

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
