
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';
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
  ThemeMode _themeMode = ThemeMode.dark;

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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF004D40),
        scaffoldBackgroundColor: Colors.grey[850],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF004D40),
          ),
        ),
      ),
      themeMode: _themeMode,
      home: SurveyPage(onToggleTheme: _toggleTheme),
    );
  }
}

class SurveyPage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const SurveyPage({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<Question> _surveyData = [];

  @override
  void initState() {
    super.initState();
    _loadSurveyData();
  }

  Future<void> _loadSurveyData() async {
    final String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/assessment_survey.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      _surveyData = jsonData.map((question) => Question.fromJson(question)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: _surveyData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Survey(
              initialData: _surveyData,
              onNext: (results) {
                if (results.length == _surveyData.length) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(surveyResult: results),
                    ),
                  );
                }
              },
            ),
    );
  }
}
