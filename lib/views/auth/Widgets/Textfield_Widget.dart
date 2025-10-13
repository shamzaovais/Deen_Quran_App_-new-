import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

Widget customTextField({
  required String labelText,
  bool obscureText = false,
  TextEditingController? controller,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  Widget? prefixIcon,
  Widget? suffixIcon,
  void Function(String)? onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.iconColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    ),
  );
}
