import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anamnesis_app/providers/anamnesis_provider.dart';
import 'package:anamnesis_app/screens/confirmation_screen.dart';
import 'package:anamnesis_app/widgets/custom_toggle_button.dart';
import 'package:anamnesis_app/widgets/custom_button.dart';
import 'package:anamnesis_app/theme/app_text_styles.dart';
import 'package:anamnesis_app/theme/app_colors.dart';
import 'package:anamnesis_app/utils/constants.dart';

class AnamnesisStep2 extends StatefulWidget {
  const AnamnesisStep2({super.key});

  @override
  AnamnesisStep2State createState() => AnamnesisStep2State();
}

class AnamnesisStep2State extends State<AnamnesisStep2> {
  bool _isButtonEnabled() {
    // Podríamos validar que el usuario seleccione algo en cada pregunta,
    // pero en este ejemplo se deja habilitado siempre.
    return true;
  }

  void _goToConfirmationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ConfirmationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool buttonEnabled = _isButtonEnabled();
    final anamnesisProvider = context.watch<AnamnesisProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: Constants.defaultPadding,
          right: Constants.defaultPadding,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CustomButton(
          text: 'Siguiente',
          onPressed: buttonEnabled ? _goToConfirmationScreen : null,
          isEnabled: buttonEnabled,
          color: AppColors.yellowButtonColor,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              const SizedBox(height: 32),
              _buildFormTitle(),
              const SizedBox(height: 8),
              _buildMandatoryLabel(),
              const SizedBox(height: 24),
              _buildFrequentPainQuestion(anamnesisProvider),
              const SizedBox(height: 24),
              _buildBonesJointsQuestion(anamnesisProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        if (Navigator.of(context).canPop())
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        Expanded(
          child: Text(
            'Bienvenido a tu nuevo comienzo',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLight14.copyWith(
              color: const Color(0xFFC0C5E0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormTitle() {
    return Text(
      'Completa la siguiente información',
      style: AppTextStyles.bodyMedium16.copyWith(
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _buildMandatoryLabel() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Todos los campos son obligatorios',
            style: AppTextStyles.bodyDefault16.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          const TextSpan(
            text: '*',
            style: TextStyle(
              fontFamily: 'Futura Bk BT',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: AppColors.asteriscColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrequentPainQuestion(AnamnesisProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyles.bodyDefault16.copyWith(
              color: AppColors.whiteColor,
            ),
            children: const [
              TextSpan(
                text: '¿Tiene dolores frecuentes y no ha consultado al médico?',
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontFamily: 'Futura Bk BT',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: AppColors.asteriscColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomToggleButton(
                text: 'Sí',
                isSelected: provider.hasFrequentPain,
                onPressed: () {
                  provider.hasFrequentPain = true;
                },
              ),
            ),
            Expanded(
              child: CustomToggleButton(
                text: 'No',
                isSelected: !provider.hasFrequentPain,
                onPressed: () {
                  provider.hasFrequentPain = false;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBonesJointsQuestion(AnamnesisProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyles.bodyDefault16.copyWith(
              color: AppColors.whiteColor,
            ),
            children: const [
              TextSpan(
                text:
                    '¿Le ha dicho el médico que tiene algún problema en los huesos o en las articulaciones...?',
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontFamily: 'Futura Bk BT',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: AppColors.asteriscColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomToggleButton(
                text: 'Sí',
                isSelected: provider.hasBoneOrJointProblem,
                onPressed: () {
                  provider.hasBoneOrJointProblem = true;
                },
              ),
            ),
            Expanded(
              child: CustomToggleButton(
                text: 'No',
                isSelected: !provider.hasBoneOrJointProblem,
                onPressed: () {
                  provider.hasBoneOrJointProblem = false;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
