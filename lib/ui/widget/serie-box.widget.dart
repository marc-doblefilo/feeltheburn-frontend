import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeltheburn/ui/pages/program.page.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/models/serie.dart';
import 'dart:core';

Widget setContainer(BuildContext context, Serie set) {

  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 10.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            set.reps.toString() + " reps x " + set.series.toString() + " sets",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            set.exercise,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  );
}
