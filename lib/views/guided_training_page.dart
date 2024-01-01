import 'package:flutter/material.dart';
import 'package:practice1/views/abs_page.dart';
import 'package:practice1/views/arms_page.dart';
import 'package:practice1/views/back_page.dart';
import 'package:practice1/views/chest_page.dart';
import 'package:practice1/views/legs_page.dart';
import 'package:practice1/views/shoulder_page.dart';

void main() {
  runApp(MaterialApp(
    home: GuidedTrainingPage(),
  ));
}

class GuidedTrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guided Training'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tutorial',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Lets train together',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32),
              _buildClickableWidget(
                context,
                'Chest',
                ChestPage(),
              ),
              SizedBox(height: 16),
              _buildClickableWidget(
                context,
                'Back',
                BackPage(),
              ),
              SizedBox(height: 16),
              _buildClickableWidget(
                context,
                'Arms',
                ArmsPage(),
              ),
              SizedBox(height: 16),
              _buildClickableWidget(
                context,
                'Legs',
                LegsPage(),
              ),
              SizedBox(height: 16),
              _buildClickableWidget(
                context,
                'Shoulder',
                ShoulderPage(),
              ),
              SizedBox(height: 16),
              _buildClickableWidget(
                context,
                'Abs',
                AbsPage(),
              ),
            ],
          ),
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getImagePath(String title) {
  switch (title) {
    case 'Chest':
      return 'assets/images/chest.jpeg';
    case 'Back':
      return 'assets/images/back.webp';
    case 'Arms':
      return 'assets/images/arms.jpeg';
    case 'Legs':
      return 'assets/images/legs.avif'; 
    case 'Shoulder':
      return 'assets/images/shoulder.webp';
    case 'Abs':
      return 'assets/images/abs.webp';
    default:
      return '';
  }
}

  }
