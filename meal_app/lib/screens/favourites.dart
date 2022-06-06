import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal>? favouriteMeals;
  const Favourites(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals!.isEmpty) {
      return Center(
        child: Text(
          'No favourite Yet!',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favouriteMeals!.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouriteMeals![index].id,
              title: favouriteMeals![index].title,
              imageUrl: favouriteMeals![index].imageUrl,
              duration: favouriteMeals![index].duration,
              complexity: favouriteMeals![index].complexity,
              affordability: favouriteMeals![index].affordability,
            );
          });
    }
  }
}
