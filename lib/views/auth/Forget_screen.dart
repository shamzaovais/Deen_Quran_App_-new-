import 'package:deen_quran/views/auth/OTP_screen.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'Widgets/Textfield_Widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxHeight: 100),
                child: Image.asset(
                  'assets/masjid.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: isSmallScreen ? 30 : 50),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: isSmallScreen ? 22 : 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: isSmallScreen ? 8 : 12),
              Text(
                'Enter your email to reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: isSmallScreen ? 14 : 16,
                ),
              ),
              SizedBox(height: isSmallScreen ? 25 : 35),
              customTextField(
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
              ),
              SizedBox(height: isSmallScreen ? 25 : 40),
              SizedBox(
                width: double.infinity,
                height: isSmallScreen ? 45 : 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iconColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPScreen(isFromSignup: false)));
                  },
                  child: Text(
                    'Send code',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 15 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isSmallScreen ? 25 : 35),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back to Sign In',
                  style: TextStyle(
                    color: AppColors.iconColor,
                    fontSize: isSmallScreen ? 15 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
