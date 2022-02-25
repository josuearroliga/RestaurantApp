import 'package:flutter/material.dart';
import '/screens/tabs_screen.dart';

import '/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
//Creating listtle builder widget.

  Widget ListTileBuilder(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            color: Theme.of(context).colorScheme.secondary,
            child: Center(
                child: Text(
              'Coocki\'n it!',
              style: TextStyle(
                decorationColor: Colors.black,
                fontWeight: FontWeight.w900,
                color: Colors.pink,
                fontSize: 35,
              ),
            )),
          ),
          SizedBox(height: 20),
          ListTileBuilder('Meals', Icons.restaurant, () {
            //We add the navigator individually, since we want to load
            //the home pacge we also create the static const for the
            //route in the tbsscreen class.
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          ListTileBuilder(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context) //Using pushreplacedNamed to remove
                  //the old page and only have the current one.
                  .pushReplacementNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
