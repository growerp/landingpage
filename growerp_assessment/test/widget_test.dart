
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:growerp_assessment/main.dart';

void main() {
  testWidgets('Renders SurveyPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that SurveyPage is rendered.
    expect(find.byType(SurveyPage), findsOneWidget);
  });
}
