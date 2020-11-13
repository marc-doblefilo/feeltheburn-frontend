import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feel The Burn',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Feel The Burn'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}