// lib/services/tips_generator.dart
import 'package:hi_kod/models/survey_data.dart';

class TipsGenerator {
  static List<String> getTips(SurveyData data) {
    List<String> tips = [];

    if (data.dailyCarKm > 10) {
      tips.add('Günlük araba kullanımını azaltarak yılda ${(data.dailyCarKm * 0.2 * 365).round()} kg CO₂ tasarrufu sağlayabilirsin.');
    }

    if (data.meatConsumptionDays > 3) {
      tips.add('Haftada 1 gün etsiz beslenerek yılda ${(data.meatConsumptionDays * 0.3 * 52).round()} kg CO₂ tasarrufu yapabilirsin.');
    }

    if (data.energySource == 'Elektrik' || data.energySource == 'Doğal Gaz') {
      tips.add('Yenilenebilir enerji kaynaklarına geçiş yaparak karbon ayak izini önemli ölçüde azaltabilirsin.');
    }

    if (data.flightsPerYear > 0) {
      tips.add('Uçak seyahatlerini azaltarak karbon ayak izini küçültebilirsin.');
    }

    if (data.publicTransportDays < 3) {
      tips.add('Toplu taşıma kullanımını artırarak çevreye katkı sağlayabilirsin.');
    }

    return tips;
  }
}