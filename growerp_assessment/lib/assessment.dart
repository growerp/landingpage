import 'package:survey_kit/survey_kit.dart';

final assessmentSurvey = NavigableTask(
  id: 'assessmentSurvey',
  steps: [
    InstructionStep(
      title: 'Welcome to the\nGrowERP Readiness Assessment',
      text:
          'Answer the following questions to find out your current ERP Readiness Score and receive immediate, customized recommendations.',
      buttonText: 'Let\'s start!',
    ),
    QuestionStep(
      title: 'Contact Information',
      text: 'Please enter your name.',
      answerFormat: const TextAnswerFormat(
        hint: 'Name',
        validationRegEx: r'^(?!\s*$).+',
      ),
    ),
    QuestionStep(
      title: 'Contact Information',
      text: 'Please enter your email address.',
      answerFormat: const TextAnswerFormat(
        hint: 'Email',
        validationRegEx:
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Do all your key departments (e.g., Sales, Finance, Warehouse) rely on a single, centralized system for all customer and operational data?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'When a sale is made on your e-commerce store (e.g., Shopify, WooCommerce), does it automatically update both your inventory records and your financial ledger without manual data entry?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Can your sales team access a complete customer history (past orders, communication, and payment status) from a single screen?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Do you have real-time visibility into your inventory levels across all sales channels and locations?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Is your purchasing process automated (e.g., can the system automatically generate purchase orders when stock levels fall below a set threshold)?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Can your finance team generate a real-time Profit & Loss (P&L) statement or cash flow report in under 5 minutes, without needing to export data to spreadsheets?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Do you have automated workflows that connect departments (e.g., an approved sales order automatically creates a "pick list" for the warehouse)?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Can your managers and team leads access key business dashboards and reports securely from a mobile device?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Can your customer service team instantly view a customer\'s order status and fulfillment details without contacting another department?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'ERP Best Practices',
      text: 'Are all your employees who need access to business data (e.g., sales, marketing, finance) working from the same version of the truth, or are they using separate, often outdated, spreadsheets?',
      answerFormat: const BooleanAnswerFormat(
        positiveAnswer: 'Yes',
        negativeAnswer: 'No',
      ),
    ),
    QuestionStep(
      title: 'Qualification Questions',
      text: 'Which statement best describes your company\'s current stage of growth?',
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(id: 'early-stage', text: 'We\'re an early-stage company trying to establish standardized processes beyond spreadsheets.', value: 'early-stage'),
          TextChoice(id: 'scaling', text: 'We\'re a rapidly scaling business whose current, disconnected apps (e.g., separate accounting, CRM, inventory tools) can\'t keep up.', value: 'scaling'),
          TextChoice(id: 'established', text: 'We\'re an established business needing to modernize a single legacy system or integrate a new department/acquisition.', value: 'established'),
          TextChoice(id: 'e-commerce', text: 'We are an e-commerce-focused business struggling to connect our online storefront(s) with our backend finance and fulfillment.', value: 'e-commerce'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Qualification Questions',
      text: 'Which desired outcome is most important for your business to achieve in the next 6 months?',
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(id: 'real-time-view', text: 'Gain a single, real-time view of our entire business (finance, sales, inventory).', value: 'real-time-view'),
          TextChoice(id: 'automate-tasks', text: 'Automate manual, repetitive tasks (like invoicing, data entry) to reduce errors and free up our team.', value: 'automate-tasks'),
          TextChoice(id: 'integrate-ecommerce', text: 'Integrate our e-commerce platform directly with our accounting and inventory to streamline fulfillment.', value: 'integrate-ecommerce'),
          TextChoice(id: 'improve-inventory', text: 'Improve inventory and supply chain accuracy to prevent stockouts and reduce holding costs.', value: 'improve-inventory'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Qualification Questions',
      text: 'What obstacle do you believe is currently stopping your organization from successfully implementing a new ERP system?',
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(id: 'resistance', text: 'Internal resistance to change and the perceived difficulty of training employees on a new system.', value: 'resistance'),
          TextChoice(id: 'tco-roi', text: 'Uncertainty about the total cost of ownership (TCO) and proving the long-term return on investment (ROI).', value: 'tco-roi'),
          TextChoice(id: 'implementation', text: 'Concern about the implementation process itself—the time, disruption, and data migration challenges.', value: 'implementation'),
          TextChoice(id: 'lack-of-it', text: 'Lack of a dedicated internal IT team or the technical expertise to manage a new, complex system.', value: 'lack-of-it'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Qualification Questions',
      text: 'Which solution setup would suit your company best?',
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(id: 'vendor-managed', text: 'We want a vendor-managed implementation with extensive, hands-on training and ongoing support.', value: 'vendor-managed'),
          TextChoice(id: 'saas', text: 'We prefer a flexible, modular SaaS (cloud) solution that our internal team can mostly configure and manage with standard support.', value: 'saas'),
          TextChoice(id: 'open-source', text: 'We have a technical team and are interested in an open-source solution that we can deeply customize and manage ourselves.', value: 'open-source'),
          TextChoice(id: 'research', text: 'We are primarily in the research phase and looking for educational resources and guides to understand our options.', value: 'research'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Qualification Questions',
      text: 'Is there anything else about your current systems, timeline, or specific integration needs (e.g., a specific payment gateway, logistics partner, or required third-party app) that we should know?',
      answerFormat: const TextAnswerFormat(
        hint: 'Please provide any additional information',
      ),
    ),
    CompletionStep(
      id: 'completionStep',
      text: 'Thank you for completing the assessment!',
      title: 'Done!',
      buttonText: 'View Results',
    ),
  ],
);
