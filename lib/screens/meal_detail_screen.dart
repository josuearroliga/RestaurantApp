import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  //creating the route variable
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealArgs = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Title now!'),
      ),
      body: Center(
        child: Text('The meal - $mealArgs!'),
      ),
    );
  }
}
