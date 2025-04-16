// lib/widgets/tip_card.dart
import 'package:flutter/material.dart';

class TipCard extends StatelessWidget {
  final String tipText;

  const TipCard({
    Key? key,
    required this.tipText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(Icons.eco, color: Colors.green),
            const SizedBox(width: 10),
            Expanded(
              child: Text(tipText),
            ),
          ],
        ),
      ),
    );
  }
}