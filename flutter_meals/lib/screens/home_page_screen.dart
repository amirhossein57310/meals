import 'package:flutter/material.dart';
import 'package:flutter_meals/dummy_data.dart';
import 'package:flutter_meals/widgets/category_item.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children:
          Dummy_Data.map((d) => CategoryItem(d.id, d.title, d.color)).toList(),
    );
  }
}
