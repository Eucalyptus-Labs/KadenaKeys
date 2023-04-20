import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

class DerivedAccounts extends StatelessWidget {
  const DerivedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 772.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: darkContainer,
          ),
          padding: EdgeInsets.all(40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Derived accounts",
                    style: AppTextTheme.inter24White700,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
