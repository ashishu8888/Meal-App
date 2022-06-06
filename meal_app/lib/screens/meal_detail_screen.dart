import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isFavourite;

  const MealDetailScreen(this.toggleFavourite, this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          newContainer(context, 'Ingredient'),
          containerBuild(
            selectedMeal,
            ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    )),
          ),
          newContainer(context, 'Steps'),
          containerBuild(
              selectedMeal,
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: Text(
                                "# ${index + 1}",
                              ),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          const Divider(
                            thickness: 1.7,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ],
                      )))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealID) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavourite(mealID);
        },
      ),
    );
  }

  Container containerBuild(Meal selectedMeal, Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2.0, color: Colors.amber),
        ),
        height: 100,
        width: 300,
        child: child);
  }

  Container newContainer(BuildContext context, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
