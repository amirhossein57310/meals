import 'package:flutter/material.dart';
import 'package:flutter_meals/data/models/meal.dart';
import 'package:flutter_meals/dummy_data.dart';
import 'package:flutter_meals/screens/category_meals_screen.dart';
import 'package:flutter_meals/screens/favorit_screen.dart';
import 'package:flutter_meals/screens/filter_screen.dart';
import 'package:flutter_meals/screens/home_page_screen.dart';
import 'package:flutter_meals/screens/meal_detail_screen.dart';
import 'package:flutter_meals/screens/tab_screen.dart';

void main() {
  runApp(const DelMeal());
}

class DelMeal extends StatefulWidget {
  const DelMeal({Key? key}) : super(key: key);

  @override
  State<DelMeal> createState() => _DelMealState();
}

class _DelMealState extends State<DelMeal> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetrian': false,
  };

  List<Meal> _availableMeals = Dummy_Meals;

  List<Meal> _favoritMeals = [];

  void _taggleFavarit(String mealId) {
    setState(() {
      final currentIndex = _favoritMeals.indexWhere((m) => m.id == mealId);
      if (currentIndex >= 0) {
        _favoritMeals.removeAt(currentIndex);
      } else {
        _favoritMeals.add(Dummy_Meals.firstWhere((m) => m.id == mealId));
      }
    });
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = Dummy_Meals.where(
        (m) {
          if (_filters['gluten']! && m.isGlutenFree != _filters['gluten']!) {
            return false;
          }
          if (_filters['lactos']! && m.isLactosFree != _filters['lactos']!) {
            return false;
          }
          if (_filters['vegan']! && m.isVegan != _filters['vegan']!) {
            return false;
          }
          if (_filters['vegetrian']! &&
              m.isVegetrian != _filters['vegetrian']!) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'rw',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
                fontFamily: 'rw',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              caption: TextStyle(
                fontFamily: 'rc',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
        backgroundColor: Colors.greenAccent,
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 220, 2),
      ),
      //home: const HomePageScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favoritMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_taggleFavarit),
        FilterScreen.routeName: (context) =>
            FilterScreen(_setFilters, _filters),
      },
    );
  }
}
