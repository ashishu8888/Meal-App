import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meal';
  List<Meal> availableMeal;
  CategoryMealsScreen({Key? key, required this.availableMeal})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayMeal;
  @override
  // void initState() {}
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryid = routeArgs['id'];
    displayMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayMeal!.removeWhere((meal) => meal.id == mealID);
    });
  }

  // final String? categoryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: Colors.pink, title: Text(categoryTitle!)),
        body: ListView.builder(
            itemCount: displayMeal!.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayMeal![index].id,
                title: displayMeal![index].title,
                imageUrl: displayMeal![index].imageUrl,
                duration: displayMeal![index].duration,
                complexity: displayMeal![index].complexity,
                affordability: displayMeal![index].affordability,
              );
            }));
  }
}
