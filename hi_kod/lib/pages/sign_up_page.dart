import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signUp() {
    final email = emailController.text;
    final password = passwordController.text;

    // Burada gerçek bir kayıt işlemi yapılabilir
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Hesap başarıyla oluşturuldu!")),
    );

    // Kayıt olduktan sonra login sayfasına yönlendirme
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EKODAL",style: TextStyle(fontWeight: FontWeight.bold),),
      backgroundColor: Colors.lightGreenAccent.shade200,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Şifre"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _signUp, child: const Text("Hesap Oluştur")),
          ],
        ),
      ),
    );
  }
}
