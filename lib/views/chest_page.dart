import 'package:flutter/material.dart';

class ChestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chest Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseCard(
              'Push-ups',
              'Perform 3 sets of 15 reps',
              'assets/chest_pushup_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Bench Press',
              'Perform 4 sets of 12 reps',
              'assets/chest_benchpress_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Dumbbell Flyes',
              'Perform 3 sets of 12 reps',
              'assets/chest_flyes_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Incline Bench Press',
              'Perform 3 sets of 10 reps',
              'assets/chest_inclinebenchpress_image.jpg',
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
    home: ChestPage(),
  ));
}
