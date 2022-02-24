import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';

import '../models/meal.dart';

//In theory this is all we want to show in each card.
class MealItem extends StatelessWidget {
  final String id;
  final Affordability affordability;
  final String mealTitle;
  final Complexity mealComplexity;
  final int mealDuration;
  final String imageUrl;

  MealItem(
      {@required this.id,
      @required this.affordability,
      @required this.imageUrl,
      @required this.mealComplexity,
      @required this.mealDuration,
      @required this.mealTitle});

//Creating a getter to check the enum result.
  String get complexityText {
    switch (mealComplexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown, try editing the item!';
    }
  }

  //Getter for affordability enum
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown, try editing the item!';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        //color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                //We need to create this widget in order to wrap the image
                //into a circular box, if not it wouldve overlapped the
                //card shape.
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //Her qwe create a variable in order to import this value
                  //from the catitem class.
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                //Working on the extra info for this card.

                //This widget allows to manually position an item inside a STACK
                //wherever you want, just using coordinates.
                Positioned(
                  bottom: 10,
                  right: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),

                      //Added text into a container to handle its surrounding
                      //area to properly fit the text.
                      child: Text(
                        mealTitle,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),

            //Adding bottom row to display time and other data.

            Padding(
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$mealDuration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      //Ned to create getter for this enum value.
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_sharp),
                      SizedBox(width: 6),
                      //Ned to create getter for this enum value.
                      Text(affordabilityText),
                    ],
                  ),
                  //2nd row
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
