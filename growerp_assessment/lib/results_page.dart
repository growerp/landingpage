import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

class ResultsPage extends StatelessWidget {
  final SurveyResult surveyResult;

  const ResultsPage({Key? key, required this.surveyResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your ERP Readiness Score'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Thank you for completing the assessment!',
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        _buildScoreWidget(context),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildInsightsWidget(context),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildNextStepsWidget(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreWidget(BuildContext context) {
    final score = _calculateScore();
    return Column(
      children: [
        Text(
          'Your ERP Readiness Score is:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '$score%',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }

  Widget _buildInsightsWidget(BuildContext context) {
    final insights = _getInsights();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Insights:',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        ...insights.map((insight) => Text(
              '• $insight',
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  Widget _buildNextStepsWidget(BuildContext context) {
    final nextStep = _getNextStep();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Next Steps:',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          nextStep,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  int _calculateScore() {
    int score = 0;
    final erpSteps = surveyResult.results
        .where((stepResult) => stepResult.id.startsWith('erp_'))
        .toList();

    for (var stepResult in erpSteps) {
      final answer = stepResult.result as BooleanResult?;
      if (answer == BooleanResult.positive) {
        score++;
      }
    }
    return ((score / erpSteps.length) * 100).round();
  }

  List<String> _getInsights() {
    final insights = <String>[];
    final erpSteps = surveyResult.results
        .where((stepResult) => stepResult.id.startsWith('erp_'))
        .toList();

    for (var stepResult in erpSteps) {
      final answer = stepResult.result as BooleanResult?;
      if (answer == BooleanResult.negative) {
        switch (stepResult.id) {
          case 'erp_centralized_system':
            insights.add('Centralize your data for a single source of truth.');
            break;
          case 'erp_ecommerce_automation':
            insights.add('Automate your e-commerce and financial data flow.');
            break;
          case 'erp_customer_history':
            insights.add('Provide your sales team with a complete customer history.');
            break;
          case 'erp_inventory_visibility':
            insights.add('Gain real-time visibility into your inventory levels.');
            break;
          case 'erp_purchasing_automation':
            insights.add('Automate your purchasing process to reduce stockouts.');
            break;
          case 'erp_financial_reporting':
            insights.add('Enable real-time financial reporting without spreadsheets.');
            break;
          case 'erp_automated_workflows':
            insights.add('Connect your departments with automated workflows.');
            break;
          case 'erp_mobile_access':
            insights.add('Empower your team with mobile access to key data.');
            break;
          case 'erp_customer_service_visibility':
            insights.add('Give your customer service team instant order visibility.');
            break;
          case 'erp_single_source_of_truth':
            insights.add('Unify your business data to work from a single version of the truth.');
            break;
        }
      }
    }

    if (insights.isEmpty) {
      insights.add('You have a strong foundation for ERP adoption!');
    }

    return insights.take(3).toList();
  }

  String _getNextStep() {
    final preferredSolutionStep = surveyResult.results.firstWhere(
        (stepResult) => stepResult.id == 'qualification_preferred_solution');

    final answer = preferredSolutionStep.result as TextChoice;

    switch (answer.value) {
      case 'vendor-managed':
        return 'We recommend a 1:1 consultation to discuss a vendor-managed implementation. A specialist will contact you shortly.';
      case 'saas':
        return 'We recommend exploring our modular SaaS solutions. You will receive an email with more information and a link to a group presentation.';
      case 'open-source':
        return 'We recommend exploring our open-source solutions. You will receive an email with links to our documentation and community forums.';
      case 'research':
        return 'We recommend starting with our educational resources. You will receive an email with links to our guides and whitepapers.';
      default:
        return 'Thank you for your feedback.';
    }
  }
}
