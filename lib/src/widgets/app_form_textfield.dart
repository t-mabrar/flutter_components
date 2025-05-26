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

  const AppFormTextField({
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
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              widget.enabledBorder ??
              BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.primaryColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      controller: _useLocalController ? _controller : widget.controller,
    );
  }
}
