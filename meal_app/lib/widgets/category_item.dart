import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.title, this.color, this.id, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
            arguments: {'id': id, 'title': title});
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 20,
        width: 20,
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
