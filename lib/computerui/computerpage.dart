import 'package:bloc_computer_app/question/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ComputerHomePage()));
}

class ComputerHomePage extends StatelessWidget {
  const ComputerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Computer Knowledge App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              // Call a logout function or navigate to a login page here
              _logout(context);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Topic',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  buildTopicCard(
                    topic: 'Operating Systems',
                    onTap: () =>
                        _navigateToQuestionPage(context, 'Operating Systems'),
                  ),
                  buildTopicCard(
                    topic: 'Programming Languages',
                    onTap: () =>
                        _navigateToQuestionPage(context, 'Programming Languages'),
                  ),
                  buildTopicCard(
                    topic: 'Python Languages',
                    onTap: () =>
                        _navigateToQuestionPage(context, 'Python Languages'),
                  ),
                  // Add more TopicCards for other topics
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToQuestionPage(BuildContext context, String topic) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionPage(topic: topic)),
    );
  }

  Widget buildTopicCard({required String topic, required VoidCallback onTap}) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            topic,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    // Implement your logout logic here, such as clearing session data
    // and navigating to the login page
    // For now, let's just close the app
    Navigator.of(context).pop();
  }
}
