// import 'package:car_glow_admin/core/app_imports.dart';
// import 'package:car_glow_admin/gen/assets.gen.dart';
// import 'package:flutter/material.dart';

// class AppNoDataFound extends StatelessWidget {
//   final double? imageScale;
//   final String? title;
//   final String? subTitle;

//   const AppNoDataFound({
//     Key? key,
//     this.imageScale,
//     this.title,
//     this.subTitle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               Assets.images.noDataFound.path,
//               scale: imageScale ?? 3,
//             ),
//             SizedBox(height: 24),
//             Text(
//               title ?? "No Data Found",
//               style: context.textTheme.titleLarge!.copyWith(color: Colors.red),
//             ),
//             SizedBox(height: 8),
//             Text(
//               subTitle ??
//                   "It seems there's nothing here. Please try again later or refresh the page.",
//               textAlign: TextAlign.center,
//               style: context.textTheme.bodyLarge,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
