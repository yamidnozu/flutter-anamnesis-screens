import 'package:flutter/material.dart';
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
  final TextEditingController _operationsController = TextEditingController();
  final TextEditingController _illnessController = TextEditingController();

  @override
  void dispose() {
    _operationsController.dispose();
    _illnessController.dispose();
    super.dispose();
  }

  /// Verifica si los campos obligatorios están llenos
  bool _isButtonEnabled() {
    return _operationsController.text.isNotEmpty &&
        _illnessController.text.isNotEmpty;
  }

  /// Navega a la segunda pantalla si los campos son válidos
  void _goToStep2() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AnamnesisStep2(
            operations: _operationsController.text,
            illness: _illnessController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Permite que el cuerpo se redimensione al mostrar el teclado
      resizeToAvoidBottomInset: true,
      
      /// Botón fijado en la parte inferior
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: Constants.defaultPadding,
          right: Constants.defaultPadding,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CustomButton(
          text: 'Siguiente',
          onPressed: _isButtonEnabled() ? _goToStep2 : null,
          isEnabled: _isButtonEnabled(),
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
                const SizedBox(height: 0),
                _buildMandatoryLabel(),
                const SizedBox(height: 0),
                _buildOperationsField(),
                const SizedBox(height: 0),
                _buildIllnessField(),
                // El espacio adicional va antes del botón,
                // pero como el botón está en bottomNavigationBar,
                // ya no necesitamos al final un gran SizedBox
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Header con flecha de retroceso y texto de bienvenida
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        if (Navigator.of(context).canPop())
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,  // Flecha sin palito
              color: Colors.white,
            ),
          ),
        Expanded(
          child: Text(
            'Bienvenido a tu nuevo comienzo',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLight14.copyWith(
              color: const Color(0xFFC0C5E0), // #C0C5E0
            ),
          ),
        ),
      ],
    );
  }

  /// Título de la sección
  Widget _buildFormTitle() {
    return Text(
      'Completa la siguiente información',
      style: AppTextStyles.bodyMedium16.copyWith(
        color: AppColors.whiteColor,
      ),
    );
  }

  /// Texto "Todos los campos son obligatorios*"
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

  /// Campo de operaciones
  Widget _buildOperationsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
           maxLines: 5,
           textWidthBasis: TextWidthBasis.longestLine,
          text: TextSpan(
            style: AppTextStyles.bodyDefault16.copyWith(
              color: AppColors.whiteColor,
            ),
            children: const [
              TextSpan(
                text:
                    '¿Ha tenido operaciones? ¿Cuáles y hace cuánto tiempo?',
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
          onChanged: (_) => setState(() {}),
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

  /// Campo de enfermedades
  Widget _buildIllnessField() {
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
          onChanged: (_) => setState(() {}),
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
