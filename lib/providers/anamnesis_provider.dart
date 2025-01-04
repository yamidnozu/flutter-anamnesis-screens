import 'package:flutter/material.dart';

/// Maneja todos los campos de Anamnesis en un ChangeNotifier,
/// de manera que cualquier widget que escuche a este provider
/// se actualizará automáticamente cuando cambie algún valor.
class AnamnesisProvider extends ChangeNotifier {
  String _operations = '';
  String _illness = '';
  bool _hasFrequentPain = false;
  bool _hasBoneOrJointProblem = false;

  // Getters
  String get operations => _operations;
  String get illness => _illness;
  bool get hasFrequentPain => _hasFrequentPain;
  bool get hasBoneOrJointProblem => _hasBoneOrJointProblem;

  // Setters con notificación a los listeners
  set operations(String value) {
    _operations = value;
    notifyListeners();
  }

  set illness(String value) {
    _illness = value;
    notifyListeners();
  }

  set hasFrequentPain(bool value) {
    _hasFrequentPain = value;
    notifyListeners();
  }

  set hasBoneOrJointProblem(bool value) {
    _hasBoneOrJointProblem = value;
    notifyListeners();
  }

  /// Valida si ambos campos de la primera pantalla están completos
  bool get isStep1Valid => _operations.isNotEmpty && _illness.isNotEmpty;
}
