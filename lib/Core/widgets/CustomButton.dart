import 'package:flutter/material.dart';
import 'package:social_hive/Core/theme/app_spacing.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color BgColor;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.BgColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacing.width(context, 0.9),
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: BgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}