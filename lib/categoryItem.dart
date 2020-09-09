import 'package:Dmeal/Category_meals_display.dart';
import 'package:flutter/material.dart';

class CategoryIteam extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryIteam(this.title, this.color, this.id);

  void navigateToMeals(BuildContext context, String selectedCategory) {
    Navigator.of(context).pushNamed(CategoriesMealDisplayScreen.routeName,
        arguments: {'id': id, 'title': title, 'fav': 'false'});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ))),
      onTap: () => navigateToMeals(context, id),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
