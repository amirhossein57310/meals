import 'package:flutter/material.dart';
import 'package:flutter_meals/data/models/meal.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

class FavoritScreen extends StatelessWidget {
  List<Meal> favoritMeals = [];
  FavoritScreen(this.favoritMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritMeals.isEmpty) {
      return Center(
        child: Text('There is no favarit meal yet',
            style: Theme.of(context).textTheme.caption),
      );
    } else {
      return ListView.builder(
        itemCount: favoritMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
              favoritMeals[index].id,
              favoritMeals[index].title,
              favoritMeals[index].imageUrl,
              favoritMeals[index].duration,
              favoritMeals[index].complexity,
              favoritMeals[index].affordability);
        },
      );
    }
  }
}
