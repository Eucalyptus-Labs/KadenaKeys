import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Typography, Size, Color, Weight, Decoration
class AppTextTheme {
  static TextStyle inter24White700 = GoogleFonts.inter(
    fontSize: 24.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle inter18White700 = GoogleFonts.inter(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle inter16White700 = GoogleFonts.inter(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle inter18White400 = GoogleFonts.inter(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle inter16Grey400 = GoogleFonts.inter(
    fontSize: 16.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle inter16Grey400Underline = GoogleFonts.inter(
    fontSize: 16.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static TextStyle inter14White500 = GoogleFonts.inter(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
