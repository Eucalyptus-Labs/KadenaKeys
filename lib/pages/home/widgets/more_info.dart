import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/utils/themes/app_color_theme.dart';
import 'package:kadena_keys/utils/themes/app_text_theme.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 596.h,
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
                "More info",
                style: AppTextTheme.inter24White700,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "License",
                style: AppTextTheme.inter16White700,
              ),
              SizedBox(
                width: 688.w,
                child: Text(
                  lorem(
                    paragraphs: 2,
                    words: 100,
                  ),
                  style: AppTextTheme.inter16Grey400,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our other products",
                style: AppTextTheme.inter16White700,
              ),
              SizedBox(
                width: 688.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Koala Wallet",
                          style: AppTextTheme.inter16Grey400Underline,
                        ),
                        Text(
                          "Explorer",
                          style: AppTextTheme.inter16Grey400Underline,
                        ),
                        Text(
                          "Kadena Ecosystem",
                          style: AppTextTheme.inter16Grey400Underline,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
