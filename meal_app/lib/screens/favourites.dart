import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class Favourites extends StatelessWidget {
  final List<Meal>? favouriteMeals;
  const Favourites(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('fav'));
  }
}
