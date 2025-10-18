import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'assessment.dart';
import 'results_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: SurveyPage(onToggleTheme: _toggleTheme),
    );
  }
}

class SurveyPage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const SurveyPage({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: SurveyKit(
        onResult: (SurveyResult result) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(surveyResult: result),
            ),
          );
        },
        task: assessmentSurvey,
        localizations: const {
          'cancel': 'Cancel',
          'next': 'Next',
        },
        surveyProgressbarConfiguration: SurveyProgressConfiguration(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
