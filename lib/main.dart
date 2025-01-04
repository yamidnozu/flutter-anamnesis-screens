import 'package:flutter/material.dart';
import 'package:anamnesis_app/screens/anamnesis_step1.dart';
import 'package:anamnesis_app/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anamnesis App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.darkBackground,
      ),
      home: const AnamnesisStep1(),
    );
  }
}
