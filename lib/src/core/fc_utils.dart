import 'dart:math'; // Imports the 'dart:math' library for mathematical operations like `pow`.

import 'package:flutter/foundation.dart'; // Imports Flutter foundation utilities, including `kIsWeb`.
import 'package:flutter/material.dart'; // Imports the core Flutter Material Design library.
import 'package:flutter/services.dart'; // Imports Flutter services, used for setting application switcher description.
import 'package:flutter_app_components/src/core/fc_imports.dart'; // Imports core utilities from the package, likely including enums like TextFieldInputBorder and DifferentBorder.
import 'package:flutter_styled_toast/flutter_styled_toast.dart'; // Imports a package for styled toasts.
import 'package:fluttertoast/fluttertoast.dart'; // Imports a package for platform-specific toasts (used for web).
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Imports Font Awesome icons for Flutter.
import 'package:intl/intl.dart'; // Imports the internationalization library for date and time formatting.

/// GlobalKey for the main NavigatorState, used for navigation operations.
final navigationKey = GlobalKey<NavigatorState>();

/// GlobalKey for another NavigatorState, possibly for a different navigation stack.
final mainNavigationKey = GlobalKey<NavigatorState>();

/// Extension on [String] to convert hexadecimal color strings to [Color] objects.
extension HexColor on String {
  /// Converts a hex string (e.g., "aabbcc" or "ffaabbcc") to a [Color] object.
  /// An optional leading "#" is handled.
  Color get fromHex {
    final buffer = StringBuffer();
    // If the string is 6 or 7 characters long, prepend 'FF' for full opacity.
    if (length == 6 || length == 7) buffer.write('FF');
    // Remove any leading '#' and append the rest to the buffer.
    buffer.write(replaceFirst('#', ''));
    // Parse the hexadecimal string to an integer and create a Color object.
    int colorIntValue = int.parse(buffer.toString(), radix: 16);
    return Color(colorIntValue);
  }
}

/// Enum to define different types of toasts (success, warning, error).
enum ToastType { success, warning, error }

/// Returns the default header text style from the current [Theme]'s [TextTheme].
TextStyle? headerTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleMedium;
}

/// A constant integer representing the default number of rows in a data grid.
int kAppDataGridRowsCount = 50;

/// Calculates the preferred width for a dialog pop-up based on the screen width.
/// It's set to 1/1.2 (approximately 83.3%) of the screen width.
double kAppDialogPopUpWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width / 1.2;
}

/// Sets the page title for web applications, which appears in the browser tab or task switcher.
///
/// [title] is the string to be displayed as the page title.
/// [colorInt] is an optional integer representing the primary color for the application switcher.
void setPageTitle(String title, {int? colorInt}) {
  // This function is only applicable for web platforms.
  if (kIsWeb) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
        label: title,
        primaryColor:
            colorInt ?? 0xFF000000, // Default to black if no color is provided.
      ),
    );
  }
}

/// A utility class containing various helper methods for common app functionalities.
class FCUtils {
  /// Determines the appropriate [InputBorder] for a [TextField] based on the specified type.
  ///
  /// [border] indicates the specific state of the border (e.g., default, enabled, focused, error).
  /// [borderType] specifies whether it's an [UnderlineInputBorder] or [OutlineInputBorder].
  /// [color] is the color of the border.
  /// [borderWidth] is the thickness of the border line.
  /// [borderRadius] is the radius for rounded corners, applicable to [OutlineInputBorder].
  static InputBorder borderType(
    DifferentBorder border,
    FieldBorder borderType,
    Color color, {
    double borderWidth = 2.0,
    double? borderRadius,
  }) {
    switch (borderType) {
      case FieldBorder.underLine:
        // Returns an UnderlineInputBorder with specified color and width.
        // For underline, borderRadius is typically 0.0.
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
          borderSide: BorderSide(color: color, width: borderWidth),
        );

      case FieldBorder.outLine:
        // Returns an OutlineInputBorder with specified color, width, and border radius.
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 4.0,
          ), // Default to 4.0 if not provided.
          borderSide: BorderSide(color: color, width: borderWidth),
        );
    }
  }

  /// Checks if the current device is a mobile device (screen width less than 480.0).
  bool get kIsMobile =>
      MediaQueryData.fromView(
        PlatformDispatcher.instance.implicitView!,
      ).size.width <
      480.0;

  /// Returns the shortest side of the screen width.
  double get screenWidth =>
      MediaQueryData.fromView(
        PlatformDispatcher.instance.implicitView!,
      ).size.shortestSide;

  /// Checks if the current device is a tablet (screen width between 480.0 and 768.0).
  bool get kIsTab => screenWidth > 480.0 && screenWidth < 768.0;

  /// Checks if the current device is a large screen (screen width greater than 768.0).
  bool get kIsBigScreen => screenWidth > 768.0;

  /// Generates a [TextTheme] with customizable font family and default text color.
  ///
  /// This provides a consistent set of text styles for different typographic scales.
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

  /// Replaces placeholders in a template string with actual values from a map.
  ///
  /// [template] is the string with placeholders (e.g., "Hello {name}").
  /// [values] is a map where keys correspond to placeholders and values are their replacements.
  static String apiParsing(String template, Map<String, dynamic> values) {
    values.forEach((key, value) {
      template = template.replaceAll('{$key}', value.toString());
    });
    return template;
  }

  /// A static [Color] representing the default scaffold background color.
  static Color scaffoldBGColor = const Color(0xFFFFFFFF);

  /// Rounds a double value to a specified number of decimal places.
  ///
  /// [value] the double number to round.
  /// [places] the number of decimal places to round to.
  static double roundDouble(double value, int places) {
    double mod = pow(10.0, places).toDouble();
    return ((value * mod).round().toDouble() / mod);
  }

  /// Converts a hexadecimal color string to a [Color] object.
  /// This is a static method version of the [HexColor] extension.
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Displays a toast message to the user.
  /// Uses `fluttertoast` for web and `flutter_styled_toast` for mobile.
  ///
  /// [message] the text content of the toast.
  /// [toastType] determines the background color of the toast (warning, error, or success).
  static Future<void> appToast({
    required String message,
    ToastType? toastType,
  }) async {
    if (kIsWeb) {
      // For web, use Fluttertoast.
      await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        textColor: Colors.white,
        fontSize: 16.0,
        backgroundColor:
            toastType ==
                    ToastType
                        .warning // Set background color based on toast type.
                ? Colors.amberAccent
                : toastType == ToastType.error
                ? Colors.red
                : Colors.green,
      );
    } else {
      // For non-web (mobile), use flutter_styled_toast.
      showToast(
        message,
        context:
            navigationKey
                .currentContext, // Requires a BuildContext, uses the global navigation key.
        position: StyledToastPosition.top,
        backgroundColor:
            toastType ==
                    ToastType
                        .warning // Set background color based on toast type.
                ? Colors.amberAccent
                : toastType == ToastType.error
                ? Colors.red
                : Colors.green,
      );
    }
  }

  /// Validates a phone number against a regular expression for Indian mobile numbers.
  ///
  /// [phoneNumber] the phone number string to validate.
  /// Returns `true` if the phone number is valid, `false` otherwise.
  static bool checkPhoneNumber({required String phoneNumber}) {
    // Regex for Indian mobile numbers starting with 6-9 and having 10 digits.
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

  /// Validates an email address against a common regular expression.
  ///
  /// [emailId] the email address string to validate.
  /// Returns `true` if the email is valid, `false` otherwise.
  static bool checkEmail({required String emailId}) {
    // Regex for basic email validation.
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

  /// Shows a date picker dialog and returns the selected [DateTime].
  ///
  /// [context] the BuildContext to display the date picker.
  /// [initialDate] the date initially selected in the picker (defaults to now).
  /// [firstDate] the earliest date selectable (defaults to 1900).
  /// [lastDate] the latest date selectable (defaults to 4000).
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
    // Returns the picked date. Note: pickedDate can be null if the user cancels.
    // The `!` operator asserts non-null, which might lead to a runtime error if cancelled.
    return pickedDate!;
  }

  /// Returns a greeting message and an associated icon based on the current hour of the day.
  ///
  /// Returns a [Map] with "greets" (e.g., "Good Morning, ") and "icon" (e.g., Icons.wb_sunny).
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

  /// Changes the format of a date string from one pattern to another.
  ///
  /// [date] the input date string.
  /// [requestPattern] the format of the input date string (default "dd MMM, yyyy").
  /// [responsePattern] the desired output format for the date string (default "yyyy-MM-dd").
  /// [reversePattern] if true, swaps requestPattern and responsePattern for parsing/formatting.
  static String dateCustomFormat({
    required String date,
    String requestPattern = "dd MMM, yyyy",
    String responsePattern = "yyyy-MM-dd",
    bool reversePattern = false,
  }) {
    if (reversePattern) {
      // Parse with responsePattern, format with requestPattern.
      final dateTime = DateFormat(responsePattern).parse(date);
      return DateFormat(requestPattern).format(dateTime);
    }
    // Parse with requestPattern, format with responsePattern.
    final dateTime = DateFormat(requestPattern).parse(date);
    return DateFormat(responsePattern).format(dateTime);
  }

  /// Converts a [DateTime] object to a formatted date string.
  ///
  /// [date] the [DateTime] object to format.
  /// [pattern] the desired output format (default "dd MMM, yyyy").
  /// Input format: yyyy-M-dd HH:mm (e.g., 2000-02-14 13:27)
  static String dateTimeToString({
    required DateTime date,
    String? pattern = "dd MMM, yyyy",
  }) {
    return DateFormat(pattern).format(date);
  }

  /// Converts a formatted date string to a [DateTime] object.
  ///
  /// [date] the input date string.
  /// [pattern] the format of the input date string (default "dd MMM, yyyy").
  /// Output format: yyyy-M-dd HH:mm (e.g., 2000-02-14 13:27)
  static DateTime stringToDateTime({
    required String date,
    String? pattern = "dd MMM, yyyy",
  }) {
    return DateFormat(pattern).parse(date);
  }
}
