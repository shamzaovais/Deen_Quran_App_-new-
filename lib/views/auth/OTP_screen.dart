import 'package:deen_quran/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/Flash_bar.dart';

class OTPScreen extends StatelessWidget {
  final bool isFromSignup; // true if user came from signup
  const OTPScreen({super.key, required this.isFromSignup});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.08),
              Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                isFromSignup
                    ? 'Please verify your account'
                    : 'Please verify your email to reset password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: AppColors.iconColor,
                ),
              ),
              SizedBox(height: size.height * 0.06),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: size.width * 0.15,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: size.height * 0.05),

              SizedBox(
                width: double.infinity,
                height: size.height * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.iconColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (isFromSignup) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      Navigator.pushReplacementNamed(context, '/resetPassword');
                    }
                  },

                child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              TextButton(
                onPressed: () {
                  {
                    buildFlashbar(
                      context,
                      "OTP has been resent successfully!",
                      backgroundColor: Colors.green,
                      icon: Icons.check_circle,
                    );

                    Future.delayed( Duration(seconds: 7), ()
                    {});
                  };
                },
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: AppColors.iconColor,
                    fontSize: size.width * 0.045,
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
