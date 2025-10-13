import 'package:flutter/material.dart';
import 'package:deen_quran/core/constants/app_colors.dart';
import 'package:deen_quran/views/auth/otp_screen.dart';
import '../../widgets/Flash_bar.dart';
import 'Widgets/Textfield_Widget.dart';
import '../../../widgets/flashbar_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxHeight: size.height * 0.18),
                child: Image.asset('assets/masjid.jpg', fit: BoxFit.contain),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.iconColor,
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Text(
                'Enter your email to receive a verification code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              customTextField(
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
              ),
              SizedBox(height: size.height * 0.04),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iconColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    buildFlashbar(
                      context,
                      'OTP sent successfully to your email!',
                      backgroundColor: AppColors.iconColor,
                      icon: Icons.mark_email_read_outlined,
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPScreen(isFromSignup: false)),
                      );
                    });
                  },
                  child: Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              TextButton(
                onPressed: () {
                  buildFlashbar(
                    context,
                    'OTP resent successfully!',
                    backgroundColor: AppColors.iconColor,
                    icon: Icons.refresh_outlined,
                  );
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: AppColors.iconColor,
                    fontSize: size.width * 0.045,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
