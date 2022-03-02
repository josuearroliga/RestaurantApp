import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  //creating the route variable
  static const routeName = '/meal-detail';

  //Receiving from main via route.
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  ///Builde for the contents

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      //We need to assign a height, if not the listview will crash
      //as both widgets have infinite heights.
      height: 300,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //This is the variable that stores the context that the previous screen is passing.
    final mealId = ModalRoute.of(context).settings.arguments as String;
//Creating the variavble that will find the id of our meals.
    final mealFinder = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${mealFinder.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(mealFinder.imageUrl, fit: BoxFit.cover),
            ),

            //The ingredients data container
            buildSectionTitle(context, 'Ingredients'),

            //We will use a new container with listview as a child here,
            //// fixed height.
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        mealFinder.ingredients[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      )),
                ),
                itemCount: mealFinder.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),

            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              (index + 1).toString(),
                            ),
                          ),
                          title: Text(mealFinder.steps[index]),
                        ),
                        Divider(),
                      ],
                    ),
                itemCount: mealFinder.steps.length)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
