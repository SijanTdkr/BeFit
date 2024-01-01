 import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;

  InputField({
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: Color.fromARGB(255, 9, 0, 0)),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/register.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                  title: Text('BeFit - Register'),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                InputField(
                  controller: _usernameController,
                  labelText: 'Username',
                ),
                SizedBox(height: 16),
                InputField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                InputField(
                  controller: _dobController,
                  labelText: 'Date of Birth',
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 16),
                InputField(
                  controller: _weightController,
                  labelText: 'Body Weight (kg)',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                InputField(
                  controller: _heightController,
                  labelText: 'Height (cm)',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Handle registration logic here
                    String username = _usernameController.text;
                    String email = _emailController.text;
                    String dob = _dobController.text;
                    String weight = _weightController.text;
                    String height = _heightController.text;

                    // Perform registration or validation as needed

                    // For now, print the collected data
                    print('Username: $username');
                    print('Email: $email');
                    print('Date of Birth: $dob');
                    print('Body Weight: $weight kg');
                    print('Height: $height cm');
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle Google login logic here
                    // Implement Google Sign-In functionality
                    print('Google Login');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google-png-5a3554027e9924.3682726615134443545186.jpg',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 8),
                      Text('Sign up with Google'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
