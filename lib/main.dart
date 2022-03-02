import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '/dummy_data.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Defaul settig for the filters.
  //This map will update when the user clicks save in the settings screen.

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  //This is the list we will show when the query is executed in
  //_setFilters down below.

  //We must also use or update this list in our catehory meals screen.
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];

  //This will set the filters when the users presses ht ebutton.
  //Should be called from inside the settings screen.
  //We pass this method via the argument in the route added here.
  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      //We replace the map created above with the one received
      //via the arguments.
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

//This method will decide if the meal should go into the dfavorites or not.
//
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    //Means that it exists already in the list, duplicated..
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(
        () {
          //It doesnt exists in the list, therefore can be added.
          _favoritedMeals.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
          );
        },
      );
    }
    ;
  }

  //Method that will check if a meal is fav or not.
  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amberAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      home: TabsScreen(_favoritedMeals),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        SettingsScreen.routeName: (ctx) =>
            SettingsScreen(_filters, _setfilters),
        TabsScreen.routeName: (ctx) => TabsScreen(_favoritedMeals),
      },

      //Generating a different form to call pages.
      //Works if we use named routes.
      //This will work as support in case we try to access a route that is
      //declared on the routes above.
      /*    onGenerateRoute: (settings) {
        /* return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        ); */
      }, */
      //Adding unknown route in order to make sure the user always
      //see a screen even if this screen does not exist, 404 page.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
