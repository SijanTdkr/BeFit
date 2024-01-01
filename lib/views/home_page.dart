import 'package:flutter/material.dart';
import 'package:practice1/views/aboutus_page.dart';
import 'package:practice1/views/daily_food_tracking_page.dart';
import 'package:practice1/views/profile_page.dart';
import 'package:practice1/views/workout_tracking_page.dart';
import 'package:practice1/views/guided_training_page.dart';
import 'package:practice1/challenges_page.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeFit'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Profile Picture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: ( ) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),


                );
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (AboutUsPage())),


                );
                
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Fitness App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Track your daily meals and workouts to stay fit.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            _buildClickableWidget(
                context, 'Daily Meal Tracker', DailyFoodTrackingPage()),
            SizedBox(height: 16),
            _buildClickableWidget(
                context, 'Daily Workout Tracker', WorkoutTrackingPage()),
            SizedBox(height: 16),
            _buildClickableWidget(
                context, 'Guided Training', GuidedTrainingPage()),
            SizedBox(height: 16),
            _buildClickableWidget(context, 'Challenges', ChallengesPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableWidget(
      BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_getImagePath(title)),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

 String _getImagePath(String title) {
  switch (title) {
    case 'Daily Meal Tracker':
      return 'assets/images/food.jpeg';   
    case 'Daily Workout Tracker':
      return 'assets/images/workout.png';   
    case 'Guided Training':
      return 'assets/images/guided.png';   
    case 'Challenges':
      return 'assets/images/challenges.png';   
    default:
      return '';
  }
}

}
