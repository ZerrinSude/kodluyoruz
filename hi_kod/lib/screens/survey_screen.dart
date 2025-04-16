// lib/screens/survey_screen.dart
import 'package:flutter/material.dart';
import 'package:hi_kod/constants/strings.dart';
import 'package:hi_kod/models/survey_data.dart';
import 'package:hi_kod/widgets/question_page.dart';
import 'package:hi_kod/screens/result_screen.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  // Anket verileri
  final SurveyData _surveyData = SurveyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EKODAL',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.lightGreenAccent.shade200,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          // 1. Soru: Araba kullanımı
          QuestionPage(
            question: AppStrings.carQuestion,
            inputWidget: Slider(
              value: _surveyData.dailyCarKm,
              min: 0,
              max: 100,
              divisions: 20,
              label: '${_surveyData.dailyCarKm.round()} km',
              onChanged: (value) {
                setState(() {
                  _surveyData.dailyCarKm = value;
                });
              },
            ),
            valueDisplay: '${_surveyData.dailyCarKm.round()} km',
          ),

          // 2. Soru: Et tüketimi
          QuestionPage(
            question: AppStrings.meatQuestion,
            inputWidget: Slider(
              value: _surveyData.meatConsumptionDays.toDouble(),
              min: 0,
              max: 7,
              divisions: 7,
              label: '${_surveyData.meatConsumptionDays} gün',
              onChanged: (value) {
                setState(() {
                  _surveyData.meatConsumptionDays = value.round();
                });
              },
            ),
            valueDisplay: '${_surveyData.meatConsumptionDays} gün',
          ),

          // 3. Soru: Enerji kaynağı
          QuestionPage(
            question: AppStrings.energyQuestion,
            inputWidget: DropdownButton<String>(
              value: _surveyData.energySource,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _surveyData.energySource = newValue;
                  });
                }
              },
              items: AppStrings.energySources.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            valueDisplay: _surveyData.energySource,
          ),

          // 4. Soru: Uçak yolculuğu
          QuestionPage(
            question: AppStrings.flightQuestion,
            inputWidget: Slider(
              value: _surveyData.flightsPerYear.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: '${_surveyData.flightsPerYear}',
              onChanged: (value) {
                setState(() {
                  _surveyData.flightsPerYear = value.round();
                });
              },
            ),
            valueDisplay: '${_surveyData.flightsPerYear} uçuş',
          ),

          // 5. Soru: Toplu taşıma kullanımı
          QuestionPage(
            question: AppStrings.transportQuestion,
            inputWidget: Slider(
              value: _surveyData.publicTransportDays.toDouble(),
              min: 0,
              max: 7,
              divisions: 7,
              label: '${_surveyData.publicTransportDays} gün',
              onChanged: (value) {
                setState(() {
                  _surveyData.publicTransportDays = value.round();
                });
              },
            ),
            valueDisplay: '${_surveyData.publicTransportDays} gün',
          ),

          // Sonuç Ekranı
          ResultScreen(surveyData: _surveyData),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Geri Butonu: İlk sayfadaysa devre dışı olsun
              ElevatedButton(
                onPressed: _currentPageIndex > 0
                    ? () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
                    : null, // ilk sayfadaysa tıklanamaz
                child: const Text(AppStrings.backButton),
              ),

              // Sayfa durumuna göre buton: "İleri" veya "Yeniden Başla"
              _currentPageIndex < 5
                  ? ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text(AppStrings.nextButton),
              )
                  : ElevatedButton(
                onPressed: () {
                  setState(() {
                    _surveyData.reset();
                  });
                  _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text(AppStrings.restartButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}