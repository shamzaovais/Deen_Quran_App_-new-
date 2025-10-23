import 'package:deen_quran/routes/names.dart';
import 'package:deen_quran/viewmodels/Provider/auth/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  final bool fromCreateAccount;

  const OTPScreen({super.key, required this.fromCreateAccount});

  @override
  Widget build(BuildContext context) {
    final otpVM = Provider.of<OTPViewModel>(context);
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Responsive sizes
    double otpBoxSize = screenWidth * 0.16;
    if (otpBoxSize > 70) otpBoxSize = 70;

    // Dynamic padding + font sizing
    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.03;
    double titleFont = screenWidth * 0.065;
    double subtitleFont = screenWidth * 0.035;
    double buttonFont = screenWidth * 0.045;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A1931), Color(0xFF185ADB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Container(
                width: screenWidth < 500 ? screenWidth * 0.95 : 450,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.04,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Back + Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Icon(Icons.lock_outline, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Title
                    Text(
                      fromCreateAccount
                          ? "Verify Your Email"
                          : "Reset Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      fromCreateAccount
                          ? "Enter the OTP sent to your email to verify your account."
                          : "Enter the OTP sent to your email to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: subtitleFont,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    // OTP Input Boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Container(
                          width: otpBoxSize,
                          height: otpBoxSize,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              otpVM.setOTPChar(index, value);
                              if (value.isNotEmpty && index < 3) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: screenHeight * 0.06),

                    // Verify Button
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF185ADB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          shadowColor: Colors.blueAccent.withOpacity(0.4),
                          elevation: 6,
                        ),
                        onPressed: () {
                          otpVM.verifyOTP(
                            context: context,
                            fromCreateAccount: fromCreateAccount,
                            onSuccess: () {
                              // ✅ Navigate based on where user came from
                              if (fromCreateAccount) {
                                // User came from Create Account → go to Home
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RoutesName.home, // or RoutesName.welcome
                                      (route) => false,
                                );
                              } else {
                                // User came from Forgot Password → go to Reset Password
                                Navigator.pushReplacementNamed(
                                  context,
                                  RoutesName.resetPassword,
                                );
                              }
                            },
                          );
                        },
                        child: otpVM.isLoading
                            ? const CircularProgressIndicator(
                            color: Colors.white)
                            : Text(
                          "Verify OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: buttonFont,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Resend OTP
                    GestureDetector(
                      onTap: otpVM.isLoading ? null : otpVM.resendOTP,
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: subtitleFont,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
