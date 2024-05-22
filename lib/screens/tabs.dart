import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(
        meals: [],
      );
      activePageTitle = 'Yours Favorites';
    }
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      //
      body: activePage,
      //
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          //
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        //
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
