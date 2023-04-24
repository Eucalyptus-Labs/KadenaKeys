import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/string_constants.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: "Kadena",
            style: AppTextTheme.inter18White700,
            children: [
              TextSpan(
                text: "Keys",
                style: AppTextTheme.inter18White400,
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            int maxLines = screenWidth >= 1200 ? 2 : 3;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.w),
              child: Text(
                StringConstants.descriptionHome,
                maxLines: maxLines,
                style: AppTextTheme.inter16Grey400,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
        SizedBox(height: 24.h),
        RichText(
          text: TextSpan(
            text: "You can ",
            style: AppTextTheme.inter16Grey400,
            children: [
              TextSpan(
                text: "learn more here",
                style: AppTextTheme.inter16Grey400Underline,
              ),
            ],
          ),
        ),
        SizedBox(height: 55.h),
      ],
    );
  }
}
