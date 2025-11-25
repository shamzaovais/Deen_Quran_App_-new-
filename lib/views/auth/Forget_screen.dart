import 'package:flutter/material.dart';
import 'package:deen_quran/routes/names.dart';
import '../auth/Widgets/Textfield_Widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    TextEditingController emailController = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                      ),
                      const Icon(
                        Icons.lock_reset_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Title
                  Text(
                    "Forgot Password 🔑",
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Enter your registered email below to receive password reset instructions.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: subtitleFont,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Email TextField
                  CustomTextField(
                    labelText: 'Email Address',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Reset Button
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
                        Navigator.pushNamed(
                          context,
                          RoutesName.otp,
                          arguments: {'fromCreateAccount': false},
                        );
                      },
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: buttonFont,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Back to Login
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.login);
                      },
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                          color: const Color(0xFF00CFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: subtitleFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
