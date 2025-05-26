import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

final navigationKey = GlobalKey<NavigatorState>();
final mainNavigationKey = GlobalKey<NavigatorState>();

extension HexColor on String {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('FF');
    buffer.write(replaceFirst('#', ''));
    int colorIntValue = int.parse(buffer.toString(), radix: 16);
    return Color(colorIntValue);
  }
}

enum ToastType { success, warning, error }

TextStyle? headerTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleMedium;
}

int kAppDataGridRowsCount = 50;

double kAppDialogPopUpWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width / 1.2;
}

/// This function is used to update the page title
void setPageTitle(String title, {int? colorInt}) {
  if (kIsWeb) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: title,
        primaryColor: colorInt ?? 0xFF000000, // This line is required
      ),
    );
  }
}

class AppUtils {
  bool get kIsMobile =>
      MediaQueryData.fromView(
        PlatformDispatcher.instance.implicitView!,
      ).size.width <
      480.0;
  double get screenWidth =>
      MediaQueryData.fromView(
        PlatformDispatcher.instance.implicitView!,
      ).size.shortestSide;
  bool get kIsTab => screenWidth > 480.0 && screenWidth < 768.0;
  bool get kIsBigScreen => screenWidth > 768.0;

  static TextTheme textTheme({
    String? fontFamily,
    Color defaultColor = Colors.black,
  }) => TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 64,
      fontWeight: FontWeight.bold,
      color: defaultColor,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 52,
      fontWeight: FontWeight.bold,
      color: defaultColor,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 44,
      fontWeight: FontWeight.bold,
      color: defaultColor,
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: defaultColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: defaultColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: defaultColor,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: defaultColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: defaultColor,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: defaultColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: defaultColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: defaultColor,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: defaultColor,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: defaultColor,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: defaultColor,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: defaultColor,
    ),
  );

  static String apiParsing(String template, Map<String, dynamic> values) {
    values.forEach((key, value) {
      template = template.replaceAll('{$key}', value.toString());
    });
    return template;
  }

  static Color scaffoldBGColor = const Color(0xFFFFFFFF);

  static double roundDouble(double value, int places) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Future<void> appToast({
    required String message,
    ToastType? toastType,
  }) async {
    if (kIsWeb) {
      await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16.0,
        backgroundColor:
            toastType == ToastType.warning
                ? Colors.amberAccent
                : toastType == ToastType.error
                ? Colors.red
                : Colors.green,
      );
    } else {
      showToast(
        message,
        context: navigationKey.currentContext,
        position: StyledToastPosition.top,
        backgroundColor:
            toastType == ToastType.warning
                ? Colors.amberAccent
                : toastType == ToastType.error
                ? Colors.red
                : Colors.green,
      );
    }
  }

  static bool checkPhoneNumber({required String phoneNumber}) {
    const regexSource = r"^[6-9]\d{9}$";
    RegExp regExp = RegExp(regexSource);
    if (phoneNumber.isEmpty) {
      return false;
    }
    if (phoneNumber.length < 10) {
      return false;
    }
    if (!regExp.hasMatch(phoneNumber)) {
      return false;
    }
    return true;
  }

  static bool checkEmail({required String emailId}) {
    const regexSource =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(regexSource);
    if (emailId.isEmpty) {
      return false;
    }
    if (!regExp.hasMatch(emailId)) {
      return false;
    }
    return true;
  }

  static Future<DateTime> selectDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(4000),
    );
    return pickedDate!;
  }

  static Map<String, dynamic> greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return {"greets": "Good Morning, ", "icon": Icons.wb_sunny};
    }
    if (hour < 17) {
      return {"greets": "Good Afternoon, ", "icon": Icons.wb_sunny_outlined};
    }
    return {"greets": "Good Evening, ", "icon": FontAwesomeIcons.solidMoon};
  }

  /// Changes date format from string to string depends on patterns
  /// Input format, as per [requestPattern] passed in parameter or default is used
  /// Output format, as per [responsePattern] passed in parameter or default is used
  static String dateCustomFormat({
    required String date,
    String requestPattern = "dd MMM, yyyy",
    String responsePattern = "yyyy-MM-dd",
    bool reversePattern = false,
  }) {
    if (reversePattern) {
      final dateTime = DateFormat(responsePattern).parse(date);
      return DateFormat(requestPattern).format(dateTime);
    }
    final dateTime = DateFormat(requestPattern).parse(date);
    return DateFormat(responsePattern).format(dateTime);
  }

  /// Input format : yyyy-M-dd HH:mm (2000-02-14 13:27)
  /// Output format, as per [pattern] passed in parameter or default is used
  static String dateTimeToString({
    required DateTime date,
    String? pattern = "dd MMM, yyyy",
  }) {
    return DateFormat(pattern).format(date);
  }

  /// Input format, as per [pattern] passed in parameter or default is used
  /// Output format : yyyy-M-dd HH:mm (2000-02-14 13:27)
  static DateTime stringToDateTime({
    required String date,
    String? pattern = "dd MMM, yyyy",
  }) {
    return DateFormat(pattern).parse(date);
  }
}
