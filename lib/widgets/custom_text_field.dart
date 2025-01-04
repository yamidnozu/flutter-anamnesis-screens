import 'package:flutter/material.dart';
import 'package:anamnesis_app/theme/app_colors.dart';
import 'package:anamnesis_app/theme/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 2,
      minLines: 2,
      controller: controller,
      style: AppTextStyles.bodyDefault16.copyWith(
        color: AppColors.whiteColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.buttonPlaceholderText.copyWith(
          color: AppColors.whiteColor.withAlpha((0.6 * 255).toInt()),
        ),
        fillColor: AppColors.darkBackground,
        filled: true,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
