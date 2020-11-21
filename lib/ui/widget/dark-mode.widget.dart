import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:feeltheburn/util/colors.dart';

Widget darkModeButton() {
  return LiteRollingSwitch(
    iconOff: Icons.nights_stay,
    colorOff: darkModeBackgroundColor,
    iconOn: Icons.wb_sunny,
    colorOn: lightModeBackgroundColor,
    textSize: 16.0,
    onChanged: (bool state) {
      //Use it to manage the different states
      print('Current State of SWITCH IS: $state');
    },
  );
}