import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class tabsScreen extends StatefulWidget {
  final List<Meal>? favouriteMeals;
  const tabsScreen(this.favouriteMeals);

  @override
  State<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedIndex = 0;
  _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const Categories(), 'title': 'categories'},
      {'page': Favourites(widget.favouriteMeals), 'title': 'Favourites'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_pages[_selectedIndex]['title'] as String),
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      drawer: DrawerMain(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellowAccent,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            label: 'Categories',
            icon: const Icon(Icons.category),
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
