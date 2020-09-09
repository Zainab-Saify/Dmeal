import 'package:Dmeal/Category_meals_display.dart';
import 'package:flutter/material.dart';
import 'categoryItem.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = './categoriesPage';

  void displayFavs(BuildContext context) {
    Navigator.of(context).pushNamed(CategoriesMealDisplayScreen.routeName,
        arguments: {'id': '', 'title': 'Favorities', 'fav': 'true'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(255, 254, 220, 1),
        appBar: AppBar(
          title: const Text('DMeal'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 50, left: 20),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(CategoriesScreen.routeName);
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColorDark,
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                    onPressed: () {},
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
        body: GridView(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 3 / 2),
            children: Dummy_Categories.map(
                (ct) => CategoryIteam(ct.title, ct.color, ct.id)).toList()));
  }
}
