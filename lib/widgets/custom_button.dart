import 'package:flutter/material.dart';
import 'package:anamnesis_app/theme/app_text_styles.dart';
import 'package:anamnesis_app/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = color ?? AppColors.yellowButtonColor; // #EDC603
    final Color effectiveColor =
        isEnabled ? activeColor : AppColors.buttonColor; // #585853

    return SizedBox(
      width: double.infinity, // Ocupa todo el ancho
      height: 50.0,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // esquinas cuadradas
          ),
          backgroundColor: effectiveColor,
          disabledBackgroundColor: AppColors.buttonColor,
          elevation: 0,
        ),
        child: Text(
          text,
          style: AppTextStyles.buttonMainButtons.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
