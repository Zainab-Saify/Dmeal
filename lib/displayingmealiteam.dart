import 'package:Dmeal/meal_details.dart';
import 'package:flutter/material.dart';
import 'models/meals.dart';
import 'dummy_data.dart';

class DisplayMealIteam extends StatefulWidget {
  final Meal m;

  DisplayMealIteam(this.m);

  @override
  _DisplayMealIteamState createState() => _DisplayMealIteamState();
}

class _DisplayMealIteamState extends State<DisplayMealIteam> {
  Color favIconColor;

  Color setColor(Meal m) {
    if (FAV_MEALS.contains(m)) {
      return Theme.of(context).primaryColorDark;
    } else {
      return Colors.grey;
    }
  }

  void displayDetails(BuildContext context, Meal m) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MealDetailsScreen(m)));
  }

  void addToFav(m) {
    if (!FAV_MEALS.contains(m))
      FAV_MEALS.add(m);
    else
      FAV_MEALS.remove(m);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Stack(children: [
            FlatButton(
                onPressed: () => displayDetails(context, widget.m),
                child: ClipRRect(
                  child: Image(
                    image: NetworkImage(widget.m.imageUrl),
                  ),
                )),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    margin: EdgeInsets.only(left: 270),
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 15,
                          ),
                          onPressed: () {
                            setState(() {
                              favIconColor = Theme.of(context).primaryColorDark;
                              addToFav(widget.m);
                            });
                          },
                          color: setColor(widget.m),
                          focusColor: Theme.of(context).primaryColorDark,
                        )),
                  )
                ]),
            Positioned(
                bottom: 10,
                right: 20,
                child: Container(
                    color: Colors.black54,
                    width: 220,
                    padding: EdgeInsets.all(10),
                    child: Text(widget.m.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ))))
          ]),
          SizedBox(
            height: 5,
          ),
          Container(
              height: 30,
              width: 320,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: Colors.deepOrange[200],
                  border: Border.all(width: 0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.work,
                    size: 15,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.m.complexity.toString().substring(
                              11,
                            ),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "|",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Icon(
                    Icons.alarm,
                    size: 15,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.m.duration} mins",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "|",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Icon(
                    Icons.attach_money,
                    size: 15,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.m.affordability.toString().substring(14),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
