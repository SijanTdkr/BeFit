import 'package:flutter/material.dart';

class ArmsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arms Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseCard(
              'Bicep Curls',
              'Perform 3 sets of 12 reps',
              'assets/arms_bicepcurls_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Tricep Dips',
              'Perform 4 sets of 15 reps',
              'assets/arms_tricepdips_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Hammer Curls',
              'Perform 3 sets of 10 reps',
              'assets/arms_hammercurls_image.jpg',
            ),
            SizedBox(height: 16),
            _buildExerciseCard(
              'Tricep Kickbacks',
              'Perform 3 sets of 12 reps',
              'assets/arms_tricepkickbacks_image.jpg',
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
    home: ArmsPage(),
  ));
}
