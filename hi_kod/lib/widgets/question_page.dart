// lib/widgets/question_page.dart
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final String question;
  final Widget inputWidget;
  final String valueDisplay;

  const QuestionPage({
    Key? key,
    required this.question,
    required this.inputWidget,
    required this.valueDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          inputWidget,
          const SizedBox(height: 20),
          Text(
            'Seçilen değer: $valueDisplay',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
