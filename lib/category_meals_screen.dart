import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
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
    final categoryId = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      // titleTextStyle: Theme.of(context).textTheme.bodyText1),
      body: Container(
        child: Center(child: Text('This is a widget')),
      ),
    );
  }
}
