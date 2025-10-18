import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'assessment.dart';
import 'results_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.cyan,
            ).copyWith(
              onPrimary: Colors.white,
            ),
            primaryColor: Colors.cyan,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.cyan,
              ),
              titleTextStyle: TextStyle(
                color: Colors.cyan,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.cyan,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.cyan,
              selectionColor: Colors.cyan,
              selectionHandleColor: Colors.cyan,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Colors.cyan,
                  ),
                ),
              ),
            ),
            textTheme: const TextTheme(
              displayMedium: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
              ),
              headlineSmall: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
              bodyMedium: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              titleMedium: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          child: SurveyKit(
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
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
