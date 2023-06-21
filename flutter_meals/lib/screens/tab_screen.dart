import 'package:flutter/material.dart';
import 'package:flutter_meals/data/models/meal.dart';
import 'package:flutter_meals/screens/favorit_screen.dart';
import 'package:flutter_meals/screens/home_page_screen.dart';
import 'package:flutter_meals/screens/meal_detail_screen.dart';
import 'package:flutter_meals/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favoritMeals = [];
  TabScreen(this.favoritMeals, {Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages = [];
  @override
  void initState() {
    setState(() {});
    _pages = [
      {'page': HomePageScreen(), 'title': 'Categories'},
      {'page': FavoritScreen(widget.favoritMeals), 'title': 'Favorits'},
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          _pages[_selectedIndex]['title'] as String,
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: Theme.of(context).textTheme.caption,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
        ],
      ),
    );
  }
}
