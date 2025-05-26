// import 'package:flutter/material.dart';
// import 'package:flutter_components/flutter_components.dart';

// class AppScreenTitle extends StatelessWidget {
//   final String title;
//   final bool navigateBack;

//   const AppScreenTitle(
//     this.title, {
//     super.key,
//     this.navigateBack = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (navigateBack) ...[
//           AppButton.icon(
//               icon: Icon(Icons.arrow_back_ios_new),
//               onPressed: () {
//                 navigationKey.currentState!.pop();
//               }),
//           SizedBox(width: 10.0),
//         ],
//         Text(
//           title,
//           style: context.textTheme.titleMedium!
//               .copyWith(decoration: TextDecoration.underline),
//         ),
//       ],
//     );
//   }
// }
