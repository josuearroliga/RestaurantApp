import 'package:flutter/material.dart';

//Creating this file in order to have a view to how exactly a categorty
//showld look like.
class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {@required this.id, @required this.title, this.color = Colors.orange});
}
