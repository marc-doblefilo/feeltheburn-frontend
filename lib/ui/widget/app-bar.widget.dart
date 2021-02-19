import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';

Widget customAppBar(String title) {
  return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: HeaderColor,
  );
}