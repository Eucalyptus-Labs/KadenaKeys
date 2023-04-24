import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/constants/values/values.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    required this.height,
    required this.child,
    super.key,
  });

  final int height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: CustomColors.light2,
      ),
      padding: EdgeInsets.all(40.h),
      child: child,
    );
  }
}