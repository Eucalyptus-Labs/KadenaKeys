import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/values/values.dart';
import '../../../widgets/url_text.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SvgPicture.asset(
            ImagePath.fullLogo,
            height: 64,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.w),
            child: Column(
              children: [
                Text(
                  Strings.descriptionHome,
                  style: Styles.textStyleLargeParagraph.copyWith(
                    color: CustomColors.light75,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                Strings.learnMore,
                style: Styles.textStyleLargeParagraph.copyWith(
                  color: CustomColors.light75,
                ),
              ),
              UrlText(
                url: Url.youtubeTutorial,
                text: Strings.here,
                style: Styles.textStyleLargeParagraph.copyWith(
                  color: CustomColors.light75,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                Strings.period,
                style: Styles.textStyleLargeParagraph.copyWith(
                  color: CustomColors.light75,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                Strings.sourceCode,
                style: Styles.textStyleLargeParagraph.copyWith(
                  color: CustomColors.light75,
                ),
              ),
              UrlText(
                url: Url.githubLink,
                text: Strings.here,
                style: Styles.textStyleLargeParagraph.copyWith(
                  color: CustomColors.light75,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                Strings.period,
                style: Styles.textStyleLargeParagraph.copyWith(
                  color: CustomColors.light75,
                ),
              ),
            ],
          ),
          const SizedBox(height: 55),
        ],
      );
}
