
import 'package:flutter/material.dart';
import 'package:hi_kod/constants/strings.dart';
import 'package:hi_kod/models/survey_data.dart';
import 'package:hi_kod/services/carbon_calculator.dart';
import 'package:hi_kod/services/tips_generator.dart';
import 'package:hi_kod/widgets/result_card.dart';
import 'package:hi_kod/widgets/tip_card.dart';

class ResultScreen extends StatelessWidget {
  final SurveyData surveyData;

  const ResultScreen({Key? key, required this.surveyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carbonFootprint = CarbonCalculator.calculateCarbonFootprint(surveyData);
    int requiredTrees = CarbonCalculator.calculateRequiredTrees(surveyData);
    List<String> tips = TipsGenerator.getTips(surveyData);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppStrings.resultsTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ResultCard(
            title: AppStrings.carbonFootprintLabel,
            value: '${carbonFootprint.round()} kg CO₂/yıl',
            backgroundColor: Colors.green.shade100,
          ),
          const SizedBox(height: 20),
          ResultCard(
            title: AppStrings.treesRequiredLabel,
            value: '$requiredTrees ağaç',
            backgroundColor: Colors.green.shade50,
          ),
          const SizedBox(height: 30),
          const Text(
            AppStrings.tipsTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tips.length,
            itemBuilder: (context, index) {
              return TipCard(tipText: tips[index]);
            },
          ),
        ],
      ),
    );
  }
}
