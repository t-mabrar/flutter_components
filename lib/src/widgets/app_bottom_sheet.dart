import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart';

class AppBottomSheet extends StatefulWidget {
  final String? title;
  final Widget body;
  final String? submitTitle;
  final void Function()? onSubmit;
  final void Function()? onCancel;
  final bool showActionButton;
  final bool actionLoading;

  const AppBottomSheet({
    super.key,
    this.title,
    required this.body,
    this.submitTitle,
    this.onSubmit,
    this.onCancel,
    this.showActionButton = true,
    this.actionLoading = false,
  });

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            // color: AppTheme.kSectionBGColor,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(5.0),
            //   topRight: Radius.circular(5.0),
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title ?? "",
                  style: context.textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (widget.showActionButton) ...[
                  widget.actionLoading
                      ? AppLoading()
                      : Row(
                        children: [
                          AppButton(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            title: widget.submitTitle ?? "Submit",
                            onPressed: () {
                              if (widget.onSubmit != null) {
                                widget.onSubmit!();
                              }
                            },
                          ),
                          SizedBox(width: 10.0),
                          AppButton.icon(
                            onPressed: () {
                              if (widget.onCancel != null) {
                                widget.onCancel!();
                              }
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                ],
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: widget.body,
        ),
      ],
    );
  }
}
