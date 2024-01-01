import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AboutUsPage(),
  ));
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About BeFit',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'BeFit is your all-in-one fitness app designed to help you achieve your health goals. With features like Daily Food Tracking, Daily Workouts Tracking, and Guided Training, we make staying fit easy and enjoyable.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Meet the Developers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildDeveloperCard(
                'Sijan Tandukar',
                'UI/UX Designer',
                'assets/images/sijan.jpeg',
                'Stay positive and inspire others!',
              ),
              _buildDeveloperCard(
                'Nishav Rayamajhi',
                'Backend Developer',
                'assets/images/nishav.jpeg',
                'Success is a journey, not a destination.',
              ),
              _buildDeveloperCard(
                'Khushi Siwakoti',
                'Lead Developer',
                'assets/images/khushi.jpeg',
               
                'Believe in yourself and all that you are.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperCard(String name, String role, String imagePath, String moralWords) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              role,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'Words of Wisdom: ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: moralWords,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
