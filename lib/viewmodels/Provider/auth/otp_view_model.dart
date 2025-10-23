import 'package:flutter/material.dart';

class OTPViewModel extends ChangeNotifier {
  String otp = "";
  bool isLoading = false;

  void setOTPChar(int index, String value) {
    if (otp.length < 4) {
      if (index < otp.length) {
        otp = otp.substring(0, index) + value + otp.substring(index + 1);
      } else {
        otp += value;
      }
    }
    notifyListeners();
  }

  Future<void> verifyOTP({
    required BuildContext context,
    required bool fromCreateAccount,
    required VoidCallback onSuccess,
  }) async {
    if (otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all 4 digits")),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    // Simulated backend verification
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    onSuccess();
  }

  Future<void> resendOTP() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2)); // simulate resend
    isLoading = false;
    notifyListeners();
  }
}
