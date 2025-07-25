import 'package:flutter/material.dart';
import 'package:flutter_app_components/flutter_app_components.dart';

class FCNoDataFound extends StatelessWidget {
  final double? imageScale;
  final String? title;
  final String? message;

  const FCNoDataFound({super.key, this.imageScale, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   Assets.images.noDataFound.path,
            //   scale: imageScale ?? 3,
            // ),
            SizedBox(height: 24),
            Text(
              title ?? "No Data Found",
              style: context.textTheme.titleLarge!.copyWith(color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              message ??
                  "It seems there's nothing here. Please try again later or refresh the page.",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
