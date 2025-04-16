// lib/services/carbon_calculator.dart
import 'package:hi_kod/models/survey_data.dart';

class CarbonCalculator {
  // Toplam skoru hesapla
  static double calculateTotalScore(SurveyData data) {
    double transportScore = data.dailyCarKm * 0.2 - data.publicTransportDays * 0.1;
    double foodScore = data.meatConsumptionDays * 0.3;

    double energyScore = data.energySource == 'Güneş Enerjisi' ||
        data.energySource == 'Rüzgar Enerjisi'
        ? -1.0 : (data.energySource == 'Doğal Gaz' ? 1.5 : 2.0);

    double flightScore = data.flightsPerYear * 0.5;

    return transportScore + foodScore + energyScore + flightScore;
  }

  // Karbon ayak izini hesapla (kg CO2 olarak)
  static double calculateCarbonFootprint(SurveyData data) {
    return calculateTotalScore(data) * 500; // Basit bir çarpan
  }

  // Gerekli ağaç sayısını hesapla
  static int calculateRequiredTrees(SurveyData data) {
    return (calculateCarbonFootprint(data) / 20).round(); // Bir ağaç yılda ortalama 20kg CO2 emer
  }
}