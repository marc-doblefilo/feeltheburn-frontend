import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/rendering.dart';
import 'package:feeltheburn/ui/pages/create-exercise.page.dart';

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
            child: Text(
              "Welcome to Feel The Burn",
              style: TextStyle(
                color: TextColor,
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
              ),
            ),
            decoration: BoxDecoration(
              color: HeaderColor,
            ),
          ),
          ListTile(
            title: Text(
              "Create an Exercise",
              style: TextStyle(
                color: TextColor,
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
        ],
      ),
    ),
  );
}
