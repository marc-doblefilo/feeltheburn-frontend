import 'package:flutter/material.dart';

Widget listItem(String background, String title, int exercises, int time){
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 10.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(background),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "$exercises Exercises",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                "$time Minutes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
            ],
          ),
        ),
    );
}