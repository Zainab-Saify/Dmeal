import 'package:Dmeal/categories_screen.dart';
import 'package:Dmeal/displayingmealiteam.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoriesMealDisplayScreen extends StatefulWidget {
  static const String routeName = '/categories-meal-display';

  @override
  _CategoriesMealDisplayScreenState createState() =>
      _CategoriesMealDisplayScreenState();
}

class _CategoriesMealDisplayScreenState
    extends State<CategoriesMealDisplayScreen> {
  void displayFavs(BuildContext context) {
    Navigator.of(context).pushNamed(CategoriesMealDisplayScreen.routeName,
        arguments: {'id': '', 'title': 'Favorities', 'fav': 'true'});
  }

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedCategoryId = routesArgs['id'];
    final selectedCategoryTitle = routesArgs['title'];
    var displayFav = routesArgs['fav'];
    var categoryMeals;

    if (displayFav == 'true') {
      categoryMeals = FAV_MEALS;
    } else {
      categoryMeals = DUMMY_MEALS.where((dm) {
        return dm.categories.contains(selectedCategoryId);
      }).toList();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedCategoryTitle),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColorDark,
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(CategoriesScreen.routeName);
                    },
                    child: Text(
                      "categories",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
              Expanded(
                child: FlatButton(
                  child: Text(
                    'favorities',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  onPressed: () => displayFavs(context),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) => DisplayMealIteam(categoryMeals[index]),
          itemCount: categoryMeals.length,
        ));
  }
}
