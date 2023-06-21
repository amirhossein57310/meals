import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/meal_detail_screen.dart';
import 'package:flutter_meals/util/enums/affordibility_enum.dart';
import 'package:flutter_meals/util/enums/complexity_enum.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(this.id, this.title, this.imageUrl, this.duration,
      this.complexity, this.affordability,
      {Key? key})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Easy:
        return 'Simple';
      case Complexity.Middle:
        return 'not Hard';
      case Complexity.Hard:
        return 'Challenging';

      default:
        return 'unKnown';
    }
  }

  String get affordableText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'cheap';
      case Affordability.Pricy:
        return 'Pricy';
      case Affordability.Luxurios:
        return 'expensive';

      default:
        return 'unKnown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'rc',
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$duration min',
                        style: TextStyle(fontSize: 20, fontFamily: 'rc'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        complexityText,
                        style: TextStyle(fontSize: 20, fontFamily: 'rc'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        affordableText,
                        style: TextStyle(fontSize: 20, fontFamily: 'rc'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          MealDetailScreen.routeName,
          arguments: id,
        );
      },
    );
  }
}
