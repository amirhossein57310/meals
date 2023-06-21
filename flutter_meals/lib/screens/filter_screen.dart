import 'package:flutter/material.dart';
import 'package:flutter_meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(this.saveFilters, this.currentFilters, {Key? key})
      : super(key: key);

  static const routeName = 'filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

Widget _buildSwitchListTile(String title, String subTitle, bool currentValue,
    Function(bool) updateValue) {
  return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue);
}

bool isGlutenFree = false;
bool isLactosFree = false;
bool isVegan = false;
bool isVegetrian = false;

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluten']!;
    isLactosFree = widget.currentFilters['lactos']!;
    isVegan = widget.currentFilters['vegan']!;
    isVegetrian = widget.currentFilters['vegetrian']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context).textTheme.caption,
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': isGlutenFree,
                'lactos': isLactosFree,
                'vegan': isVegan,
                'vegetrian': isVegetrian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adgust your meal selection',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'GlutenFree',
                    'Only Gluten Free Meals',
                    isGlutenFree,
                    (newValue) {
                      setState(() {
                        isGlutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'LactosFree',
                    'Only Lactos Free Meals',
                    isLactosFree,
                    (newValue) {
                      setState(() {
                        isLactosFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'vegan',
                    'Only Vegan Free Meals',
                    isVegan,
                    (newValue) {
                      setState(() {
                        isVegan = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'vegetraian',
                    'Only Vegetrain Meals',
                    isVegetrian,
                    (newValue) {
                      setState(() {
                        isVegetrian = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
