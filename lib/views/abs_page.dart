import 'package:flutter/material.dart';

class AbsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abs Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseCard(
              'Crunches',
              'Perform 4 sets of 20 reps',
              'assets/abs_crunches_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Leg Raises',
              'Perform 3 sets of 15 reps',
              'assets/abs_legraises_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Planks',
              'Hold for 60 seconds, repeat 3 times',
              'assets/abs_planks_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Russian Twists',
              'Perform 4 sets of 20 reps',
              'assets/abs_twists_image.jpg',
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
    home: AbsPage(),
  ));
}
