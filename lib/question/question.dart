// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';




class QuestionPage extends StatefulWidget {
  final String topic;

  const QuestionPage({Key? key, required this.topic}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Question> questions = [
    Question('What is the main purpose of an operating system?', ['A', 'B', 'C', 'D'], 0),
    Question('Which programming language is used for mobile app development?', ['A', 'B', 'C', 'D'], 1),
    Question('What is the function of RAM in a computer?', ['A', 'B', 'C', 'D'], 1),
    Question('What does CPU stand for?', ['A', 'B', 'C', 'D'], 2),
    Question('What is the binary equivalent of the decimal number 10?', ['1010', '1100', '1001', '1110'], 0),
    Question('What is a firewall used for?', ['A', 'B', 'C', 'D'], 2),
    Question('What is the purpose of an IP address?', ['A', 'B', 'C', 'D'], 1),
    Question('What is the World Wide Web?', ['A', 'B', 'C', 'D'], 2),
    Question('Which company developed the Python programming language?', ['A', 'B', 'C', 'D'], 3),
    Question('What is cloud computing?', ['A', 'B', 'C', 'D'], 0),
    // Add more questions here
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void answerSelected(int selectedOption) {
    if (selectedOption == questions[currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        score++;
      });
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // All questions answered, navigate to the results page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(score: score, totalQuestions: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topic} Quiz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Question ${currentQuestionIndex + 1}/${questions.length}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Text(
                questions[currentQuestionIndex].questionText,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(
                  questions[currentQuestionIndex].options.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () => answerSelected(index),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        minimumSize: const Size(200, 50),
                      ),
                      child: Text(
                        questions[currentQuestionIndex].options[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('Score: $score/${questions.length}', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question(this.questionText, this.options, this.correctAnswerIndex);
}

class ResultsPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultsPage({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quiz Complete!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Your Score: $score/$totalQuestions', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the quiz page to start again
                Navigator.pop(context);
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
