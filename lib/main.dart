import 'package:feeltheburn/ui/widget/settings-drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/ui/widget/main-drawer.widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:feeltheburn/ui/pages/main.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feel The Burn',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: BackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: TextColor),
      ),
      home: MainScreen(),
    );
  }
}