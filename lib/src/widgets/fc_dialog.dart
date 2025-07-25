import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart';

class FCDialog extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final Widget body;
  final EdgeInsets? padding;
  final String? submitTitle;
  final String? closeTitle;
  final void Function()? onSubmit;
  final void Function()? onClose;
  final bool actionLoading;
  final bool showSubmitButton;

  const FCDialog({
    super.key,
    this.width,
    this.height,
    this.title,
    required this.body,
    this.padding,
    this.submitTitle,
    this.closeTitle,
    this.onSubmit,
    this.onClose,
    this.actionLoading = false,
    this.showSubmitButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? "",
                      style: context.textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // FCButton.link(
                    //   hideUnderLine: true,
                    //   title: "Close",
                    //   fontColor: Colors.white,
                    //   onPressed: () {
                    //     if (onCancel != null) {
                    //       onCancel!();
                    //     }
                    //     Navigator.of(context).pop();
                    //   },
                    // ),
                    actionLoading
                        ? FCLoading(showWaitingContent: false)
                        : Row(
                          children: [
                            FCButton.link(
                              hideUnderLine: true,
                              title: closeTitle ?? "Close",
                              fontColor: Colors.white,
                              onPressed: () {
                                if (onClose != null) {
                                  onClose!();
                                }
                                Navigator.of(context).pop();
                              },
                            ),
                            if (showSubmitButton) ...[
                              SizedBox(width: 30.0),
                              FCButton(
                                title: submitTitle ?? "Submit",
                                onPressed: () {
                                  if (onSubmit != null) {
                                    onSubmit!();
                                  }
                                },
                              ),
                            ],
                          ],
                        ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding:
                    padding ?? const EdgeInsets.symmetric(horizontal: 40.0),
                child: SingleChildScrollView(child: body),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
