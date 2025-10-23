import 'package:flutter/material.dart';
import 'package:deen_quran/routes/names.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> login(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email & password")),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // fake API delay

    isLoading = false;
    notifyListeners();

    Navigator.pushReplacementNamed(context, RoutesName.home);
  }

  void goToForgetPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesName.forgetPassword);
  }

  void goToCreateAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesName.createAccount);
  }
}
