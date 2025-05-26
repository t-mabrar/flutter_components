// import 'package:car_glow_admin/core/app_imports.dart';
// import 'package:car_glow_admin/core/widgets/app_button.dart';
// import 'package:car_glow_admin/gen/assets.gen.dart';
// import 'package:flutter/material.dart';

// class PageNotFoundScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Replace this asset path with your selected image path
//             Image.asset(
//               Assets.images.pageNotFound.path,
//               // scale: 2,
//             ),
//             SizedBox(height: 24),
//             Text(
//               "Page Not Found",
//               style: context.textTheme.titleLarge!.copyWith(color: Colors.red),
//             ),
//             SizedBox(height: 8),
//             Text(
//               "The page you are looking for doesn't exist. Please check the URL or go back to the homepage.",
//               textAlign: TextAlign.center,
//               style: context.textTheme.bodyLarge,
//             ),
//             SizedBox(height: 24),
//             AppButton.link(
//               title: "Back",
//               onPressed: () {
//                 if (navigationKey.currentState!.canPop()) {
//                   navigationKey.currentState!.pop();
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
