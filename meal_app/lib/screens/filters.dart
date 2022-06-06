import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  FiltersScreen(
      {Key? key, required this.saveFilter, required this.currentFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  initState() {
    super.initState();

    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilter(selectedFilters);
            },
          )
        ],
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your Fliters here',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                  'Gluten-free', 'Only include gluten-free', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchTile(
                  'Lactose-free', 'Only include lactose-free', _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              buildSwitchTile('vegan', 'Only include vegan', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              buildSwitchTile(
                  'vegetarian', 'Only include vegetarian', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              })
            ],
          ))
        ],
      ),
      drawer: const DrawerMain(),
    );
  }

  SwitchListTile buildSwitchTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
