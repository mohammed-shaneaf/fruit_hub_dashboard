import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/themes/app_colors_manger.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textInputType,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.controller,
    this.obscureText = false,
  });

  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onSaved: (value) {
        if (onSaved != null && value != null) {
          onSaved!(value.trim());
        }
      },
      validator: (value) {
        final trimmedValue = value?.trim();
        if (trimmedValue == null || trimmedValue.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff949D9E)),
        border: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: AppColorsManger.grayColor, width: 1),
    );
  }
}
