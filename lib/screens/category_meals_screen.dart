import 'package:flutter/material.dart';
import '/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  //This is added so we can call the route without typos.
  static const routeName = '/category-meals';

  //Here we are receiving the data that were sending via the
  //argument in the route set in main.
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  // final String id;
  //Since we change the state in -removeMeal this state hook will
  //reload itself  and by doing this it overrides the deletion because
  //it is supposesed to load all meals again. So we need it to run
  //only once per rebuild.
  //To stop it from re running we restrict it with a bool.
  void didChangeDependencies() {
//This variable is created to store what the namedPush is dong to send as
    //arguments when calling the categorymeals class from the route in main.
    //Thanks to this restrictions the load of meals is only loaded
    //at the very beggining.
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
//Getting the category title from the argument received in the routeArgs variable.
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      //Declaring a variable that check which meals belong to the caategory
      //chosen
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      //Changing the
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      // titleTextStyle: Theme.of(context).textTheme.bodyText1),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              affordability: displayedMeals[index].affordability,
              imageUrl: displayedMeals[index].imageUrl,
              mealComplexity: displayedMeals[index].complexity,
              mealDuration: displayedMeals[index].duration,
              mealTitle: displayedMeals[index].title);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
