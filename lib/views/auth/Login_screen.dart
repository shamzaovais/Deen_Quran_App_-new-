import 'package:deen_quran/views/auth/Create_account_screen.dart';
import 'package:deen_quran/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'Forget_screen.dart';
import 'Widgets/Textfield_Widget.dart';
import 'Widgets/social_Widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextEditingController emailController= TextEditingController();
    TextEditingController passwordController= TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 100,
                ),
                child: Image.asset(
                  'assets/masjid.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
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
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
                  },
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: AppColors.iconColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.iconColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                    ),

                  ),
                ),
              ),
               SizedBox(height: 7),

              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen()));
                    },
                    child: const Text(
                      'Create new account',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 56.95,
              ),
              Text(
                'Or continue with',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(
                    icon: Icons.g_mobiledata,
                    color: AppColors.iconColor,
                    onTap: () => print('Google clicked'),
                  ),
                  SizedBox(width: 16),
                  socialButton(
                    icon: Icons.facebook,
                    color: AppColors.iconColor,
                    onTap: () => print('Facebook clicked'),
                  ),
                  SizedBox(width: 16),
                  socialButton(
                    icon: Icons.apple,
                    color: AppColors.iconColor,
                    onTap: () => print('Apple clicked'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
