import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deen_quran/core/services/google_auth_service.dart';
import 'package:deen_quran/routes/names.dart';

class LoginViewModel extends ChangeNotifier {
  // Controllers for email/password login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Loading state
  bool isLoading = false;

  // Google Auth Service
  final GoogleAuthService _googleAuthService = GoogleAuthService();

  // User object
  User? _user;
  User? get user => _user;

  // --------------------------
  // Email/Password login
  // --------------------------
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

  // --------------------------
  // Google Sign-In
  // --------------------------
  Future<void> signInWithGoogle(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      User? googleUser = await _googleAuthService.signInWithGoogle();

      if (googleUser != null) {
        _user = googleUser;
        notifyListeners();
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In failed: $e")),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _googleAuthService.signOut();
    _user = null;
    notifyListeners();
  }

  // --------------------------
  // Navigation helpers
  // --------------------------
  void goToForgetPassword(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesName.forgetPassword);
  }

  void goToCreateAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesName.createAccount);
  }
}
