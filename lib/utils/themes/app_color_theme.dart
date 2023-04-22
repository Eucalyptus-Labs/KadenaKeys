import 'package:flutter/material.dart';

Color darkContainer = hexToColor("#212121");
Color darkBackground = hexToColor("#1C1C1C");
Color darkElevatedButtonColor = hexToColor("#FF00CC");
Color derivedAccountItem = hexToColor("#171826");

Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}
