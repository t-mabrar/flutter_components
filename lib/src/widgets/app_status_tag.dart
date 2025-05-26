// import 'package:car_glow_admin/core/app_imports.dart';
// import 'package:flutter/material.dart';

// class AppStatusTag extends StatelessWidget {
//   final String status;

//   const AppStatusTag(
//     this.status, {
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> statusTag = {
//       'title': status.statusTitle,
//       'color': Colors.black,
//     };
//     if (status == "active") {
//       statusTag = {
//         'title': "Active",
//         'color': Colors.green,
//       };
//     } else if (status == 'in_active' || status == 'inactive') {
//       statusTag = {
//         'title': "Inactive",
//         'color': Colors.red,
//       };
//     }
//     return DecoratedBox(
//       decoration: BoxDecoration(
//           color: statusTag['color'], borderRadius: BorderRadius.circular(5.0)),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
//         child: Text(
//           statusTag['title'],
//           style: context.textTheme.bodySmall!.copyWith(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
