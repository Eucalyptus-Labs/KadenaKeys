import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:kadena_keys/pages/home/home_controller.dart';
import 'package:kadena_keys/widgets/url_text.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Column(
          children: [
            const Text(
              Strings.homeTile,
              style: Styles.textStyleHeader4,
            ),
            SizedBox(height: 24.h),
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                int maxLines = screenWidth >= 1200 ? 2 : 3;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 140.w),
                  child: Text(
                    Strings.descriptionHome,
                    maxLines: maxLines,
                    style: Styles.textStyleLargeParagraph.copyWith(
                      color: CustomColors.light75,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.learnMore,
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                  ),
                ),
                UrlText(
                  url: Url.readMe,
                  text: Strings.here,
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 55.h),
          ],
        );
      },
    );
  }
}
