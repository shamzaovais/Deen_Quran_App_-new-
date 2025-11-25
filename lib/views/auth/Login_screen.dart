import 'package:deen_quran/views/common/social.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/Provider/auth/LoginViewModel.dart';
import 'Widgets/Textfield_Widget.dart';
import '../../routes/names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    double titleFont = width * 0.075;
    double subtitleFont = width * 0.035;
    double buttonFont = width * 0.045;

    return Scaffold(
      resizeToAvoidBottomInset: false, // prevent lag when keyboard opens
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A1931),
          Color(0xFF185ADB),],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.03,
            ),
            child: Container(
              width: width < 500 ? width * 0.95 : 450,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.04,
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
              child: Consumer<LoginViewModel>(
                builder: (context, loginVM, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button + Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              size: 20, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Icon(Icons.lock_outline, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: height * 0.02),

                    Text(
                      "Welcome Back 👋",
                      style: TextStyle(
                        fontSize: titleFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "To Deen App",
                      style: TextStyle(
                        fontSize: titleFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "Please enter your email and password to continue",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: subtitleFont,
                      ),
                    ),
                    SizedBox(height: height * 0.04),

                    // Email Field
                    CustomTextField(
                      labelText: 'Email',
                      controller: loginVM.emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined,
                          color: Colors.white70),
                    ),
                    SizedBox(height: height * 0.02),

                    // Password Field
                    CustomTextField(
                      labelText: 'Password',
                      controller: loginVM.passwordController,
                      prefixIcon: const Icon(Icons.lock_outline,
                          color: Colors.white70),
                    ),
                    SizedBox(height: height * 0.015),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (_) {},
                              activeColor: const Color(0xFF185ADB),
                              checkColor: Colors.white,
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => loginVM.goToForgetPassword(context),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF185ADB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: loginVM.isLoading
                            ? null
                            : () => loginVM.login(context),
                        child: loginVM.isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : Text(
                          "Login with Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: buttonFont,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                                color: Colors.white.withOpacity(0.3),
                                thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Or login with",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: subtitleFont),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                                color: Colors.white.withOpacity(0.3),
                                thickness: 1)),
                      ],
                    ),
                    SizedBox(height: height * 0.03),

                    // Social Buttons
                    Column(
                      children: [
                        SocialButton(
                          text: "Login with Google",
                          icon: Icons.g_mobiledata,
                          color: Colors.white,
                          textColor: Colors.black87,
                          borderColor: Colors.grey.shade400,
                          onTap: () async {
                            final loginVM = context.read<LoginViewModel>();
                            
                            // Start Google Sigin 
                            await loginVM.signInWithGoogle(context);

                            //If successful, navigate to home
                            if (loginVM.user != null) {
                              Navigator.pushReplacementNamed(
                                  context, RoutesName.home);
                            }
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        SocialButton(
                          text: "Login with Apple",
                          icon: Icons.apple,
                          color: Colors.black,
                          textColor: Colors.white,
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: subtitleFont,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                loginVM.goToCreateAccount(context),
                            child: Text(
                              "Register",
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
      ),
    );
  }
}
