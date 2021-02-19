import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/rendering.dart';
import 'package:feeltheburn/ui/pages/create-exercise.page.dart';
import 'package:feeltheburn/ui/pages/list-exercises.page.dart';

Widget mainDrawer(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: BackgroundColor,
    ),
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Image.asset('assets/FTB-logo-orng.png'),
            decoration: BoxDecoration(
              color: HeaderColor,
            ),
          ),
          ListTile(
            title: Text(
              "Create an Exercise",
              style: TextStyle(
                color: TextColor,
                fontSize: 18.0,
              ),
            ),
            tileColor: BackgroundColor,
            selectedTileColor: SelectedButtonBackgroundColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateExerciseScreen()),
              );
            },
          ),
          ListTile(
            title: Text(
              "Exercises",
              style: TextStyle(
                color: TextColor,
                fontSize: 18.0,
              ),
            ),
            tileColor: BackgroundColor,
            selectedTileColor: SelectedButtonBackgroundColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListExercisesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('v0.0.1',
              style: TextStyle(
                color: TextColor,
                fontSize: 10.0,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
