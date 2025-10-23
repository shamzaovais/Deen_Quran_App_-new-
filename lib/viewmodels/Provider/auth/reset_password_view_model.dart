import 'package:deen_quran/routes/names.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isPasswordVisible = false;
  bool isConfirmVisible = false;

  String password = '';
  String confirmPassword = '';

  void setPassword(String value) {
    password = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmVisibility() {
    isConfirmVisible = !isConfirmVisible;
    notifyListeners();
  }

  Future<void> resetPassword(BuildContext context) async {
    if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill both fields')),
      );
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset successfully')),
    );

    Navigator.pushNamed(context, RoutesName.login);
  }
}
