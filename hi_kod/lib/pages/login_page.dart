import 'package:flutter/material.dart';
import 'package:hi_kod/screens/survey_screen.dart';
import 'sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email == 'test@gmail.com' && password == 'test123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SurveyScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Giriş başarısız!")),
      );
    }
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('EKODAL',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightGreenAccent.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Şifre"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text("Giriş Yap")),
            TextButton(onPressed: _navigateToSignUp, child: const Text("Hesap Oluştur")),
          ],
        ),
      ),
    );
  }
}
