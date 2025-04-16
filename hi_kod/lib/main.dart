import 'package:flutter/material.dart';
import 'package:hi_kod/pages/splash_page.dart'; // kendi yoluna göre güncelle
import 'config/theme.dart'; // Tema sınıfını import ediyoruz

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekodal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Burada temayı uyguluyoruz
      home: const SplashPage(),
    );
  }
}
