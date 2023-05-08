import 'package:flutter/material.dart';

class SizeInfo {
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  // static int smallWidth = 360;
  static int mediumWidth = 768;
  // static int bigWidth = 1200;

  void init(BoxConstraints constraints, Orientation orientationArg) {
    orientation = orientationArg;

    screenHeight = constraints.maxHeight;
    screenWidth = constraints.maxWidth;

    // if (orientation == Orientation.portrait) {
    //   screenHeight = constraints.maxHeight;
    //   screenWidth = constraints.maxWidth;
    // }

    // if (orientation == Orientation.landscape) {
    //   screenHeight = constraints.maxWidth;
    //   screenWidth = constraints.maxHeight;
    // }
  }
}
