import 'package:flutter/material.dart';
import 'package:anamnesis_app/theme/app_colors.dart';
import 'package:anamnesis_app/theme/app_text_styles.dart';

class CustomToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Borde de color diferente si está seleccionado
    final Color borderColor = isSelected
        ? const Color(0xFF038BED)  // ejemplo: azul al estar seleccionado
        : const Color(0xFFC0C5E0); // gris sutil si no está seleccionado

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent, 
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodyDefault16.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
