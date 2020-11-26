import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/rendering.dart';

Widget settingsDrawer(BuildContext context) {
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
              "Settings",
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
              "Settings",
              style: TextStyle(
                color: TextColor,
              ),
            ),
            tileColor: BackgroundColor,
            selectedTileColor: SelectedButtonBackgroundColor,
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
