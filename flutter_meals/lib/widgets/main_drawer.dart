import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 90,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).accentColor,
            child: Text(
              'Main Menu',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTileMenu(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          ListTileMenu(context, 'Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }

  ListTile ListTileMenu(
      BuildContext context, String t, IconData i, VoidCallback f) {
    return ListTile(
      onTap: f,
      leading: Icon(
        i,
        size: 24,
        color: Colors.greenAccent,
      ),
      title: Text(
        t,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
