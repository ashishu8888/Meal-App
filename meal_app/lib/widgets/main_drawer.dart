import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.amber,
          child: const Text(
            'Cooking Up!',
            style: TextStyle(
                color: Colors.red, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ]),
    );
  }

  ListTile buildListTile(String title, IconData icon, VoidCallback ontap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: ontap,
    );
  }
}
