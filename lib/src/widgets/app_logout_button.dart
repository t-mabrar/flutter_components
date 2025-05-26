// import 'package:car_glow_admin/core/app_shared_preferences.dart';
// import 'package:car_glow_admin/core/extensions.dart';
// import 'package:car_glow_admin/core/widgets/app_button.dart';
// import 'package:car_glow_admin/screens/mobile/auth_screens/mobile_login_screen.dart';
// import 'package:car_glow_admin/screens/web/auth_screens/login_screen.dart';
// import 'package:flutter/material.dart';

// class AppLogoutIconButton extends StatelessWidget {
//   const AppLogoutIconButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppButton.icon(
//       icon: Icon(Icons.logout),
//       onPressed: () async {
//         await logout(context);
//       },
//     );
//   }
// }

// class AppLogoutButton extends StatelessWidget {
//   const AppLogoutButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppButton(
//       title: "Logout",
//       suffix: Icon(Icons.logout),
//       onPressed: () async {
//         await logout(context);
//       },
//     );
//   }
// }

// Future<void> logout(BuildContext context) async {
//   await AppSharedPreferences.setBoolValue(
//       key: AppSharedPreferences.kLoggedIn, value: false);
//   Navigator.of(context).pushAndRemoveUntil(
//     MaterialPageRoute(
//         builder: (_) => isMobile ? MobileLoginScreen() : LoginScreen()),
//     (Route<dynamic> route) => false,
//   );
// }
