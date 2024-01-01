import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DailyFoodTrackingPage(),
  ));
}

class DailyFoodTrackingPage extends StatefulWidget {
  @override
  _DailyFoodTrackingPageState createState() => _DailyFoodTrackingPageState();
}

class _DailyFoodTrackingPageState extends State<DailyFoodTrackingPage> {
  // Placeholder data for meal entries
  List<MealEntry> breakfastEntries = [];
  List<MealEntry> lunchEntries = [];
  List<MealEntry> snacksEntries = [];
  List<MealEntry> dinnerEntries = [];

  // Function to add a new meal entry
  void addMealEntry(List<MealEntry> mealList, String foodName, double calories) {
    setState(() {
      mealList.add(MealEntry(foodName, calories));
    });
  }

  // Function to calculate total nutrition for a given meal type
  NutritionInfo calculateTotalNutrition(List<MealEntry> mealList) {
    double totalCalories = 0;
    double totalProtein = 0;
    double totalCarbs = 0;
    double totalFats = 0;

    for (var entry in mealList) {
      totalCalories += entry.calories;
    }

    return NutritionInfo(
      totalCalories: totalCalories,
      totalProtein: totalProtein,
      totalCarbs: totalCarbs,
      totalFats: totalFats,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Meal Tracker'),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMealTracker('Breakfast', breakfastEntries),
            _buildMealTracker('Lunch', lunchEntries),
            _buildMealTracker('Snacks', snacksEntries),
            _buildMealTracker('Dinner', dinnerEntries),
            SizedBox(height: 16),
            _buildTotalNutrition(),
          ],
        ),
      ),
    );
  }

  Widget _buildMealTracker(String mealType, List<MealEntry> mealList) {
    return Card(
      color: Colors.grey[900],
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              mealType,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              children: mealList.map((entry) {
                return _buildMealEntry(entry);
              }).toList(),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _showAddFoodDialog(mealList);
              },
              child: Text('Add Food'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealEntry(MealEntry entry) {
    return ListTile(
      title: Text(
        entry.foodName,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        'Calories: ${entry.calories.toString()}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTotalNutrition() {
    NutritionInfo totalNutrition = calculateTotalNutrition(breakfastEntries +
        lunchEntries +
        snacksEntries +
        dinnerEntries);

    return Card(
      color: Colors.grey[900],
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Nutrition for the Day',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            _buildNutritionInfo('Calories', totalNutrition.totalCalories),
            _buildNutritionInfo('Protein', totalNutrition.totalProtein),
            _buildNutritionInfo('Carbs', totalNutrition.totalCarbs),
            _buildNutritionInfo('Fats', totalNutrition.totalFats),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionInfo(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showAddFoodDialog(List<MealEntry> mealList) {
    TextEditingController foodNameController = TextEditingController();
    TextEditingController caloriesController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Food'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: foodNameController,
                decoration: InputDecoration(labelText: 'Food Name'),
              ),
              TextField(
                controller: caloriesController,
                decoration: InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String foodName = foodNameController.text;
                double calories = double.tryParse(caloriesController.text) ?? 0;

                if (foodName.isNotEmpty && calories > 0) {
                  addMealEntry(mealList, foodName, calories);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class MealEntry {
  final String foodName;
  final double calories;

  MealEntry(this.foodName, this.calories);
}

class NutritionInfo {
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFats;

  NutritionInfo({
    required this.totalCalories,
    this.totalProtein = 0,
    this.totalCarbs = 0,
    this.totalFats = 0,
  });
}
