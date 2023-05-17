import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/values/values.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    required this.child,
    required this.bottomMargin,
    this.height,
    super.key,
  });

  final int? height;
  final double bottomMargin;
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: CustomColors.light02,
        ),
        padding: EdgeInsets.all(40.h),
        margin: EdgeInsets.only(bottom: bottomMargin),
        child: child,
      );
}
