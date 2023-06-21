import 'package:flutter/material.dart';
import 'package:flutter_meals/data/models/meal.dart';
import 'package:flutter_meals/dummy_data.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
//  final String categoryId;
  //final String categoryTitle;
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  static const routeName = 'category_meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routArgs['id']!;
    final String categoryTitle = routArgs['title']!;
    final categoryMeals = widget.availableMeals.where(
      (m) {
        return m.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(categoryTitle),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                categoryMeals[index].id,
                categoryMeals[index].title,
                categoryMeals[index].imageUrl,
                categoryMeals[index].duration,
                categoryMeals[index].complexity,
                categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
