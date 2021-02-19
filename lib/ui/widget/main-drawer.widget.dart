import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/rendering.dart';
import 'package:feeltheburn/ui/pages/create-exercise.page.dart';
import 'package:feeltheburn/ui/pages/list-exercises.page.dart';
import 'package:feeltheburn/ui/pages/main.page.dart';

Widget mainDrawer(BuildContext context, int _selectedIndex) {

  final _divisor = Divider(
    color: Colors.white,
    indent: 40.0,
    endIndent: 40.0,
    thickness: 2.0,
  );

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
              "Home",
              style: TextStyle(
                color: TextColor,
                fontSize: 18.0,
              ),
            ),
            tileColor: BackgroundColor,
            selected: _selectedIndex == 0,
            selectedTileColor: SelectedButtonBackgroundColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );

            },
          ),

          _divisor,

          ListTile(
            title: Text(
              "Exercises",
              style: TextStyle(
                color: TextColor,
                fontSize: 18.0,
              ),
            ),
            tileColor: BackgroundColor,
            selected: _selectedIndex == 1,
            selectedTileColor: SelectedButtonBackgroundColor,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ListExercisesScreen()),
              );
            },
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
            selected: _selectedIndex == 2,
            selectedTileColor: SelectedButtonBackgroundColor,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreateExerciseScreen()),
              );

            },
          ),

          _divisor,

          ListTile(
            title: Text('v0.0.2',
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
