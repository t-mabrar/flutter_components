import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart' show AppButton;
import 'package:flutter_components/src/core/app_imports.dart';

class AppFormTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
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
  final TextFieldInputBorder borderType;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;
  final double borderRadius;
  final double enabledBorderRadius;
  final double focusedBorderRadius;
  final double errorBorderRadius;
  final double focusedErrorBorderRadius;
  final double borderWidth;
  final double enabledBorderWidth;
  final double focusedBorderWidth;
  final double errorBorderWidth;
  final double focusedErrorBorderWidth;

  const AppFormTextField({
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
  });

  @override
  State<AppFormTextField> createState() => _AppFormTextFieldState();
}

class _AppFormTextFieldState extends State<AppFormTextField> {
  bool _showPassword = false;
  TextEditingController _controller = TextEditingController();
  bool _useLocalController = false;

  @override
  void initState() {
    if (widget.controller != null && widget.initialValue != null) {
      _useLocalController = true;
      _controller = widget.controller!;
      if (widget.initialValue!.isNotEmpty) {
        _controller.text = widget.initialValue!;
      }
    }
    _showPassword = widget.isPassword;
    super.initState();
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
          !widget.isRequired
              ? null
              : (value) {
                if (value == null || value.isEmpty) {
                  return widget.errorText ?? 'This field is required';
                }
                return null;
              },
      decoration: InputDecoration(
        // constraints:
        counterText: "",
        hintStyle: context.textTheme.bodyLarge!.copyWith(color: Colors.grey),
        hintText:
            widget.hintText == null
                ? null
                : "${widget.hintText}${widget.isRequired ? '*' : ''}",
        labelText:
            widget.labelText == null
                ? null
                : "${widget.labelText}${widget.isRequired ? '*' : ''}",
        labelStyle: context.textTheme.bodyLarge!.copyWith(color: Colors.grey),
        prefixIcon: widget.prefix,
        suffixIcon:
            widget.isPassword
                ? AppButton.icon(
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
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.black, width: 2.0),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide:
        //       widget.enabledBorder ??
        //       BorderSide(color: Colors.black, width: 1.0),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: context.primaryColor, width: 2.0),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 2.0),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 2.0),
        // ),
        border: AppUtils.borderType(
          DifferentBorder.border,
          widget.borderType,
          widget.borderColor ?? context.borderColor,
          borderRadius: widget.borderRadius,
          borderWidth: widget.borderWidth,
        ),
        enabledBorder: AppUtils.borderType(
          DifferentBorder.enabledBorder,
          widget.borderType,
          widget.enabledBorderColor ?? context.enabledBorderColor,
          borderRadius: widget.enabledBorderRadius,
          borderWidth: widget.enabledBorderWidth,
        ),
        focusedBorder: AppUtils.borderType(
          DifferentBorder.focusedBorder,
          widget.borderType,
          widget.focusedBorderColor ?? context.primaryColor,
          borderRadius: widget.focusedBorderRadius,
          borderWidth: widget.focusedBorderWidth,
        ),
        errorBorder: AppUtils.borderType(
          DifferentBorder.errorBorder,
          widget.borderType,
          widget.errorBorderColor ?? context.errorColor,
          borderRadius: widget.errorBorderRadius,
          borderWidth: widget.errorBorderWidth,
        ),
        focusedErrorBorder: AppUtils.borderType(
          DifferentBorder.focusedErrorBorder,
          widget.borderType,
          widget.focusedErrorBorderColor ?? context.errorColor,
          borderRadius: widget.focusedBorderRadius,
          borderWidth: widget.focusedErrorBorderWidth,
        ),
      ),
      controller: _useLocalController ? _controller : widget.controller,
    );
  }
}
