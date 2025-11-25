import 'package:deen_quran/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:deen_quran/views/auth/Login_screen.dart';
import 'package:deen_quran/views/common/social.dart';
import 'Widgets/Textfield_Widget.dart';
import 'Login_screen.dart' show LoginScreen;

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
            colors: [
              Color(0xFF0A1931), // deep navy blue
              Color(0xFF185ADB), // blue accent
            ],
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
                  // 🔹 Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new,
                            color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Icon(Icons.person_add_alt, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // 🔹 Title
                  Text(
                    "Create Account ✨",
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Fill in your details to get started",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: subtitleFont,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // 🔹 Name
                  CustomTextField(
                    labelText: "Full Name",
                    controller: nameController,
                    prefixIcon:
                    Icon(Icons.person_outline, color: Colors.white70),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // 🔹 Email
                  CustomTextField(
                    labelText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon:
                    Icon(Icons.email_outlined, color: Colors.white70),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // 🔹 Password
                  CustomTextField(
                    labelText: "Password",
                    controller: passwordController,
                    prefixIcon:
                    Icon(Icons.lock_outline, color: Colors.white70),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // 🔹 Confirm Password
                  CustomTextField(
                    labelText: "Confirm Password",
                    controller: confirmPasswordController,
                    prefixIcon:
                    Icon(Icons.lock_person, color: Colors.white70),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // 🔹 Create Account Button
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
                          //arguments: {'fromCreateAccount': true},
                        );
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: buttonFont,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // 🔹 Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                            color: Colors.white.withOpacity(0.3), thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or sign up with",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: subtitleFont,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                            color: Colors.white.withOpacity(0.3), thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // 🔹 Social Buttons
                  Column(
                    children: [
                      SocialButton(
                        text: "Sign up with Google",
                        icon: Icons.g_mobiledata,
                        color: Colors.white,
                        textColor: Colors.black87,
                        borderColor: Colors.grey.shade400,
                        onTap: () {},
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      SocialButton(
                        text: "Sign up with Apple",
                        icon: Icons.apple,
                        color: Colors.black,
                        textColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // 🔹 Already have account
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: subtitleFont,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RoutesName.login,

                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: const Color(0xFF00CFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: subtitleFont,
                            ),
                          ),
                        ),
                      ],
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
