import 'package:flutter/material.dart';

class ShoulderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoulder Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseCard(
              'Shoulder Press',
              'Perform 4 sets of 12 reps',
              'assets/shoulder_press_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Lateral Raises',
              'Perform 3 sets of 15 reps',
              'assets/lateral_raises_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Front Raises',
              'Perform 4 sets of 12 reps',
              'assets/front_raises_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Shrugs',
              'Perform 3 sets of 15 reps',
              'assets/shoulder_shrugs_image.jpg',
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
    home: ShoulderPage(),
  ));
}
