// lib/models/survey_data.dart
class SurveyData {
  double dailyCarKm;
  int meatConsumptionDays;
  String energySource;
  int flightsPerYear;
  int publicTransportDays;

  SurveyData({
    this.dailyCarKm = 0,
    this.meatConsumptionDays = 0,
    this.energySource = 'Elektrik',
    this.flightsPerYear = 0,
    this.publicTransportDays = 0,
  });

  void reset() {
    dailyCarKm = 0;
    meatConsumptionDays = 0;
    energySource = 'Elektrik';
    flightsPerYear = 0;
    publicTransportDays = 0;
  }
}