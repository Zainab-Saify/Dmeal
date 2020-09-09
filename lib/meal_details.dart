import 'package:flutter/material.dart';
import 'models/meals.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal m;

  MealDetailsScreen(this.m);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            m.title,
            style: TextStyle(color: Colors.white),
          ),
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
                  onPressed: () {},
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: 450,
                margin: EdgeInsets.all(10),
                child: Image(image: NetworkImage(m.imageUrl)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Duration : ",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "${m.duration} mins",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Complexity : ",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "${m.complexity}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Affordability : ",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "${m.affordability}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20, left: 10, bottom: 5),
                child: Text(
                  "Ingredients Required: ",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: m.ingredients.map((i) {
                        return Text(
                          i,
                          style: Theme.of(context).textTheme.headline3,
                        );
                      }).toList())),
              Divider(),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20, left: 10, bottom: 5),
                child: Text(
                  "Steps: ",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: m.steps.map((i) {
                        return Text(
                          i,
                          style: Theme.of(context).textTheme.headline3,
                        );
                      }).toList())),
            ],
          ),
        ));
  }
}
