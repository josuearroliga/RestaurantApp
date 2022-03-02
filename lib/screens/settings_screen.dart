import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-details';

//This function will save the method passed from main via the argument
// in the route at that location.
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  SettingsScreen(this.currentFilters, this.saveFilters);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final maindrawer = MainDrawer();
  var _isVegetarian = false;
  var _isVegan = false;
  var _gluttenFree = false;
  var _lactoseFree = false;

//This is done with the map of current selections were receivbing
//from the main via the route arguments.
//9In this case this is set to load before the build methos of this
//class creates the default values of the map listed above.
  @override
  initState() {
    _gluttenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  //Creating a builder method for the toggles.
  Widget toggleBuilder(
      bool variable, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      value: variable,
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
        //This button will be pressed and will call a method stored
        //in trhe main class.
        actions: [
          IconButton(
            //In order to have the abiliti to call the method
            //instead of only settign a pointer, we need to
            //put it inside an anonymous function,.
            onPressed: () {
              final selectedFilters = {
                //Were saving the input that the user made and sending it
                //to the main class via the argument of saveFilters.
                'gluten': _gluttenFree,
                'lactose': _lactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            //Since we initialized out of the state we can access the parent
            //widget data with the word 'widget'.
            icon: Icon(Icons.save),
          ),
        ],
      ),
      //We use the built in caller named "drwawer" to call maindrawer.
      drawer: MainDrawer(),
      //Since we want to have mutliple toggles in the page we will need to instantiate
      //their boolean values when the switch is pressed.
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Choose what you want to see:',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                toggleBuilder(
                  _gluttenFree,
                  'Glutten-Free',
                  'Only Glutten Free Food',
                  (newValue) {
                    // print(newValue);
                    setState(() {
                      _gluttenFree = newValue;
                    });
                    //print(newValue);
                  },
                ),
                //Second toggle for lactose
                toggleBuilder(
                  _lactoseFree,
                  'Lactose-Free',
                  'Only Lactose Free Food',
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                //Third toggle for Vegetarian
                toggleBuilder(
                  _isVegetarian,
                  'Vegatarian',
                  'Only Veggy Food',
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                //Fourth toggle for Vega
                toggleBuilder(
                  _isVegan,
                  'Vegan',
                  'Only Vegan Food',
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
