// lib/app.dart
import 'package:flutter/material.dart';
import 'package:hi_kod/config/theme.dart';
import 'package:hi_kod/screens/survey_screen.dart';

class CarbonFootprintApp extends StatelessWidget {
  const CarbonFootprintApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Karbon Ayak İzi Hesaplayıcı',
      theme: AppTheme.lightTheme,
      home: const SurveyScreen(),
    );
  }
}