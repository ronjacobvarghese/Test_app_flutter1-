import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile("Gluten-free",
                    "Only include gluten-free meals", _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                _buildSwitchListTile("Lactose-free",
                    "Only include Lactose-free meals", _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian meals", _vegetarian,
                    (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include Vegan meals", _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
