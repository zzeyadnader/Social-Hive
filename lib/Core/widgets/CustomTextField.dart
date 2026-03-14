import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class Customtextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  const Customtextfield({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
  });

  @override
  State<Customtextfield> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<Customtextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: AppColors.muted,
        ),

        filled: true,
        fillColor: AppColors.TextFiledBackground,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.muted,
            width: 1,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.muted,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.muted,
            width: 1.5,
          ),
        ),
        hoverColor: AppColors.TextFiledBackground,
        focusColor: AppColors.TextFiledBackground,

        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.muted,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}