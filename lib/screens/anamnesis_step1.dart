import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anamnesis_app/providers/anamnesis_provider.dart';
import 'package:anamnesis_app/screens/anamnesis_step2.dart';
import 'package:anamnesis_app/widgets/custom_text_field.dart';
import 'package:anamnesis_app/widgets/custom_button.dart';
import 'package:anamnesis_app/theme/app_text_styles.dart';
import 'package:anamnesis_app/theme/app_colors.dart';
import 'package:anamnesis_app/utils/constants.dart';

class AnamnesisStep1 extends StatefulWidget {
  const AnamnesisStep1({super.key});

  @override
  AnamnesisStep1State createState() => AnamnesisStep1State();
}

class AnamnesisStep1State extends State<AnamnesisStep1> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _operationsController;
  late TextEditingController _illnessController;

  @override
  void initState() {
    super.initState();
    // Tomamos el estado actual del Provider para rellenar los controladores
    final provider = context.read<AnamnesisProvider>();
    _operationsController = TextEditingController(text: provider.operations);
    _illnessController = TextEditingController(text: provider.illness);
  }

  @override
  void dispose() {
    _operationsController.dispose();
    _illnessController.dispose();
    super.dispose();
  }

  bool _isButtonEnabled(AnamnesisProvider provider) {
    // Validamos a partir del provider (puede ser provider.isStep1Valid)
    return provider.isStep1Valid;
  }

  void _goToStep2() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AnamnesisStep2()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Escuchamos los cambios del provider para refrescar la UI (usamos watch).
    final anamnesisProvider = context.watch<AnamnesisProvider>();
    final buttonEnabled = _isButtonEnabled(anamnesisProvider);

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
          onPressed: buttonEnabled ? _goToStep2 : null,
          isEnabled: buttonEnabled,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                _buildFormTitle(),
                _buildMandatoryLabel(),
                const SizedBox(height: 24),
                _buildOperationsField(anamnesisProvider),
                const SizedBox(height: 24),
                _buildIllnessField(anamnesisProvider),
              ],
            ),
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

  Widget _buildOperationsField(AnamnesisProvider provider) {
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
                text: '¿Ha tenido operaciones? ¿Cuáles y hace cuánto tiempo?',
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
        CustomTextField(
          controller: _operationsController,
          hintText: 'Escribe aquí',
          onChanged: (value) {
            provider.operations = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildIllnessField(AnamnesisProvider provider) {
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
                    '¿Tiene o tuvo alguna enfermedad diagnosticada o tratada por un médico?',
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
        CustomTextField(
          controller: _illnessController,
          hintText: 'Escribe aquí',
          onChanged: (value) {
            provider.illness = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        ),
      ],
    );
  }
}
