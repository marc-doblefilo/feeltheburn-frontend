import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create an exercise",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: cHeaderColor,
      ),
      body: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
