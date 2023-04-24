import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kadena_keys/constants/values/values.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  final url = Uri.parse(Url.readMe);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url ');
                  }
                },
                child: Text(
                  Strings.here,
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 55.h),
      ],
    );
  }
}
