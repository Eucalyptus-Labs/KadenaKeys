import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFontFamilies {
  static const String inter = "Inter";
}

// Typography, Size, Color, Weight, Decoration
class AppTextTheme {
  static TextStyle inter24White700 = TextStyle(
    fontSize: 24.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamilies.inter,
  );

  static TextStyle inter18White700 = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamilies.inter,
  );

  static TextStyle inter16White700 = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamilies.inter,
  );

  static TextStyle inter18White400 = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamilies.inter,
  );

  static TextStyle inter16Grey400 = TextStyle(
    fontSize: 16.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamilies.inter,
  );

  static TextStyle inter16Grey400Underline = TextStyle(
    fontSize: 16.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    fontFamily: AppFontFamilies.inter,
  );

  static TextStyle inter14White500 = TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamilies.inter,
  );
}
