import 'package:flutter/material.dart';

import '../constants/values/values.dart';

class SizeInfo {
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;
  static late bool isMobile;
  static late bool isTablet;
  static late bool isLaptop;

  void init(BoxConstraints constraints, Orientation orientationArg) {
    orientation = orientationArg;

    screenHeight = constraints.maxHeight.roundToDouble();
    screenWidth = constraints.maxWidth.roundToDouble();

    // print("SizeInfo init");
    // print("screenHeight: $screenHeight");
    // print("screenWidth: $screenWidth");

    isMobile = screenWidth < Sizes.mobileWidth;
    isTablet = screenWidth < Sizes.tabletWidth;
    isLaptop = screenWidth < Sizes.laptopWidth;

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
