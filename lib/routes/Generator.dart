import 'package:flutter/material.dart';
import '../views/auth/Login_screen.dart';
import '../views/auth/Splash_screen.dart';
import '../views/auth/Create_account_screen.dart';
import '../views/auth/Forget_screen.dart';
import '../views/auth/OTP_screen.dart';
import '../views/auth/reset_password.dart';
import '../views/home/MainScreen.dart';
import 'names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RoutesName.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case RoutesName.createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());

      case RoutesName.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case RoutesName.otp:
        final args = settings.arguments as Map<String, dynamic>?;
        final fromCreateAccount = args?['fromCreateAccount'] ?? true;
        return MaterialPageRoute(
          builder: (_) => OTPScreen(fromCreateAccount: fromCreateAccount),
        );

      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      //case RoutesName.reminder:
       // return MaterialPageRoute(builder: (_) => const ReminderScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'No route defined',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
    }
  }
}
