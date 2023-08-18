
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final String topic;

  const QuestionPage({super.key, required this.topic});

  @override
  // ignore: library_private_types_in_public_api
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
      // Navigate to results page or handle end of questions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.topic} Questions'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Question ${currentQuestionIndex + 1}/${questions.length}'),
          const SizedBox(height: 10),
          Text(questions[currentQuestionIndex].questionText),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
              questions[currentQuestionIndex].options.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => answerSelected(index),
                  child: Text(questions[currentQuestionIndex].options[index]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('Score: $score/${questions.length}'),
        ],
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
