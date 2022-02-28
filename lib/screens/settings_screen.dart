import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-details';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final maindrawer = MainDrawer();
  var _isVegetarian = false;
  var _isVegan = false;
  var _gluttenFree = false;
  var _lactoseFree = false;

  //Creating a builder method for the toggles.
  Widget toggleBuilder(
      bool variable, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: _gluttenFree,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
        centerTitle: true,
      ),
      //We use the built in caller named "drwawer" to call maindrawer.
      drawer: MainDrawer(),
      //Since we want to have mutliple toggles in the page we will need to instantiate
      //their boolean values when the switch is pressed.
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Choose what you want to see',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                toggleBuilder(
                    _gluttenFree, 'Glutten-Free', 'Only Glutten Free Food',
                    (newValue) {
                  setState(() {
                    _gluttenFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
