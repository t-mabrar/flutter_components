// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_app_components/flutter_app_components.dart'
    show
        FCButton; // Imports FCButton specifically from the flutter_app_components package.
import 'package:flutter_app_components/src/core/fc_imports.dart'; // Imports core utilities from the package, likely including enums like TextFieldInputBorder and helper functions like FCUtils.

/// A highly customizable form text field widget.
///
/// This widget provides extensive options for styling the text field's appearance,
/// including font styles, hint text, label text, various border styles,
/// and border colors for different states (enabled, focused, error).
/// It also supports password toggling, input validation, and character limits.
class FCFormTextField extends StatefulWidget {
  // --- Text Field Core Properties ---
  final TextEditingController? controller; // Controller for the text field.
  final String? initialValue; // Initial text value for the text field.
  final TextStyle? style; // Text style for the input text.
  final double? fontSize; // Font size of the input text.
  final Color? fontColor; // Font color of the input text.
  final FontWeight? fontWeight; // Font weight of the input text.

  // --- Hint Text Properties ---
  final String? hintText; // Text displayed when the text field is empty.
  final TextStyle? hintStyle; // Text style for the hint text.
  final double? hintFontSize; // Font size of the hint text.
  final Color? hintFontColor; // Font color of the hint text.
  final FontWeight? hintFontWeight; // Font weight of the hint text.

  // --- Label Text Properties ---
  final String? labelText; // Floating label text.
  final TextStyle? labelStyle; // Text style for the label text.
  final double? labelFontSize; // Font size of the label text.
  final Color? labelFontColor; // Font color of the label text.
  final FontWeight? labelFontWeight; // Font weight of the label text.

  // --- Behavior and Input Properties ---
  final bool
  isPassword; // If true, the text field obscures text and shows a password toggle.
  final Widget? prefix; // Widget to display before the input area.
  final Widget? suffix; // Widget to display after the input area.
  final void Function(String)?
  onSubmit; // Callback when the user submits the text (e.g., presses Enter).
  final void Function(String)?
  onChanged; // Callback when the text in the field changes.
  final TextInputType? keyboardType; // Type of keyboard to display.
  final int?
  maxLines; // Maximum number of lines for the text field. Defaults to 1.
  final int?
  maxLength; // Maximum number of characters allowed in the text field.
  final TextCapitalization? textCapitalization; // How to capitalize text input.
  final void Function()? onTap; // Callback when the text field is tapped.
  final bool?
  enabled; // Whether the text field is enabled for user interaction.
  final bool? readOnly; // If true, the text field cannot be edited.
  final EdgeInsets?
  contentPadding; // Padding for the input content within the text field.
  final BorderSide?
  enabledBorder; // Custom border for the enabled state (might be overridden by other border properties).
  final bool
  isRequired; // If true, the field is marked as required and includes a default validator.
  final String?
  errorText; // Custom error message to display when validation fails for required fields.

  // --- Border Styling Properties ---
  final FieldBorder
  _borderType; // Internal property to define the border type (underline or outline).
  final Color? borderColor; // Default border color.
  final Color?
  enabledBorderColor; // Border color when the text field is enabled.
  final Color?
  focusedBorderColor; // Border color when the text field is focused.
  final Color? errorBorderColor; // Border color when there's an error.
  final Color?
  focusedErrorBorderColor; // Border color when focused with an error.

  final double?
  defaultRadius; // Default border radius for all states if not overridden by specific radii.
  final double borderRadius; // Border radius for the default border state.
  final double
  enabledBorderRadius; // Border radius for the enabled border state.
  final double
  focusedBorderRadius; // Border radius for the focused border state.
  final double errorBorderRadius; // Border radius for the error border state.
  final double
  focusedErrorBorderRadius; // Border radius for the focused error border state.

  final double?
  defaultWidth; // Default border width for all states if not overridden by specific widths.
  final double borderWidth; // Border width for the default border state.
  final double enabledBorderWidth; // Border width for the enabled border state.
  final double focusedBorderWidth; // Border width for the focused border state.
  final double errorBorderWidth; // Border width for the error border state.
  final double
  focusedErrorBorderWidth; // Border width for the focused error border state.

  final String? Function(String?)?
  validator; // Custom validator function for the text field.

  /// Private constructor for internal use by the factory constructors.
  /// It takes all possible properties and sets the [_borderType].
  const FCFormTextField._internal({
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSubmit,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.textCapitalization,
    this.onTap,
    this.enabled,
    this.readOnly,
    this.contentPadding,
    this.enabledBorder,
    this.isRequired = false,
    this.errorText,
    this.borderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.defaultRadius,
    this.borderRadius = 4.0,
    this.enabledBorderRadius = 4.0,
    this.focusedBorderRadius = 4.0,
    this.errorBorderRadius = 4.0,
    this.focusedErrorBorderRadius = 4.0,
    this.defaultWidth,
    this.borderWidth = 1.0,
    this.enabledBorderWidth = 1.0,
    this.focusedBorderWidth = 1.0,
    this.errorBorderWidth = 1.0,
    this.focusedErrorBorderWidth = 1.0,
    this.hintStyle,
    this.hintFontSize,
    this.hintFontColor,
    this.hintFontWeight,
    this.labelStyle,
    this.labelFontSize,
    this.labelFontColor,
    this.labelFontWeight,
    this.style,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.validator,
    required FieldBorder borderType, // Defines the border style.
  }) : _borderType = borderType;

  /// Factory constructor to create an `FCFormTextField` with an underline border.
  /// Sets all border radii to 0.0 for an underline effect.
  factory FCFormTextField.underLine({
    final TextEditingController? controller,
    final String? initialValue,
    final TextStyle? style,
    final double? fontSize,
    final Color? fontColor,
    final FontWeight? fontWeight,
    final String? hintText,
    final TextStyle? hintStyle,
    final double? hintFontSize,
    final Color? hintFontColor,
    final FontWeight? hintFontWeight,
    final String? labelText,
    final TextStyle? labelStyle,
    final double? labelFontSize,
    final Color? labelFontColor,
    final FontWeight? labelFontWeight,
    final bool isPassword = false,
    final Widget? prefix,
    final Widget? suffix,
    final void Function(String)? onSubmit,
    final void Function(String)? onChanged,
    final TextInputType? keyboardType,
    final int? maxLines,
    final int? maxLength,
    final TextCapitalization? textCapitalization,
    final void Function()? onTap,
    final bool? enabled,
    final bool? readOnly,
    final EdgeInsets? contentPadding,
    final BorderSide? enabledBorder,
    final bool isRequired = false,
    final String? errorText,
    final Color? borderColor,
    final Color? enabledBorderColor,
    final Color? focusedBorderColor,
    final Color? errorBorderColor,
    final Color? focusedErrorBorderColor,
    final double? defaultRadius,
    final double? defaultWidth,
    final double borderWidth = 1.0,
    final double enabledBorderWidth = 1.0,
    final double focusedBorderWidth = 1.0,
    final double errorBorderWidth = 1.0,
    final double focusedErrorBorderWidth = 1.0,
    final String? Function(String?)? validator,
  }) {
    return FCFormTextField._internal(
      borderType: FieldBorder.underLine, // Specifies underline border.
      controller: controller,
      initialValue: initialValue,
      hintText: hintText,
      labelText: labelText,
      isPassword: isPassword,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      onTap: onTap,
      enabled: enabled,
      readOnly: readOnly,
      contentPadding: contentPadding,
      enabledBorder: enabledBorder,
      isRequired: isRequired,
      errorText: errorText,
      borderColor: borderColor,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      focusedErrorBorderColor: focusedErrorBorderColor,
      defaultRadius: defaultRadius,
      defaultWidth: defaultWidth,
      borderRadius: 0.0, // Underline has no border radius.
      enabledBorderRadius: 0.0,
      focusedBorderRadius: 0.0,
      errorBorderRadius: 0.0,
      focusedErrorBorderRadius: 0.0,
      borderWidth: borderWidth,
      enabledBorderWidth: enabledBorderWidth,
      focusedBorderWidth: focusedBorderWidth,
      errorBorderWidth: errorBorderWidth,
      focusedErrorBorderWidth: focusedErrorBorderWidth,
      hintStyle: hintStyle,
      hintFontSize: hintFontSize,
      hintFontColor: hintFontColor,
      hintFontWeight: hintFontWeight,
      labelStyle: labelStyle,
      labelFontSize: labelFontSize,
      labelFontColor: labelFontColor,
      labelFontWeight: labelFontWeight,
      style: style,
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: fontWeight,
      validator: validator,
    );
  }

  /// Factory constructor to create an `FCFormTextField` with an outline border.
  /// Uses default border radii (4.0) unless specified otherwise.
  factory FCFormTextField.outLine({
    final TextEditingController? controller,
    final String? initialValue,
    final TextStyle? style,
    final double? fontSize,
    final Color? fontColor,
    final FontWeight? fontWeight,
    final String? hintText,
    final TextStyle? hintStyle,
    final double? hintFontSize,
    final Color? hintFontColor,
    final FontWeight? hintFontWeight,
    final String? labelText,
    final TextStyle? labelStyle,
    final double? labelFontSize,
    final Color? labelFontColor,
    final FontWeight? labelFontWeight,
    final bool isPassword = false,
    final Widget? prefix,
    final Widget? suffix,
    final void Function(String)? onSubmit,
    final void Function(String)? onChanged,
    final TextInputType? keyboardType,
    final int? maxLines,
    final int? maxLength,
    final TextCapitalization? textCapitalization,
    final void Function()? onTap,
    final bool? enabled,
    final bool? readOnly,
    final EdgeInsets? contentPadding,
    final BorderSide? enabledBorder,
    final bool isRequired = false,
    final String? errorText,
    final Color? borderColor,
    final Color? enabledBorderColor,
    final Color? focusedBorderColor,
    final Color? errorBorderColor,
    final Color? focusedErrorBorderColor,
    final double? defaultRadius,
    final double? defaultWidth,
    final double borderRadius = 4.0, // Default border radius for outline.
    final double enabledBorderRadius = 4.0,
    final double focusedBorderRadius = 4.0,
    final double errorBorderRadius = 4.0,
    final double focusedErrorBorderRadius = 4.0,
    final double borderWidth = 1.0,
    final double enabledBorderWidth = 1.0,
    final double focusedBorderWidth = 1.0,
    final double errorBorderWidth = 1.0,
    final double focusedErrorBorderWidth = 1.0,
    final String? Function(String?)? validator,
  }) {
    return FCFormTextField._internal(
      borderType: FieldBorder.outLine, // Specifies outline border.
      controller: controller,
      initialValue: initialValue,
      hintText: hintText,
      labelText: labelText,
      isPassword: isPassword,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      onTap: onTap,
      enabled: enabled,
      readOnly: readOnly,
      contentPadding: contentPadding,
      enabledBorder: enabledBorder,
      isRequired: isRequired,
      errorText: errorText,
      borderColor: borderColor,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      focusedErrorBorderColor: focusedErrorBorderColor,
      defaultRadius: defaultRadius,
      defaultWidth: defaultWidth,
      borderRadius: borderRadius,
      enabledBorderRadius: enabledBorderRadius,
      focusedBorderRadius: focusedBorderRadius,
      errorBorderRadius: errorBorderRadius,
      focusedErrorBorderRadius: focusedErrorBorderRadius,
      borderWidth: borderWidth,
      enabledBorderWidth: enabledBorderWidth,
      focusedBorderWidth: focusedBorderWidth,
      errorBorderWidth: errorBorderWidth,
      focusedErrorBorderWidth: focusedErrorBorderWidth,
      hintStyle: hintStyle,
      hintFontSize: hintFontSize,
      hintFontColor: hintFontColor,
      hintFontWeight: hintFontWeight,
      labelStyle: labelStyle,
      labelFontSize: labelFontSize,
      labelFontColor: labelFontColor,
      labelFontWeight: labelFontWeight,
      style: style,
      fontSize: fontSize,
      fontColor: fontColor,
      fontWeight: fontWeight,
      validator: validator,
    );
  }

  /// Default constructor, creates an `FCFormTextField` with an outline border.
  /// This acts as a shorthand for `FCFormTextField.outLine()`.
  const FCFormTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSubmit,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.textCapitalization,
    this.onTap,
    this.enabled,
    this.readOnly,
    this.contentPadding,
    this.enabledBorder,
    this.isRequired = false,
    this.errorText,
    this.borderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.defaultRadius,
    this.defaultWidth,
    this.borderRadius = 4.0,
    this.enabledBorderRadius = 4.0,
    this.focusedBorderRadius = 4.0,
    this.errorBorderRadius = 4.0,
    this.focusedErrorBorderRadius = 4.0,
    this.borderWidth = 1.0,
    this.enabledBorderWidth = 1.0,
    this.focusedBorderWidth = 1.0,
    this.errorBorderWidth = 1.0,
    this.focusedErrorBorderWidth = 1.0,
    this.hintStyle,
    this.hintFontSize,
    this.hintFontColor,
    this.hintFontWeight,
    this.labelStyle,
    this.labelFontSize,
    this.labelFontColor,
    this.labelFontWeight,
    this.style,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.validator,
  }) : _borderType = FieldBorder.outLine; // Default to outline border.

  @override
  State<FCFormTextField> createState() => _FCFormTextFieldState();
}

/// The state class for `FCFormTextField`.
class _FCFormTextFieldState extends State<FCFormTextField> {
  bool _showPassword = false; // Internal state to toggle password visibility.
  TextEditingController _controller =
      TextEditingController(); // The actual controller used by TextFormField.

  @override
  void initState() {
    super.initState();
    // If a controller is provided, use it; otherwise, the internal controller is used.
    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    // Set the initial value if provided.
    if (widget.initialValue != null) {
      if (widget.initialValue!.isNotEmpty) {
        _controller.text = widget.initialValue!;
      }
    }
    // Initialize password visibility based on `isPassword` prop.
    _showPassword = widget.isPassword;
  }

  @override
  void didUpdateWidget(covariant FCFormTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // This method is called when the widget's configuration changes.
    // It's crucial to update the internal controller and initial value
    // if the parent widget provides new ones.
    if (oldWidget != widget) {
      // If the controller changes, update it.
      if (widget.controller != null) {
        _controller = widget.controller!;
      }
      // If the initial value changes, update the text.
      if (widget.initialValue != null) {
        if (widget.initialValue!.isNotEmpty) {
          _controller.text = widget.initialValue!;
        }
      }
    }
  }

  @override
  void dispose() {
    // Only dispose the internal controller if it's not managed externally.
    // If widget.controller is null, it means _controller was created internally and should be disposed.
    // If widget.controller is not null, it means the controller is managed by the parent,
    // and disposing it here would cause issues.
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  /// Toggles the visibility of the password text.
  void hideShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false, // Whether the field is read-only.
      maxLength: widget.maxLength, // Maximum characters allowed.
      enabled: widget.enabled ?? true, // Whether the field is enabled.
      onChanged: widget.onChanged, // Callback on text change.
      onTap: widget.onTap, // Callback on tap.
      maxLines: widget.maxLines ?? 1, // Max lines, defaults to 1.
      textCapitalization:
          widget.textCapitalization ??
          TextCapitalization.none, // Text capitalization.
      keyboardType:
          widget.keyboardType ??
          TextInputType
              .none, // Keyboard type, defaults to none (system decides).
      obscureText: _showPassword, // Obscure text for password fields.
      onFieldSubmitted: widget.onSubmit, // Callback on field submission.
      validator:
          widget
              .validator ?? // Use custom validator if provided, else use default.
          (!widget
                  .isRequired // If not required, no validation needed.
              ? null
              : (value) {
                // Default validator for required fields.
                if (value == null || value.isEmpty) {
                  return widget.errorText ??
                      'This field is required'; // Default error message.
                }
                return null; // No error.
              }),
      style:
          widget.style ?? // Use custom text style if provided, else create one.
          context.textTheme.bodyLarge!.copyWith(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.fontColor ?? Colors.black, // Default font color.
          ),
      decoration: InputDecoration(
        // constraints: // Potentially used for sizing constraints.
        counterText: "", // Hides the character counter below the text field.
        hintText:
            widget.hintText ==
                    null // Display hint text with a '*' if required.
                ? null
                : "${widget.hintText}${widget.isRequired ? '*' : ''}",
        hintStyle:
            widget
                .hintStyle ?? // Use custom hint style if provided, else create one.
            context.textTheme.bodyLarge!.copyWith(
              fontSize: widget.hintFontSize,
              fontWeight: widget.hintFontWeight,
              color: widget.hintFontColor ?? Colors.grey, // Default hint color.
            ),

        labelText:
            widget.labelText ==
                    null // Display label text with a '*' if required.
                ? null
                : "${widget.labelText}${widget.isRequired ? '*' : ''}",
        labelStyle:
            widget
                .labelStyle ?? // Use custom label style if provided, else create one.
            context.textTheme.bodyLarge!.copyWith(
              color:
                  widget.labelFontColor ?? Colors.grey, // Default label color.
              fontSize: widget.labelFontSize,
              fontWeight: widget.labelFontWeight,
            ),
        prefixIcon: widget.prefix, // Custom prefix icon.
        suffixIcon:
            widget
                    .isPassword // Conditional suffix icon for password visibility toggle.
                ? FCButton.icon(
                  onPressed: () {
                    hideShowPassword(); // Toggles password visibility.
                  },
                  icon: Icon(
                    _showPassword
                        ? Icons.visibility
                        : Icons
                            .visibility_off, // Icon changes based on visibility.
                  ),
                )
                : widget.suffix, // Custom suffix icon if not a password field.
        prefixIconColor:
            Theme.of(context).iconTheme.color, // Color for prefix icon.
        suffixIconColor:
            Theme.of(context).iconTheme.color, // Color for suffix icon.
        // Border definitions for different states using FCUtils.borderType helper.
        border: FCUtils.borderType(
          DifferentBorder.border, // Enum for the default border.
          widget._borderType, // Underline or Outline.
          widget.borderColor ?? context.borderColor, // Default border color.
          borderRadius:
              widget.defaultRadius ??
              widget.borderRadius, // Default border radius.
          borderWidth:
              widget.defaultWidth ??
              widget.borderWidth, // Default border width.
        ),
        enabledBorder: FCUtils.borderType(
          DifferentBorder.enabledBorder, // Enum for the enabled border.
          widget._borderType,
          widget.enabledBorderColor ??
              context.enabledBorderColor, // Enabled border color.
          borderRadius: widget.defaultRadius ?? widget.enabledBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.enabledBorderWidth,
        ),
        focusedBorder: FCUtils.borderType(
          DifferentBorder.focusedBorder, // Enum for the focused border.
          widget._borderType,
          widget.focusedBorderColor ??
              context
                  .primaryColor, // Focused border color (often primary color).
          borderRadius: widget.defaultRadius ?? widget.focusedBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.focusedBorderWidth,
        ),
        errorBorder: FCUtils.borderType(
          DifferentBorder.errorBorder, // Enum for the error border.
          widget._borderType,
          widget.errorBorderColor ?? context.errorColor, // Error border color.
          borderRadius: widget.defaultRadius ?? widget.errorBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.errorBorderWidth,
        ),
        focusedErrorBorder: FCUtils.borderType(
          DifferentBorder
              .focusedErrorBorder, // Enum for the focused error border.
          widget._borderType,
          widget.focusedErrorBorderColor ??
              context.errorColor, // Focused error border color.
          borderRadius: widget.defaultRadius ?? widget.focusedBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.focusedErrorBorderWidth,
        ),
      ),
      controller: _controller, // Assigns the internal or external controller.
    );
  }
}
