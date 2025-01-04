import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anamnesis_app/providers/anamnesis_provider.dart';
import 'package:anamnesis_app/theme/app_colors.dart';
import 'package:anamnesis_app/theme/app_text_styles.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos los datos directamente del Provider
    final anamnesisProvider = context.watch<AnamnesisProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: AppColors.darkBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '¡Información enviada correctamente!',
                        style: AppTextStyles.bodyMedium16.copyWith(
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Resumen de tus respuestas:',
                        style: AppTextStyles.bodyDefault16.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDataRow('Operaciones:', anamnesisProvider.operations),
                      _buildDataRow('Enfermedades:', anamnesisProvider.illness),
                      _buildDataRow(
                        'Dolores frecuentes:',
                        anamnesisProvider.hasFrequentPain ? 'Sí' : 'No',
                      ),
                      _buildDataRow(
                        'Problema en huesos/articulaciones:',
                        anamnesisProvider.hasBoneOrJointProblem ? 'Sí' : 'No',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Text(
            'Confirmación',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLight14.copyWith(
              color: const Color(0xFFC0C5E0),
            ),
          ),
        ),
        const SizedBox(width: 48), // Espacio para centrar el texto
      ],
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ',
            style: AppTextStyles.bodyDefault16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyDefault16.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
