import 'package:flutter/material.dart';

class ReadmeScreen extends StatelessWidget {
  final String feedbackMessage = '''
Dear Eng.Mahmoud Salah,

I hope this message finds you well. I wanted to reach out and ask for your feedback on the task I completed for you. I value your perspective and would appreciate your insights regarding my strengths and weaknesses. Your feedback will be invaluable in helping me grow and improve as a professional.

I kindly request that you provide an assessment of my performance in the following areas:

Strengths:
- Based on the task I completed, what do you believe are my strongest points?
- Are there any particular skills or abilities that stood out to you?

Weaknesses:
- In which areas do you think I could use improvement?
- Were there any specific challenges or shortcomings you noticed during the task?

I genuinely appreciate your time and feedback. Your honest evaluation will assist me in identifying areas for personal and professional development. Thank you for giving me the opportunity to work on this task, and I look forward to hearing your thoughts.

Best regards,
Adel Mohsen
''';

  const ReadmeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(
              feedbackMessage,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
