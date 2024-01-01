import 'package:flutter/material.dart';

class LegsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legs Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseCard(
              'Squats',
              'Perform 4 sets of 15 reps',
              'assets/legs_squats_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Lunges',
              'Perform 3 sets of 12 reps (each leg)',
              'assets/legs_lunges_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Leg Press',
              'Perform 4 sets of 12 reps',
              'assets/legs_legpress_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Calf Raises',
              'Perform 3 sets of 20 reps',
              'assets/legs_calfraises_image.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(String title, String description, String imagePath) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LegsPage(),
  ));
}
