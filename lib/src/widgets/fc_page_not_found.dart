import 'package:flutter/material.dart';
import 'package:flutter_components/flutter_components.dart';

class FCPageNotFoundScreen extends StatelessWidget {
  final String? title;
  final String? description;
  const FCPageNotFoundScreen({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace this asset path with your selected image path
            // Image.asset(
            //   Assets.images.pageNotFound.path,
            //   // scale: 2,
            // ),
            SizedBox(height: 24),
            Text(
              title ?? "Page Not Found",
              style: context.textTheme.titleLarge!.copyWith(color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              description ?? "The page you are looking for doesn't exist.",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
