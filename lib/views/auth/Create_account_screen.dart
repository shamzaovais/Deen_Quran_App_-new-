import 'package:flutter/material.dart';
import 'package:deen_quran/views/home/home_screen.dart';
import '../../core/constants/app_colors.dart';
import 'OTP_screen.dart';
import 'Widgets/Textfield_Widget.dart';
import 'Widgets/social_Widgets.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();















    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(



          padding:  EdgeInsets.symmetric(horizontal: 24),
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
              const SizedBox(height: 40),

              customTextField(
                labelText: 'Full Name',
                controller: nameController,
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Icons.person_outline, color: AppColors.iconColor),
              ),
              const SizedBox(height: 16),

              customTextField(
                labelText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.email_outlined, color: AppColors.iconColor),
              ),
              const SizedBox(height: 16),

              customTextField(
                labelText: 'Password',
                controller: passwordController,
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline, color: AppColors.iconColor),
              ),
              const SizedBox(height: 16),

              customTextField(
                labelText: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: true,
                prefixIcon: Icon(Icons.lock_reset, color: AppColors.iconColor),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iconColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPScreen(isFromSignup: true),
                      ),
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // goes back to LoginScreen
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.iconColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),


            ],
          ),
        ),
      ),
    );
  }
}
