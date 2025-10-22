// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:growerp_assessment/main.dart';
import 'package:survey_kit/survey_kit.dart';

void main() {
  testWidgets('MyApp builds and displays the survey', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the survey is displayed.
    expect(find.byType(SurveyKit), findsOneWidget);
  });
}
