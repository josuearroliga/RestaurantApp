import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String id;
  final String CategoryTitle;

  CategoryMealsScreen(this.id, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      // titleTextStyle: Theme.of(context).textTheme.bodyText1),
      body: Container(
        child: Center(child: Text('This is a widget')),
      ),
    );
  }
}
