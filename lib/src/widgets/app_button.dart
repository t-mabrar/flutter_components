// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:flutter_components/src/core/app_imports.dart';
import 'package:flutter_components/src/widgets/app_loading.dart';

class AppButton extends StatefulWidget {
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final bool _isLinkButton;
  final bool _isIconButton;
  final Icon _icon;
  final bool _isWidgetButton;
  final Widget _widgetButton;
  final void Function() onPressed;
  final bool? isLoading;
  final BoxBorder? border;
  final Color? color;
  final TextStyle? titleStyle;
  final Color? fontColor;
  final EdgeInsets? padding;
  final double? elevation;
  final bool isExpanded;
  final bool buttonFullWidth;
  final double? buttonWidth;
  final double? fontSize;
  final bool? _hideUnderLine;
  final FontWeight fontWeight;
  final bool isEnabled;
  final BoxShape? shape;
  final double? borderRadiusValue;
  final BorderRadiusGeometry? borderRadius;

  AppButton({
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
  }) : _isLinkButton = false,
       _isWidgetButton = false,
       _isIconButton = false,
       _hideUnderLine = false,
       _icon = const Icon(Icons.ac_unit),
       _widgetButton = Container(),
       assert(
         shape == null || borderRadius == null,
         "Can't use both shape and borderRadius at the same time",
       ),
       assert(
         shape == null || borderRadiusValue == null,
         "Can't use both shape and borderRadiusValue at the same time",
       );

  const AppButton._internal({
    required this.title,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.color,
    this.padding,
    this.titleStyle,
    this.fontColor,
    required Widget widgetButton,
    required Icon icon,
    required bool isWidgetButton,
    required bool isLinkButton,
    required bool isIconButton,
    required bool hideUnderLine,
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
  }) : _isLinkButton = isLinkButton,
       _isIconButton = isIconButton,
       _isWidgetButton = isWidgetButton,
       _hideUnderLine = hideUnderLine,
       _widgetButton = widgetButton,
       _icon = icon,
       assert(
         shape == null || borderRadius == null,
         "Can't use both shape and borderRadius at the same time",
       ),
       assert(
         shape == null || borderRadiusValue == null,
         "Can't use both shape and borderRadiusValue at the same time",
       );

  factory AppButton.widget({
    Widget? child,
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
    bool? buttonFullWidth,
    BorderRadiusGeometry? borderRadius,
  }) {
    return AppButton._internal(
      widgetButton: child ?? Container(),
      isWidgetButton: true,
      title: "",
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
      icon: const Icon(Icons.ac_unit),
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

  factory AppButton.link({
    required String title,
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
  }) {
    return AppButton._internal(
      isWidgetButton: false,
      title: title,
      prefix: prefix,
      suffix: suffix,
      fontColor: fontColor,
      color: color,
      padding: padding,
      titleStyle: titleStyle,
      fontWeight: fontWeight,
      isLinkButton: true,
      isIconButton: false,
      fontSize: fontSize,
      onPressed: onPressed,
      widgetButton: Container(),
      icon: const Icon(Icons.ac_unit),
      hideUnderLine: hideUnderLine ?? false,
      isEnabled: isEnabled ?? true,
    );
  }

  factory AppButton.icon({
    required Icon icon,
    required void Function() onPressed,
    Widget? prefix,
    Widget? suffix,
    bool? isEnabled,
    bool? buttonFullWidth,
    double? buttonWidth,
  }) {
    return AppButton._internal(
      isWidgetButton: false,
      title: "",
      prefix: prefix,
      suffix: suffix,
      isLinkButton: false,
      isIconButton: true,
      onPressed: onPressed,
      icon: icon,
      hideUnderLine: false,
      widgetButton: Container(),
      isEnabled: isEnabled ?? true,
      buttonFullWidth: buttonFullWidth ?? false,
      buttonWidth: buttonWidth,
    );
  }

  @override
  State<AppButton> createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  Color? _buttonColor;
  bool _isHovered = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _buttonColor = widget.color ?? context.primaryColor;
        isEnabled = widget.isEnabled && (widget.isLoading ?? true);
      });
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    if (oldWidget.color != widget.color) {
      _buttonColor = widget.color ?? context.primaryColor;
    }
    if (widget.isEnabled != oldWidget.isEnabled) {
      isEnabled = widget.isEnabled && (widget.isLoading ?? true);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onHover(bool value) {
    setState(() {
      _isHovered = value;
      _buttonColor =
          value
              ? widget.color == null
                  ? _buttonColor!.withValues(alpha: 0.7)
                  : Colors.transparent
              : widget.color ?? context.primaryColor;
    });
  }

  Widget _buildButtonContent() {
    if (widget._isIconButton) {
      return widget._icon;
    } else if (widget._isLinkButton) {
      return Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Text(
          widget.title,
          style:
              widget.titleStyle ??
              context.textTheme.bodyMedium!.copyWith(
                fontWeight: widget.fontWeight,
                color:
                    isEnabled
                        ? (widget.fontColor ?? context.primaryColor)
                        : Colors.black,
                fontSize: widget.fontSize,
                decoration:
                    (widget._hideUnderLine ?? false)
                        ? null
                        : TextDecoration.underline,
                decorationColor: widget.fontColor ?? context.primaryColor,
              ),
        ),
      );
    } else if (widget.isLoading ?? false) {
      return const AppLoading();
    } else {
      return _buildDefaultButton();
    }
  }

  Widget get _textWidget {
    return Text(
      widget.title,
      style:
          widget.titleStyle ??
          context.textTheme.bodyMedium!.copyWith(
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color:
                isEnabled ? (widget.fontColor ?? Colors.white) : Colors.black,
          ),
    );
  }

  Widget _buildDefaultButton() {
    return Material(
      color: Colors.transparent,
      shadowColor:
          isEnabled
              ? _buttonColor!.withAlpha(_isHovered ? 125 : 255)
              : Colors.transparent,
      elevation: widget.elevation ?? 0.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: widget.shape ?? BoxShape.rectangle,
          border: widget.border,
          color: isEnabled ? _buttonColor : Colors.grey,
          borderRadius:
              widget.shape != null
                  ? null
                  : widget.borderRadius ??
                      BorderRadius.circular(widget.borderRadiusValue ?? 5.0),
        ),
        child: Padding(
          padding:
              widget.padding ??
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child:
              widget._isWidgetButton
                  ? widget._widgetButton
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.prefix != null) ...[
                        widget.prefix!,
                        const SizedBox(width: 10.0),
                      ],
                      widget.isExpanded
                          ? Expanded(child: Center(child: _textWidget))
                          : _textWidget,
                      if (widget.suffix != null) ...[
                        const SizedBox(width: 10.0),
                        widget.suffix!,
                      ],
                    ],
                  ),
        ),
      ),
    );
  }

  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return _buttonColor == null
        ? SizedBox.shrink()
        : SizedBox(
          width:
              widget.buttonWidth ??
              (widget.buttonFullWidth ? double.infinity : null),
          child: InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor:
                !isEnabled ? Colors.transparent : _buttonColor!.withAlpha(50),
            onTap: !isEnabled ? null : () => widget.onPressed(),
            onHover: !isEnabled ? null : _onHover,
            child: Opacity(
              opacity: !isEnabled ? 0.5 : 1.0,
              child: _buildButtonContent(),
            ),
          ),
        );
  }
}
