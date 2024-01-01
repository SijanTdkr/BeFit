import 'package:flutter/material.dart';
import 'challenges_page.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Admin Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _navigateToChallengesPage(context);
              },
              child: Text('Open Challenges Page'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToChallengesPage(BuildContext context) async {
    // Navigate to ChallengesPage and wait for the result
    String? addedChallenge = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengesPage(),
      ),
    );

    // Handle the returned challenge (can be null if the user canceled)
    if (addedChallenge != null) {
      // Do something with the added challenge (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Challenge added: $addedChallenge'),
        ),
      );
    }
  }
}
