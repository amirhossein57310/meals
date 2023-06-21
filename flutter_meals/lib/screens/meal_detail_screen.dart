import 'package:flutter/material.dart';
import 'package:flutter_meals/data/models/meal.dart';
import 'package:flutter_meals/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  final Function toggleFavarit;

  MealDetailScreen(this.toggleFavarit, {Key? key}) : super(key: key);

  static const routeName = 'meals_detail';

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = Dummy_Meals.firstWhere(
      (m) => m.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              IngredientsContainerWidget(meal: meal),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              StepsContainerWidget(meal: meal),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.toggleFavarit(mealId);
            isSelected = !isSelected;
          });
        },
        child: Icon(isSelected ? Icons.star : Icons.star_border),
      ),
    );
  }
}

class StepsContainerWidget extends StatelessWidget {
  const StepsContainerWidget({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        itemCount: meal.steps.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '# ${index + 1}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                title: Text(
                  meal.steps[index],
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}

class IngredientsContainerWidget extends StatelessWidget {
  const IngredientsContainerWidget({
    Key? key,
    required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        itemCount: meal.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber,
            child: Text(
              meal.ingredients[index],
              style: Theme.of(context).textTheme.caption,
            ),
          );
        },
      ),
    );
  }
}
