import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //This is added so we can call the route without typos.
  static const routeName = '/category-meals';
  // final String id;
  // final String CategoryTitle;

  // CategoryMealsScreen(this.id, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    //This variable is created to store what the namedPush is dong to send as
    //arguments when calling the categorymeals class from the route in main.
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
//Getting the category title from the argument received in the routeArgs variable.
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    //Declaring a variable that check which meals belong to the caategory
    //chosen
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      // titleTextStyle: Theme.of(context).textTheme.bodyText1),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              affordability: categoryMeals[index].affordability,
              imageUrl: categoryMeals[index].imageUrl,
              mealComplexity: categoryMeals[index].complexity,
              mealDuration: categoryMeals[index].duration,
              mealTitle: categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
