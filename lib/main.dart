import 'package:Dmeal/Category_meals_display.dart';
import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'Category_meals_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DMeal",
      home: CategoriesScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: TextTheme().copyWith(
            bodyText1: TextStyle(color: Colors.grey[700]),
            headline1: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                fontWeight: FontWeight.bold),
            headline3: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
      ),
      routes: {
        CategoriesMealDisplayScreen.routeName: (ctx) =>
            CategoriesMealDisplayScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
      },
    );
  }
}
