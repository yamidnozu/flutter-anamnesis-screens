import 'package:flutter/material.dart';

class ScreenSize {
  final double _screenWidth;
  final double _screenHeight;

  ScreenSize(this._screenWidth, this._screenHeight);

  factory ScreenSize.of(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScreenSize(mediaQuery.size.width, mediaQuery.size.height);
  }

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;

  double getProportionalWidth(double width) {
    // Diseño base 375px
    return _screenWidth * width / 375.0;
  }

  double getProportionalHeight(double height) {
    // Diseño base 667px
    return _screenHeight * height / 667.0;
  }
}
