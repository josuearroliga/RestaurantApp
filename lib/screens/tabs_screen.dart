import 'package:flutter/material.dart';

import '/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //Creates the list of pages that wants to load.
  //We change this for a map to have the ability to also change the title.
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorites',
    },
  ];

//Creates a variable to save the index of the page that wants to show
//the onTap method in the bottomMenuBar passes the index for the icons
//pressed automatically!!
  int _selectedPageIndex = 0;

//We receive the index that onTap is sending and we assign it to the variable.
//
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //We will now use the data in the Map to dinamically change the title.
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      //We now reference our list and pass the index, in this case, hte one
      //that onTap sent to the method after the user clicked the button.
      //We now make the reference to the List of Maps we just created.
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        //Addign this to have the ability to tell the bar which item is
        //currently selected, this way they can highlight dinamically.
        currentIndex: _selectedPageIndex,
        //If we use this we need to theme each icon manually for the
        //background.
        type: BottomNavigationBarType.fixed,
        //Sends the index to the method and now we know which page we want to
        //load up next.
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
