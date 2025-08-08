import 'package:flutter/material.dart';
import 'package:flutter_app_components/flutter_app_components.dart';
import 'package:flutter_app_components/src/widgets/fc_no_options.dart';

class FCDropDown extends StatefulWidget {
  final List<DropdownButtonItem> items;
  final DropdownButtonItem? initialValue;
  final String? hintText;
  final String? labelText;
  final bool isRequired;
  final Widget? prefix;
  final Widget? suffix;
  final ValueChanged<DropdownButtonItem?>? onSelect;
  final FieldBorder? borderType;
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

  const FCDropDown({
    super.key,
    required this.items,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.isRequired = false,
    this.prefix,
    this.suffix,
    this.onSelect,
    this.borderType,
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
  });

  @override
  State<FCDropDown> createState() => _FCDropDownState();
}

class _FCDropDownState extends State<FCDropDown> {
  OverlayEntry? dropdownOverlayEntry;
  final dropdownLayerLink = LayerLink();
  final textFieldController = TextEditingController();
  final selectorKey = GlobalKey();

  late List<DropdownButtonItem> dropdownOptions;

  @override
  void initState() {
    super.initState();
    dropdownOptions = List.from(widget.items);
    if (widget.initialValue != null) {
      textFieldController.text = widget.initialValue!.title;
    }
  }

  @override
  void didUpdateWidget(FCDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      dropdownOptions = List.from(widget.items);
    }
  }

  OverlayEntry optionsOverlayEntry() {
    final RenderBox renderBox =
        selectorKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final positionHeight =
        context.height - offset.dy > 250
            ? size.height + 3.0
            : dropdownOptions.length * 20.0 < 240.0
            ? -(dropdownOptions.length * 20.0 + size.height)
            : -255.0;
    final positionWidth =
        context.width - offset.dx < 250.0
            ? -(250 - (context.width - offset.dx))
            : 0.0;
    final optionsToShow = dropdownOptions.where(
      (eachEntry) =>
          !(textFieldController.text.toLowerCase() ==
              eachEntry.title.toLowerCase()),
    );
    return OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    dropdownOverlayEntry?.remove();
                    dropdownOverlayEntry = null;
                  },
                ),
              ),
              Positioned(
                width: size.width,
                child: CompositedTransformFollower(
                  link: dropdownLayerLink,
                  showWhenUnlinked: false,
                  offset: Offset(positionWidth, positionHeight),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 250.0),
                    child: StatefulBuilder(
                      builder: (context, snapState) {
                        return TextFieldTapRegion(
                          child: Material(
                            elevation: 5.0,
                            color: Colors.white,
                            child:
                                optionsToShow.isEmpty
                                    ? const FCNoOptions()
                                    : SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...optionsToShow.map((eachMapEntry) {
                                            return Container(
                                              width: double.infinity,
                                              color:
                                                  eachMapEntry.title
                                                              .toString() ==
                                                          textFieldController
                                                              .text
                                                      ? Colors.grey.withAlpha(
                                                        50,
                                                      )
                                                      : Colors.transparent,
                                              child: InkWell(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 7.0,
                                                      ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          eachMapEntry.title
                                                              .toString(),
                                                          style:
                                                              context
                                                                  .textTheme
                                                                  .titleSmall,
                                                        ),
                                                      ),
                                                      if (eachMapEntry
                                                              .extraInfo !=
                                                          null) ...[
                                                        if (eachMapEntry
                                                                .extraInfo!['second_title'] !=
                                                            null) ...[
                                                          if (eachMapEntry
                                                              .extraInfo!['second_title']
                                                              .toString()
                                                              .isNotEmpty) ...[
                                                            Text(
                                                              eachMapEntry
                                                                  .extraInfo!['second_title']
                                                                  .toString(),
                                                              style: context
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    color:
                                                                        Colors
                                                                            .grey,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                          ],
                                                        ],
                                                      ],
                                                    ],
                                                  ),
                                                ),
                                                onTap: () {
                                                  textFieldController.text =
                                                      eachMapEntry.title;
                                                  dropdownOverlayEntry
                                                      ?.remove();
                                                  dropdownOverlayEntry = null;
                                                  if (widget.onSelect != null) {
                                                    widget.onSelect!(
                                                      eachMapEntry,
                                                    );
                                                  }
                                                },
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      key: selectorKey,
      link: dropdownLayerLink,
      child:
          widget.borderType == null ||
                  widget.borderType == FieldBorder.outLine
              ? FCFormTextField(
                onChanged: (query) {
                  if (widget.onSelect != null) widget.onSelect!(null);
                  setState(() {
                    if (query.isNotEmpty) {
                      dropdownOptions =
                          widget.items
                              .where(
                                (eachOption) => eachOption.title
                                    .toLowerCase()
                                    .contains(query.toLowerCase()),
                              )
                              .toList();
                    } else {
                      dropdownOptions = List.from(widget.items);
                    }
                  });
                  if (dropdownOptions.length == 1 && widget.onSelect != null) {
                    if (query.toLowerCase() ==
                        dropdownOptions.first.title.toLowerCase()) {
                      widget.onSelect!(
                        DropdownButtonItem(
                          key: dropdownOptions.first.key,
                          title: dropdownOptions.first.title,
                          extraInfo: dropdownOptions.first.extraInfo,
                        ),
                      );
                    }
                  }
                  dropdownOverlayEntry?.remove();
                  dropdownOverlayEntry = null;
                  dropdownOverlayEntry = optionsOverlayEntry();
                  Overlay.of(context).insert(dropdownOverlayEntry!);
                },
                controller: textFieldController,
                onTap: () {
                  dropdownOverlayEntry?.remove();
                  dropdownOverlayEntry = null;
                  dropdownOverlayEntry = optionsOverlayEntry();
                  Overlay.of(context).insert(dropdownOverlayEntry!);
                },
                hintText: widget.hintText,
                suffix: widget.suffix ?? Icon(Icons.arrow_drop_down),
                prefix: widget.prefix,
                labelText: widget.labelText,
                borderColor: widget.borderColor,
                enabledBorderColor: widget.enabledBorderColor,
                focusedBorderColor: widget.focusedBorderColor,
                errorBorderColor: widget.errorBorderColor,
                focusedErrorBorderColor: widget.focusedErrorBorderColor,
                defaultRadius: widget.defaultRadius,
                defaultWidth: widget.defaultWidth,
                borderRadius: widget.borderRadius,
                enabledBorderRadius: widget.enabledBorderRadius,
                focusedBorderRadius: widget.focusedBorderRadius,
                errorBorderRadius: widget.errorBorderRadius,
                focusedErrorBorderRadius: widget.focusedErrorBorderRadius,
                borderWidth: widget.borderWidth,
                enabledBorderWidth: widget.enabledBorderWidth,
                focusedBorderWidth: widget.focusedBorderWidth,
                errorBorderWidth: widget.errorBorderWidth,
                focusedErrorBorderWidth: widget.focusedErrorBorderWidth,
              )
              : FCFormTextField.underLine(
                onChanged: (query) {
                  if (widget.onSelect != null) widget.onSelect!(null);
                  setState(() {
                    if (query.isNotEmpty) {
                      dropdownOptions =
                          widget.items
                              .where(
                                (eachOption) => eachOption.title
                                    .toLowerCase()
                                    .contains(query.toLowerCase()),
                              )
                              .toList();
                    } else {
                      dropdownOptions = List.from(widget.items);
                    }
                  });
                  if (dropdownOptions.length == 1 && widget.onSelect != null) {
                    if (query.toLowerCase() ==
                        dropdownOptions.first.title.toLowerCase()) {
                      widget.onSelect!(
                        DropdownButtonItem(
                          key: dropdownOptions.first.key,
                          title: dropdownOptions.first.title,
                          extraInfo: dropdownOptions.first.extraInfo,
                        ),
                      );
                    }
                  }
                  dropdownOverlayEntry?.remove();
                  dropdownOverlayEntry = null;
                  dropdownOverlayEntry = optionsOverlayEntry();
                  Overlay.of(context).insert(dropdownOverlayEntry!);
                },
                controller: textFieldController,
                onTap: () {
                  dropdownOverlayEntry?.remove();
                  dropdownOverlayEntry = null;
                  dropdownOverlayEntry = optionsOverlayEntry();
                  Overlay.of(context).insert(dropdownOverlayEntry!);
                },
                hintText: widget.hintText,
                suffix: widget.suffix ?? Icon(Icons.arrow_drop_down),
                prefix: widget.prefix,
                labelText: widget.labelText,
                borderColor: widget.borderColor,
                enabledBorderColor: widget.enabledBorderColor,
                focusedBorderColor: widget.focusedBorderColor,
                errorBorderColor: widget.errorBorderColor,
                focusedErrorBorderColor: widget.focusedErrorBorderColor,
                defaultRadius: widget.defaultRadius,
                defaultWidth: widget.defaultWidth,
                borderWidth: widget.borderWidth,
                enabledBorderWidth: widget.enabledBorderWidth,
                focusedBorderWidth: widget.focusedBorderWidth,
                errorBorderWidth: widget.errorBorderWidth,
                focusedErrorBorderWidth: widget.focusedErrorBorderWidth,
              ),
    );
  }
}
