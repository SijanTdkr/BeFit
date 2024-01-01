import 'package:flutter/material.dart';

void main() {
  runApp(BeFitApp());
}

class BeFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WorkoutTrackingPage(),
    );
  }
}

class WorkoutTrackingPage extends StatefulWidget {
  @override
  _WorkoutTrackingPageState createState() => _WorkoutTrackingPageState();
}

class _WorkoutTrackingPageState extends State<WorkoutTrackingPage> {
  List<Exercise> _exercises = [];
  TextEditingController _exerciseNameController = TextEditingController();
  TextEditingController _setsController = TextEditingController();
  TextEditingController _repsController = TextEditingController();

  void _addExercise() {
    if (_exerciseNameController.text.isNotEmpty &&
        _setsController.text.isNotEmpty &&
        _repsController.text.isNotEmpty) {
      setState(() {
        _exercises.add(
          Exercise(
            name: _exerciseNameController.text,
            sets: int.parse(_setsController.text),
            reps: int.parse(_repsController.text),
          ),
        );
        _exerciseNameController.clear();
        _setsController.clear();
        _repsController.clear();
      });
    }
  }

  void _removeExercise(int index) {
    setState(() {
      _exercises.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BeFit - Workout Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _exerciseNameController,
              decoration: InputDecoration(labelText: 'Exercise Name'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _setsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Sets'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _repsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Reps'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addExercise,
              child: Text('Add Exercise'),
            ),
            SizedBox(height: 20),
            Text(
              'Today\'s Workout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_exercises[index].name),
                    subtitle: Text('${_exercises[index].sets} sets, ${_exercises[index].reps} reps'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeExercise(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise {
  final String name;
  final int sets;
  final int reps;

  Exercise({required this.name, required this.sets, required this.reps});
}
