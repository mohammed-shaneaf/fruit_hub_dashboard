import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/styles/app_text_style.dart';
import 'package:fruit_hub_dashboard/core/themes/app_colors_manger.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: const Size(double.infinity, 54),
        backgroundColor: AppColorsManger.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyles.bold16.copyWith(color: Colors.white)),
    );
  }
}
