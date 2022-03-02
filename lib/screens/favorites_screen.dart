import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
//Receiving the data form the tabs screen directly.
  final List<Meal> favoritedMeals;

  FavoritesScreen(this.favoritedMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Center(
        child: Text('No favorites added yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoritedMeals[index].id,
              affordability: favoritedMeals[index].affordability,
              imageUrl: favoritedMeals[index].imageUrl,
              mealComplexity: favoritedMeals[index].complexity,
              mealDuration: favoritedMeals[index].duration,
              mealTitle: favoritedMeals[index].title);
        },
        itemCount: favoritedMeals.length,
      );
    }
  }
}
