import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart' show FCButton;
import 'package:flutter_components/src/core/fc_imports.dart';

class FCFormTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? style;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? hintFontSize;
  final Color? hintFontColor;
  final FontWeight? hintFontWeight;
  final String? labelText;
  final TextStyle? labelStyle;
  final double? labelFontSize;
  final Color? labelFontColor;
  final FontWeight? labelFontWeight;
  //
  final bool isPassword;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final void Function()? onTap;
  final bool? enabled;
  final bool? readOnly;
  final EdgeInsets? contentPadding;
  final BorderSide? enabledBorder;
  final bool isRequired;
  final String? errorText;
  //
  final TextFieldInputBorder borderType;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final double? defaultRadius;
  final double borderRadius;
  final double enabledBorderRadius;
  final double focusedBorderRadius;
  final double errorBorderRadius;
  final double focusedErrorBorderRadius;
  final double? defaultWidth;
  final double borderWidth;
  final double enabledBorderWidth;
  final double focusedBorderWidth;
  final double errorBorderWidth;
  final double focusedErrorBorderWidth;

  final String? Function(String?)? validator;

  const FCFormTextField({
    super.key,
    this.controller,
    this.borderType = TextFieldInputBorder.outLine,
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
  });

  @override
  State<FCFormTextField> createState() => _FCFormTextFieldState();
}

class _FCFormTextFieldState extends State<FCFormTextField> {
  bool _showPassword = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    if (widget.initialValue != null) {
      if (widget.initialValue!.isNotEmpty) {
        _controller.text = widget.initialValue!;
      }
    }
    _showPassword = widget.isPassword;
  }

  @override
  void didUpdateWidget(covariant FCFormTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      if (widget.controller != null) {
        _controller = widget.controller!;
      }
      if (widget.initialValue != null) {
        if (widget.initialValue!.isNotEmpty) {
          _controller.text = widget.initialValue!;
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void hideShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      maxLength: widget.maxLength,
      enabled: widget.enabled ?? true,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      maxLines: widget.maxLines ?? 1,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      keyboardType: widget.keyboardType ?? TextInputType.none,
      obscureText: _showPassword,
      onFieldSubmitted: widget.onSubmit,
      validator:
          widget.validator ??
          (!widget.isRequired
              ? null
              : (value) {
                if (value == null || value.isEmpty) {
                  return widget.errorText ?? 'This field is required';
                }
                return null;
              }),
      style:
          widget.style ??
          context.textTheme.bodyLarge!.copyWith(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.fontColor ?? Colors.black,
          ),
      decoration: InputDecoration(
        // constraints:
        counterText: "",
        hintText:
            widget.hintText == null
                ? null
                : "${widget.hintText}${widget.isRequired ? '*' : ''}",
        hintStyle:
            widget.hintStyle ??
            context.textTheme.bodyLarge!.copyWith(
              fontSize: widget.hintFontSize,
              fontWeight: widget.hintFontWeight,
              color: widget.hintFontColor ?? Colors.grey,
            ),

        labelText:
            widget.labelText == null
                ? null
                : "${widget.labelText}${widget.isRequired ? '*' : ''}",
        labelStyle:
            widget.labelStyle ??
            context.textTheme.bodyLarge!.copyWith(
              color: widget.labelFontColor ?? Colors.grey,
              fontSize: widget.labelFontSize,
              fontWeight: widget.labelFontWeight,
            ),
        prefixIcon: widget.prefix,
        suffixIcon:
            widget.isPassword
                ? FCButton.icon(
                  onPressed: () {
                    hideShowPassword();
                  },
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                )
                : widget.suffix,
        prefixIconColor: Theme.of(context).iconTheme.color,
        suffixIconColor: Theme.of(context).iconTheme.color,
        border: FCUtils.borderType(
          DifferentBorder.border,
          widget.borderType,
          widget.borderColor ?? context.borderColor,
          borderRadius: widget.defaultRadius ?? widget.borderRadius,
          borderWidth: widget.defaultWidth ?? widget.borderWidth,
        ),
        enabledBorder: FCUtils.borderType(
          DifferentBorder.enabledBorder,
          widget.borderType,
          widget.enabledBorderColor ?? context.enabledBorderColor,
          borderRadius: widget.defaultRadius ?? widget.enabledBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.enabledBorderWidth,
        ),
        focusedBorder: FCUtils.borderType(
          DifferentBorder.focusedBorder,
          widget.borderType,
          widget.focusedBorderColor ?? context.primaryColor,
          borderRadius: widget.defaultRadius ?? widget.focusedBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.focusedBorderWidth,
        ),
        errorBorder: FCUtils.borderType(
          DifferentBorder.errorBorder,
          widget.borderType,
          widget.errorBorderColor ?? context.errorColor,
          borderRadius: widget.defaultRadius ?? widget.errorBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.errorBorderWidth,
        ),
        focusedErrorBorder: FCUtils.borderType(
          DifferentBorder.focusedErrorBorder,
          widget.borderType,
          widget.focusedErrorBorderColor ?? context.errorColor,
          borderRadius: widget.defaultRadius ?? widget.focusedBorderRadius,
          borderWidth: widget.defaultWidth ?? widget.focusedErrorBorderWidth,
        ),
      ),
      controller: _controller,
    );
  }
}
