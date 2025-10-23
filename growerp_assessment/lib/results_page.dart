
import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';

class ResultsPage extends StatelessWidget {
  final List<QuestionResult> surveyResult;

  const ResultsPage({Key? key, required this.surveyResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Results'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildScore(),
              const SizedBox(height: 24),
              _buildInsights(),
              const SizedBox(height: 24),
              _buildNextSteps(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScore() {
    final score = _calculateScore();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'ERP Readiness Score',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: score / 100,
              minHeight: 20,
            ),
            const SizedBox(height: 16),
            Text(
              '$score%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsights() {
    final insights = _getInsights();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insights',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            for (final insight in insights)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('• $insight'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextSteps() {
    final nextSteps = _getNextSteps();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Next Steps',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(nextSteps),
          ],
        ),
      ),
    );
  }

  int _calculateScore() {
    int score = 0;
    final bestPracticesQuestions = [
      'automation',
      'centralized_database',
      'real_time_reporting',
      'inventory_management',
      'customer_tracking',
      'data_integration',
      'mobile_access',
      'data_backup',
      'it_team',
      'customization',
    ];
    for (final result in surveyResult) {
      if (bestPracticesQuestions.contains(result.question) &&
          result.answers.contains('Yes')) {
        score += 10;
      }
    }
    return score;
  }

  List<String> _getInsights() {
    final insights = <String>[];
    if (_getRadioResult('automation') == 'No') {
      insights.add('Focus on automating inter-departmental workflows.');
    }
    if (_getRadioResult('centralized_database') == 'No') {
      insights.add('Centralize customer and operational data.');
    }
    if (_getRadioResult('real_time_reporting') == 'No') {
      insights.add('Improve your real-time reporting capabilities.');
    }
    return insights.take(3).toList();
  }

  String _getNextSteps() {
    final preferredSolution = _getRadioResult('preferred_solution');
    if (preferredSolution == 'I want a vendor-managed implementation with extensive training.') {
      return 'Offer a direct 1:1 consultation or demo.';
    } else if (preferredSolution == 'I prefer a modular SaaS solution that our internal team can mostly manage.') {
      return 'Offer a free Group Presentation or a detailed e-book download.';
    } else {
      return 'Recommend a specific, relevant piece of content, such as a video episode or blog post on "Getting Started with ERP," or a book.';
    }
  }

  String? _getRadioResult(String id) {
    for (final result in surveyResult) {
      if (result.question == id) {
        return result.answers.first;
      }
    }
    return null;
  }
}
