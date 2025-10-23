import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.controller,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // responsive padding using MediaQuery
    final width = MediaQuery.of(context).size.width;

    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscure : false,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.1), // background color
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () => setState(() => _isObscure = !_isObscure),
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.white70,
          ),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white30, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.iconColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
