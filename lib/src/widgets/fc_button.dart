// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_app_components/src/core/fc_imports.dart'; // Imports core utilities, likely including extension methods for BuildContext and potentially other helper classes.
import 'package:flutter_app_components/src/widgets/fc_loading.dart'; // Imports a custom loading indicator widget.

/// A highly customizable button widget with various types and styling options.
///
/// This widget supports:
/// - A standard button with text, optional prefix/suffix widgets.
/// - A link-style button (underlined text).
/// - An icon-only button.
/// - A button that wraps an arbitrary child widget.
/// It also handles loading states, enabled/disabled states, and hover effects.
class FCButton extends StatefulWidget {
  // --- Core Button Properties ---
  final String
  title; // The text displayed on the button (for default and link buttons).
  final Widget? prefix; // Optional widget to display before the title/content.
  final Widget? suffix; // Optional widget to display after the title/content.
  final double?
  prefixSpacing; // Spacing between the prefix and the title/content.
  final double?
  suffixSpacing; // Spacing between the suffix and the title/content.

  // --- Internal Button Type Flags ---
  // These booleans determine the specific type of button being rendered.
  final bool _isLinkButton; // True if it's a link-style button.
  final bool _isIconButton; // True if it's an icon-only button.
  final Icon _icon; // The icon to display if it's an icon button.
  final bool _isWidgetButton; // True if it's a button wrapping a custom widget.
  final Widget
  _widgetButton; // The custom widget to display if it's a widget button.

  // --- Action and State Properties ---
  final void Function()
  onPressed; // Callback function executed when the button is pressed.
  final bool?
  isLoading; // If true, a loading indicator is shown instead of the content.
  final bool isEnabled; // Controls whether the button is interactive.

  // --- Styling Properties ---
  final BoxBorder? border; // Custom border for the button's container.
  final Color? color; // Background color of the button.
  final TextStyle? titleStyle; // Custom text style for the button's title.
  final Color? fontColor; // Color of the button's text/icon.
  final EdgeInsets? padding; // Internal padding of the button content.
  final double? elevation; // Z-coordinate at which to place the button.
  final bool
  isExpanded; // If true, the text content expands to fill available width.
  final bool
  buttonFullWidth; // If true, the button takes the full width of its parent.
  final double?
  buttonWidth; // Specific width for the button. Overrides buttonFullWidth if set.
  final double? fontSize; // Font size for the button's text.
  final bool?
  _hideUnderLine; // Internal flag to hide the underline for link buttons.
  final FontWeight fontWeight; // Font weight for the button's text.
  final BoxShape?
  shape; // Shape of the button's container (e.g., circle, rectangle).
  final double?
  borderRadiusValue; // Radius for circular corners if shape is rectangle.
  final BorderRadiusGeometry?
  borderRadius; // Custom border radius for the button.

  /// Default constructor for a standard button with text.
  /// Initializes internal flags for button type.
  FCButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.prefix,
    this.border,
    this.color,
    this.suffix,
    this.isLoading,
    this.titleStyle,
    this.fontColor,
    this.padding,
    this.elevation,
    this.isExpanded = false,
    this.buttonFullWidth = false,
    this.buttonWidth,
    this.borderRadiusValue,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.isEnabled = true,
    this.shape,
    this.borderRadius,
    this.prefixSpacing,
    this.suffixSpacing,
  }) : _isLinkButton = false, // Not a link button by default.
       _isWidgetButton = false, // Not a widget button by default.
       _isIconButton = false, // Not an icon button by default.
       _hideUnderLine = false, // Underline is not hidden by default.
       _icon = const Icon(
         Icons.ac_unit,
       ), // Placeholder icon, not used for default button.
       _widgetButton =
           Container(), // Placeholder widget, not used for default button.
       // Assertions to prevent conflicting shape/borderRadius properties.
       assert(
         shape == null || borderRadius == null,
         "Can't use both shape and borderRadius at the same time",
       ),
       assert(
         shape == null || borderRadiusValue == null,
         "Can't use both shape and borderRadiusValue at the same time",
       );

  /// Private internal constructor used by factory constructors.
  /// This allows factory constructors to set the internal button type flags.
  const FCButton._internal({
    required this.title,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.color,
    this.padding,
    this.titleStyle,
    this.fontColor,
    required Widget widgetButton, // Passed by factory constructors.
    required Icon icon, // Passed by factory constructors.
    required bool isWidgetButton, // Passed by factory constructors.
    required bool isLinkButton, // Passed by factory constructors.
    required bool isIconButton, // Passed by factory constructors.
    required bool hideUnderLine, // Passed by factory constructors.
    this.isLoading,
    this.fontWeight = FontWeight.normal,
    this.border,
    this.elevation,
    this.isExpanded = false,
    this.buttonWidth,
    this.buttonFullWidth = false,
    this.borderRadiusValue,
    this.fontSize,
    this.shape,
    this.isEnabled = true,
    this.borderRadius,
    this.prefixSpacing,
    this.suffixSpacing,
  }) : _isLinkButton = isLinkButton,
       _isIconButton = isIconButton,
       _isWidgetButton = isWidgetButton,
       _hideUnderLine = hideUnderLine,
       _widgetButton = widgetButton,
       _icon = icon,
       // Assertions for shape and border radius compatibility.
       assert(
         shape == null || borderRadius == null,
         "Can't use both shape and borderRadius at the same time",
       ),
       assert(
         shape == null || borderRadiusValue == null,
         "Can't use both shape and borderRadiusValue at the same time",
       );

  /// Factory constructor to create a button with a custom child widget.
  /// The `child` widget will be displayed inside the button.
  factory FCButton.widget({
    Widget? child, // The custom widget to be displayed.
    required void Function() onPressed,
    Color? color,
    Color? fontColor,
    TextStyle? titleStyle,
    EdgeInsets? padding,
    Widget? prefix,
    Widget? suffix,
    bool? hideUnderLine,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    bool? isEnabled,
    BoxShape? shape,
    double? borderRadiusValue,
    double? elevation,
    double? buttonWidth,
    double? prefixSpacing,
    double? suffixSpacing,
    bool? buttonFullWidth,
    BorderRadiusGeometry? borderRadius,
  }) {
    return FCButton._internal(
      prefixSpacing: prefixSpacing,
      suffixSpacing: suffixSpacing,
      widgetButton: child ?? Container(), // Assigns the custom child.
      isWidgetButton: true, // Sets the flag for widget button.
      title: "", // Title is not used for widget buttons.
      prefix: prefix,
      suffix: suffix,
      fontColor: fontColor,
      color: color,
      padding: padding,
      titleStyle: titleStyle,
      fontWeight: fontWeight,
      isLinkButton: false,
      isIconButton: false,
      fontSize: fontSize,
      onPressed: onPressed,
      icon: const Icon(Icons.ac_unit), // Placeholder icon.
      hideUnderLine: hideUnderLine ?? false,
      isEnabled: isEnabled ?? true,
      shape: shape,
      borderRadiusValue: borderRadiusValue,
      elevation: elevation,
      buttonFullWidth: buttonFullWidth ?? false,
      buttonWidth: buttonWidth,
      borderRadius: borderRadius,
    );
  }

  /// Factory constructor to create a link-style button (text with optional underline).
  factory FCButton.link({
    required String title,
    required void Function() onPressed,
    Color? color,
    Color? fontColor,
    TextStyle? titleStyle,
    EdgeInsets? padding,
    Widget? prefix,
    Widget? suffix,
    bool? hideUnderLine, // Option to hide the default underline.
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    bool? isEnabled,
  }) {
    return FCButton._internal(
      isWidgetButton: false,
      title: title,
      prefix: prefix,
      suffix: suffix,
      fontColor: fontColor,
      color: color,
      padding: padding,
      titleStyle: titleStyle,
      fontWeight: fontWeight,
      isLinkButton: true, // Sets the flag for link button.
      isIconButton: false,
      fontSize: fontSize,
      onPressed: onPressed,
      widgetButton: Container(), // Placeholder widget.
      icon: const Icon(Icons.ac_unit), // Placeholder icon.
      hideUnderLine: hideUnderLine ?? false,
      isEnabled: isEnabled ?? true,
    );
  }

  /// Factory constructor to create an icon-only button.
  factory FCButton.icon({
    required Icon icon, // The icon to display.
    required void Function() onPressed,
    Widget?
    prefix, // Note: prefix/suffix might not be typically used for icon buttons.
    Widget? suffix,
    bool? isEnabled,
    bool? buttonFullWidth,
    double? buttonWidth,
  }) {
    return FCButton._internal(
      isWidgetButton: false,
      title: "", // Title is not used for icon buttons.
      prefix: prefix,
      suffix: suffix,
      isLinkButton: false,
      isIconButton: true, // Sets the flag for icon button.
      onPressed: onPressed,
      icon: icon, // Assigns the provided icon.
      hideUnderLine: false,
      widgetButton: Container(), // Placeholder widget.
      isEnabled: isEnabled ?? true,
      buttonFullWidth: buttonFullWidth ?? false,
      buttonWidth: buttonWidth,
    );
  }

  @override
  State<FCButton> createState() => FCButtonState();
}

/// The state class for `FCButton`, managing its internal state and appearance.
class FCButtonState extends State<FCButton> {
  Color?
  _buttonColor; // The current background color of the button, potentially changing on hover.
  bool _isHovered =
      false; // Tracks if the mouse cursor is hovering over the button.
  bool isEnabled = true; // Internal state for button's enabled status.

  @override
  void initState() {
    super.initState();
    // Schedule a callback after the first frame is rendered to initialize button color and enabled state.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // Initialize button color: use widget.color if provided, else context's primary color.
        _buttonColor = widget.color ?? context.primaryColor;
        // Initialize enabled state: true only if widget.isEnabled is true AND isLoading is false.
        // The original code `(widget.isLoading ?? true)` seems to have a logical error here.
        // It should likely be `!(widget.isLoading ?? false)` to disable when loading.
        // Assuming the intent is: if isLoading is true, the button is disabled.
        isEnabled = widget.isEnabled && !(widget.isLoading ?? false);
      });
    });
  }

  @override
  void didUpdateWidget(covariant FCButton oldWidget) {
    // Called when the widget's configuration changes.
    super.didUpdateWidget(oldWidget);
    // Update button color if the `color` property changes.
    if (oldWidget.color != widget.color) {
      _buttonColor = widget.color ?? context.primaryColor;
    }
    // Update enabled state if `isEnabled` or `isLoading` properties change.
    if (widget.isEnabled != oldWidget.isEnabled ||
        widget.isLoading != oldWidget.isLoading) {
      // Re-evaluate the enabled state based on new widget properties.
      isEnabled = widget.isEnabled && !(widget.isLoading ?? false);
    }
  }

  /// Handles hover events to change the button's appearance.
  void _onHover(bool value) {
    setState(() {
      _isHovered = value;
      // Adjust button color on hover:
      // If no custom color is set, slightly reduce alpha on hover.
      // If a custom color is set, it becomes transparent on hover (this might be an unintended effect for non-link buttons).
      _buttonColor =
          value
              ? widget.color == null
                  ? _buttonColor!.withOpacity(
                    0.7,
                  ) // Use withOpacity for alpha adjustment
                  : Colors
                      .transparent // This makes the button transparent on hover if widget.color is provided.
              : widget.color ??
                  context
                      .primaryColor; // Revert to original color when not hovered.
    });
  }

  /// Builds the main content of the button based on its type and loading state.
  Widget _buildButtonContent() {
    if (widget._isIconButton) {
      return widget._icon; // Return the icon for icon buttons.
    } else if (widget._isLinkButton) {
      return Padding(
        padding:
            widget.padding ?? EdgeInsets.zero, // Apply padding for link text.
        child: Text(
          widget.title,
          style:
              widget.titleStyle ??
              context.textTheme.bodyMedium!.copyWith(
                fontWeight: widget.fontWeight,
                // Text color for link button: primary color if enabled, black if disabled.
                color:
                    isEnabled
                        ? (widget.fontColor ?? context.primaryColor)
                        : Colors.black,
                fontSize: widget.fontSize,
                // Apply underline decoration unless explicitly hidden.
                decoration:
                    (widget._hideUnderLine ?? false)
                        ? null
                        : TextDecoration.underline,
                decorationColor:
                    widget.fontColor ??
                    context.primaryColor, // Underline color.
              ),
        ),
      );
    } else if (widget.isLoading ?? false) {
      return const FCLoading(); // Show loading indicator if isLoading is true.
    } else {
      return _buildDefaultButton(); // Build the standard button content.
    }
  }

  /// Getter for the Text widget used in default buttons.
  Widget get _textWidget {
    return Text(
      widget.title,
      style:
          widget.titleStyle ??
          context.textTheme.bodyMedium!.copyWith(
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            // Text color for default button: white if enabled, black if disabled.
            color:
                isEnabled ? (widget.fontColor ?? Colors.white) : Colors.black,
          ),
    );
  }

  /// Builds the visual structure for default and widget-based buttons.
  Widget _buildDefaultButton() {
    return Material(
      color: Colors.transparent, // Material widget for elevation and shadow.
      shadowColor:
          isEnabled // Shadow color based on enabled state and hover.
              ? _buttonColor!.withAlpha(_isHovered ? 125 : 255)
              : Colors.transparent,
      elevation: widget.elevation ?? 0.0, // Button elevation.
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: widget.shape ?? BoxShape.rectangle, // Button shape.
          border: widget.border, // Custom border.
          color:
              isEnabled
                  ? _buttonColor
                  : Colors.grey, // Background color (grey if disabled).
          borderRadius:
              widget.shape !=
                      null // Border radius based on shape or provided values.
                  ? null
                  : widget.borderRadius ??
                      BorderRadius.circular(widget.borderRadiusValue ?? 5.0),
        ),
        child: Padding(
          padding:
              widget.padding ?? // Apply custom padding or default.
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child:
              widget._isWidgetButton
                  ? widget
                      ._widgetButton // Display custom widget if it's a widget button.
                  : Row(
                    // Layout for text button with optional prefix/suffix.
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.prefix != null) ...[
                        widget.prefix!,
                        SizedBox(
                          width: widget.prefixSpacing ?? 10.0,
                        ), // Spacing after prefix.
                      ],
                      widget.isExpanded
                          ? Expanded(
                            child: Center(child: _textWidget),
                          ) // Text expands if isExpanded.
                          : _textWidget, // Standard text widget.
                      if (widget.suffix != null) ...[
                        SizedBox(
                          width: widget.suffixSpacing ?? 10.0,
                        ), // Spacing before suffix.
                        widget.suffix!,
                      ],
                    ],
                  ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Only render if _buttonColor has been initialized.
    return _buttonColor == null
        ? const SizedBox.shrink() // Return an empty box if color is not set yet.
        : SizedBox(
          width:
              widget.buttonWidth ?? // Set button width.
              (widget.buttonFullWidth
                  ? double.infinity
                  : null), // Full width if requested.
          child: InkWell(
            hoverColor:
                Colors.transparent, // Prevents default InkWell hover effect.
            highlightColor:
                Colors
                    .transparent, // Prevents default InkWell highlight effect.
            splashColor:
                !isEnabled // Splash color only if enabled.
                    ? Colors.transparent
                    : _buttonColor!.withAlpha(50), // Semi-transparent splash.
            onTap:
                !isEnabled
                    ? null
                    : () => widget.onPressed(), // Tap only if enabled.
            onHover:
                !isEnabled ? null : _onHover, // Hover effect only if enabled.
            child: Opacity(
              opacity: !isEnabled ? 0.5 : 1.0, // Reduce opacity if disabled.
              child: _buildButtonContent(), // Render the actual button content.
            ),
          ),
        );
  }
}
