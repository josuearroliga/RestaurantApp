import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-details';

  @override
  Widget build(BuildContext context) {
    final maindrawer = MainDrawer();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      //We use the built in caller named "drwawer" to call maindrawer.
      drawer: MainDrawer(),
      body: Center(
        child: Container(
          child: Text('Seetings page!'),
        ),
      ),
    );
  }
}
