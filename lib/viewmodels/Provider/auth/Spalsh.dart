import 'package:deen_quran/routes/names.dart' show RoutesName;
import 'package:flutter/material.dart';



class SplashViewModel with ChangeNotifier {
  // This function contains the logic to run on the splash screen.
  void handleSplashLogic(BuildContext context) {
    // Wait for 3 seconds, then navigate to the home screen.
    Future.delayed(const Duration(seconds: 3)).then((_) {
      // Use pushNamedAndRemoveUntil to prevent the user from going back
      // to the splash screen.
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (route) => false);
    });
  }
}
