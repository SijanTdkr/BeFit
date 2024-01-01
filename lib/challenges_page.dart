import 'package:flutter/material.dart';

class ChallengesPage extends StatefulWidget {
  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  // You can use this list to store and display workout challenges
  List<String> workoutChallenges = [
    '30-Day Abs Challenge',
    'Arm Strength Challenge',
    'Leg Day Challenge',
    'Full Body Workout Challenge',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Challenges'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose a Workout Challenge',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: workoutChallenges.length,
                itemBuilder: (context, index) {
                  return _buildChallengeCard(workoutChallenges[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeCard(String challengeName) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          challengeName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // TODO: Navigate to the selected challenge details page
          // You can use Navigator to push a new page or route
          // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengeDetailsPage(challengeName)));
        },
      ),
    );
  }
}
